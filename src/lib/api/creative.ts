import { getSupabaseUrl, baseHeaders } from "./_shared";
import type { Slide } from "@/components/studio/workspace/types";

export interface PosterBrand { name?: string; colors?: string[]; tone?: string; typography?: string }
export interface PosterResult { imageUrl: string; prompt: string }

/** Chama a edge function hub-poster (Ideogram/fal) e devolve a URL da arte gerada. */
export async function gerarArtePoster(
  brief: string,
  brand?: PosterBrand,
  aspect = "3:4",
): Promise<PosterResult> {
  let res: Response;
  try {
    res = await fetch(`${getSupabaseUrl()}/functions/v1/hub-poster`, {
      method: "POST",
      headers: await baseHeaders(),
      body: JSON.stringify({ brief, brand, aspect }),
    });
  } catch {
    throw new Error(
      "Não consegui falar com o servidor. A função hub-poster pode não estar publicada.",
    );
  }
  if (!res.ok) {
    let msg = `HTTP ${res.status}`;
    try { const e = await res.json(); msg = e.error || msg; } catch { /* */ }
    throw new Error(msg);
  }
  return res.json();
}

/** Gera a arte e devolve um Slide pronto (a imagem é o fundo; sem camadas editáveis). */
export async function gerarArtePosterSlide(brief: string, brand?: PosterBrand): Promise<Slide> {
  const { imageUrl } = await gerarArtePoster(brief, brand);
  return { bg: "#111111", bgImage: imageUrl, els: [] };
}
