-- =====================================================================
--  CORREÇÃO DEFINITIVA DO 406 — Domani Agentes / Social Hub
--
--  O problema: chamar uma RPC no schema `core` via API (PostgREST) dá 406
--  de forma teimosa, mesmo com o schema exposto e as permissões certas.
--  É uma limitação chata do PostgREST com schemas secundários.
--
--  A solução: expor as funções essenciais também no schema `public`
--  (que SEMPRE funciona na API) e no `app_social` (onde o app já conecta).
--  Elas apenas repassam a chamada para as funções reais em `core`.
--
--  Rode isto no SQL Editor. É idempotente (pode rodar mais de uma vez).
-- =====================================================================

-- ── Espelhos em app_social (o schema padrão do app) ──────────────────

create or replace function app_social.create_org_for_user(_name text default 'Domani')
returns uuid
language sql volatile security definer set search_path = ''
as $$ select core.create_org_for_user(_name); $$;

create or replace function app_social.current_org_id()
returns uuid
language sql stable security definer set search_path = ''
as $$ select core.current_org_id(); $$;

-- ── Espelhos em public (fallback universal) ──────────────────────────

create or replace function public.create_org_for_user(_name text default 'Domani')
returns uuid
language sql volatile security definer set search_path = ''
as $$ select core.create_org_for_user(_name); $$;

-- ── Permissões ───────────────────────────────────────────────────────

grant usage on schema core       to authenticated, anon, service_role;
grant usage on schema app_social to authenticated, anon, service_role;
grant usage on schema public     to authenticated, anon, service_role;

grant execute on function core.create_org_for_user(text)        to authenticated;
grant execute on function app_social.create_org_for_user(text)  to authenticated;
grant execute on function app_social.current_org_id()           to authenticated;
grant execute on function public.create_org_for_user(text)      to authenticated;

-- recarrega a API
notify pgrst, 'reload schema';

select '✓ espelhos criados. Recarregue o app (Ctrl+Shift+R) e teste salvar.' as resultado;
