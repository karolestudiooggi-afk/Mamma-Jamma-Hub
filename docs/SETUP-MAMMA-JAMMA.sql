-- =====================================================================
--  DOMANI AGENTES — SETUP DO CLIENTE "MAMMA JAMMA"
-- =====================================================================
--
--  Cria, no MESMO Supabase da plataforma:
--    • a organização "Mamma Jamma"
--    • o usuário de acesso (mesmo login da plataforma: ai@estudiooggi.com)
--    • o perfil de marca da Mamma Jamma já preenchido (tom, insumos, cores,
--      palavras a evitar) — para o app abrir especializado no cliente
--
--  PRÉ-REQUISITO: o banco já precisa existir (rode o domani-banco-completo.sql
--  antes — o mesmo da plataforma; as tabelas são compartilhadas).
--
--  Pode rodar mais de uma vez (idempotente).
--
--  ⚠️ Confira o e-mail abaixo — aqui está "estudiooggi" (dois 'g'),
--     diferente do "estudioogi" usado antes. Ajuste se necessário.
-- =====================================================================

do $$
declare
  v_email    text := 'ai@estudiooggi.com';
  v_password text := 'oggi1234';
  v_nome     text := 'Estúdio Oggi — Mamma Jamma';
  v_org_nome text := 'Mamma Jamma';

  v_user_id uuid;
  v_org_id  uuid;
begin
  create extension if not exists pgcrypto with schema extensions;

  -- ── Usuário ────────────────────────────────────────────────────────
  select id into v_user_id from auth.users where email = lower(v_email);

  if v_user_id is null then
    v_user_id := gen_random_uuid();

    insert into auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, raw_app_meta_data, raw_user_meta_data,
      created_at, updated_at,
      confirmation_token, recovery_token, email_change, email_change_token_new
    ) values (
      '00000000-0000-0000-0000-000000000000', v_user_id,
      'authenticated', 'authenticated', lower(v_email),
      extensions.crypt(v_password, extensions.gen_salt('bf')),
      now(),
      '{"provider":"email","providers":["email"]}'::jsonb,
      jsonb_build_object('full_name', v_nome),
      now(), now(), '', '', '', ''
    );

    -- identidade de e-mail (sem isto, login falha com "Invalid credentials")
    insert into auth.identities (
      id, user_id, provider_id, provider, identity_data,
      last_sign_in_at, created_at, updated_at
    ) values (
      gen_random_uuid(), v_user_id, v_user_id::text, 'email',
      jsonb_build_object('sub', v_user_id::text, 'email', lower(v_email),
                         'email_verified', true, 'phone_verified', false),
      now(), now(), now()
    );
  else
    update auth.users
    set encrypted_password = extensions.crypt(v_password, extensions.gen_salt('bf')),
        email_confirmed_at = coalesce(email_confirmed_at, now()),
        updated_at = now()
    where id = v_user_id;
  end if;

  insert into core.profiles (user_id, email, full_name)
  values (v_user_id, lower(v_email), v_nome)
  on conflict (user_id) do update set email = excluded.email;

  -- ── Organização "Mamma Jamma" ──────────────────────────────────────
  select m.org_id into v_org_id
  from core.memberships m
  join core.organizations o on o.id = m.org_id
  where m.user_id = v_user_id and o.name = v_org_nome
  limit 1;

  if v_org_id is null then
    insert into core.organizations (name, kind)
    values (v_org_nome, 'client')
    returning id into v_org_id;

    insert into core.memberships (org_id, user_id, role)
    values (v_org_id, v_user_id, 'admin')
    on conflict (org_id, user_id) do nothing;
  end if;

  insert into app_social.user_roles (org_id, user_id, role)
  values (v_org_id, v_user_id, 'admin')
  on conflict (org_id, user_id, role) do nothing;

  -- config: já com onboarding concluído (abre direto no dashboard)
  insert into app_social.user_configs (org_id, user_id, brand_name, onboarding_completed)
  values (v_org_id, v_user_id, 'Mamma Jamma', true)
  on conflict (org_id) do update
    set onboarding_completed = true, brand_name = 'Mamma Jamma',
        user_id = coalesce(app_social.user_configs.user_id, excluded.user_id);

  -- ── Perfil de marca da Mamma Jamma (o "especialista") ──────────────
  -- Semeia a marca-raiz com o conhecimento do cliente. Se já existir uma
  -- marca com esse nome nesta org, não duplica.
  if not exists (
    select 1 from app_social.brand_profiles
    where org_id = v_org_id and name = 'Mamma Jamma'
  ) then
    insert into app_social.brand_profiles (
      org_id, user_id, name, description, tone, target_audience, industry,
      keywords, avoid_words, values, colors, is_default, system_prompt
    ) values (
      v_org_id, v_user_id,
      'Mamma Jamma',
      'Pizzeria Rustica italiana artesanal, desde 2009 (Grupo Noz). Italianidade afetiva e alta gastronomia acessível. Forno a lenha, farinha 00, fermentação lenta até 48h.',
      'acolhedor, afetivo, sofisticado, com italianidade leve',
      'Apreciadores de cozinha italiana contemporânea, socializadores, famílias classe A/B que buscam casual dining elevado e experiências afetivas.',
      'Restaurante / Pizzaria artesanal',
      array['pizza artesanal','forno a lenha','farinha 00','fermentação lenta','scratch-made','italianidade','afeto','casual dining','vinhos'],
      array['desconto','promoção','off','só hoje','imperdível','corra','barato','liquidação'],
      'Italianidade afetiva; força e acolhimento femininos; comer como ato de afeto; qualidade nos detalhes; hospitalidade; comida feita do zero.',
      array['#231f20','#fbf9f6','#ebdfc9','#2b4f44','#c69633'],
      true,
      'Você é o agente de conteúdo da Mamma Jamma. Tom acolhedor, afetivo, italianidade leve. A Mamma NÃO dá desconto — oferece "presentes da casa". Lastreie descrições em insumos reais (farinha 00, forno a lenha, fermentação 48h). Nunca use linguagem de barganha.'
    );
  end if;

  raise notice '── MAMMA JAMMA PRONTA ────────────────────';
  raise notice '   login : %', lower(v_email);
  raise notice '   senha : %', v_password;
  raise notice '   org   : % (%)', v_org_nome, v_org_id;
  raise notice '──────────────────────────────────────────';
end $$;

-- Conferência
select
  o.name as organizacao,
  u.email,
  count(i.id) as identidades,
  bp.name as marca,
  uc.onboarding_completed as onboarding_ok
from auth.users u
left join auth.identities i on i.user_id = u.id
left join core.memberships m on m.user_id = u.id
left join core.organizations o on o.id = m.org_id and o.name = 'Mamma Jamma'
left join app_social.user_configs uc on uc.org_id = o.id
left join app_social.brand_profiles bp on bp.org_id = o.id and bp.name = 'Mamma Jamma'
where u.email = 'ai@estudiooggi.com'
group by o.name, u.email, bp.name, uc.onboarding_completed;
