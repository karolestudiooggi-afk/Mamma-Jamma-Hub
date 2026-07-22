-- =====================================================================
--  BRAND HUB — tabela de feedback do cliente
--
--  Guarda os comentários/sugestões que o cliente deixa em cada seção
--  do Brand Hub. Fica no schema public (sem 406) e é aberta para
--  inserção pública (o cliente não faz login).
--
--  Rode no SQL Editor do MESMO Supabase do projeto.
-- =====================================================================

create table if not exists public.brand_hub_feedback (
  id          uuid primary key default gen_random_uuid(),
  section     text not null,                 -- qual seção (marca, cores, voz...)
  author      text,                          -- nome de quem comentou
  message     text not null,                 -- o comentário/sugestão
  status      text not null default 'aberto',-- aberto | resolvido
  created_at  timestamptz not null default now()
);

-- Índice para listar por seção rapidamente
create index if not exists brand_hub_feedback_section_idx
  on public.brand_hub_feedback (section, created_at desc);

-- ── Segurança (RLS) ──────────────────────────────────────────────────
alter table public.brand_hub_feedback enable row level security;

-- Qualquer um pode LER os comentários (é um mural aberto)
drop policy if exists "feedback_select_all" on public.brand_hub_feedback;
create policy "feedback_select_all"
  on public.brand_hub_feedback for select
  to anon, authenticated
  using (true);

-- Qualquer um pode INSERIR um comentário (cliente não loga)
drop policy if exists "feedback_insert_all" on public.brand_hub_feedback;
create policy "feedback_insert_all"
  on public.brand_hub_feedback for insert
  to anon, authenticated
  with check (
    -- proteções básicas contra abuso
    length(message) between 1 and 2000
    and length(coalesce(author, '')) <= 120
    and length(section) <= 60
  );

-- Só quem está LOGADO (a equipe Oggi) pode marcar como resolvido / editar
drop policy if exists "feedback_update_auth" on public.brand_hub_feedback;
create policy "feedback_update_auth"
  on public.brand_hub_feedback for update
  to authenticated
  using (true) with check (true);

-- Só logado pode apagar
drop policy if exists "feedback_delete_auth" on public.brand_hub_feedback;
create policy "feedback_delete_auth"
  on public.brand_hub_feedback for delete
  to authenticated
  using (true);

-- Permissões de tabela
grant select, insert on public.brand_hub_feedback to anon, authenticated;
grant update, delete on public.brand_hub_feedback to authenticated;

notify pgrst, 'reload schema';

select '✓ tabela brand_hub_feedback criada. O Brand Hub já pode receber comentários.' as resultado;
