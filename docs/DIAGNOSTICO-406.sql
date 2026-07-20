-- =====================================================================
--  DIAGNÓSTICO DO 406 — por que o painel não salva
--  Rode no SQL Editor. Cada linha diz OK ou o problema.
-- =====================================================================

-- 1) O schema core existe?
select '1. schema core' as check,
  case when count(*) = 1 then '✓ existe' else '✗ NÃO existe — rode o banco-completo.sql' end as resultado
from information_schema.schemata where schema_name = 'core';

-- 2) A função create_org_for_user existe no core?
select '2. função create_org_for_user' as check,
  case when count(*) >= 1 then '✓ existe' else '✗ NÃO existe — rode o banco-completo.sql' end as resultado
from information_schema.routines
where routine_schema = 'core' and routine_name = 'create_org_for_user';

-- 3) O papel 'authenticated' pode EXECUTAR a função? (causa comum do 406)
select '3. permissão de execução' as check,
  case when has_function_privilege('authenticated', p.oid, 'execute')
       then '✓ authenticated pode executar'
       else '✗ SEM permissão — é ISTO. Rode o GRANT abaixo (bloco 5)' end as resultado
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'core' and p.proname = 'create_org_for_user'
limit 1;

-- 4) O role 'authenticated' tem USAGE no schema core?
select '4. usage no schema core' as check,
  case when has_schema_privilege('authenticated', 'core', 'usage')
       then '✓ tem usage'
       else '✗ SEM usage — rode o GRANT abaixo (bloco 5)' end as resultado;

-- =====================================================================
-- 5) CORREÇÃO — se o item 3 ou 4 deu ✗, rode isto:
-- =====================================================================
grant usage on schema core to authenticated, anon, service_role;
grant usage on schema app_social to authenticated, anon, service_role;

grant execute on function core.create_org_for_user(text) to authenticated;
grant execute on function core.current_org_id() to authenticated;
grant execute on function core.is_org_member(uuid) to authenticated;
grant execute on function core.is_org_admin(uuid) to authenticated;

-- força o PostgREST a recarregar
notify pgrst, 'reload schema';

select '✓ correção aplicada — recarregue o app (Ctrl+Shift+R) e teste' as resultado;
