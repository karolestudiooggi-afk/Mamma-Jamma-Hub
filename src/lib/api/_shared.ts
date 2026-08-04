/**
 * Internals compartilhados da camada de API (chamadas às Edge Functions).
 *
 * MUDANÇA IMPORTANTE: `baseHeaders()` agora envia o TOKEN DA SESSÃO do
 * usuário, não a anon key. As Edge Functions passaram a exigir um usuário
 * autenticado de verdade (antes qualquer um na internet chamava e gastava a
 * chave de IA do dono). Como consequência, `baseHeaders()` virou async.
 *
 * As credenciais vêm do .env — sem fallback embutido no código.
 */

import { supabase } from "@/integrations/supabase/client";
import { userStorage } from "@/lib/storage";
import type { AppConfig } from "@/types";

export function getSupabaseUrl(): string {
  const url = import.meta.env.VITE_SUPABASE_URL as string | undefined;
  if (!url) {
    throw new Error(
      "VITE_SUPABASE_URL não configurada. Copie .env.example para .env e preencha.",
    );
  }
  return url.replace(/\/$/, "");
}

export function getAnonKey(): string {
  const key =
    (import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY as string | undefined) ||
    (import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined);
  if (!key) {
    throw new Error(
      "VITE_SUPABASE_PUBLISHABLE_KEY não configurada. Copie .env.example para .env e preencha.",
    );
  }
  return key;
}

/** Config do usuário salva no localStorage (chaves de API, etc). */
export function getSavedConfig(): Partial<AppConfig> {
  try {
    const raw = userStorage.get("config");
    return raw ? JSON.parse(raw) : {};
  } catch {
    return {};
  }
}

/**
 * Headers para chamar uma Edge Function.
 * `apikey` identifica o projeto; `Authorization` carrega o JWT do usuário
 * logado — é ele que a função valida antes de gastar qualquer token pago.
 */
export async function baseHeaders(): Promise<Record<string, string>> {
  const { data } = await supabase.auth.getSession();
  const token = data.session?.access_token;

  if (!token) {
    throw new Error("Sessão expirada. Faça login novamente.");
  }

  return {
    "Content-Type": "application/json",
    apikey: getAnonKey(),
    Authorization: `Bearer ${token}`,
  };
}

/** URL completa de uma Edge Function pelo nome da pasta em supabase/functions/.
 *  O Mamma reusa as funções compartilhadas do projeto, que têm prefixo `hub-`.
 *  Nomes que já vêm com prefixo próprio (canva-, mamma-) são respeitados. */
export function fnUrl(name: string): string {
  const prefixed = /^(hub-|mamma-|canva-)/.test(name) ? name : `hub-${name}`;
  return `${getSupabaseUrl()}/functions/v1/${prefixed}`;
}
