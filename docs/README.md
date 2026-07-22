# Documentação — Domani Agentes (Mamma Jamma)

## Guias

**`COMO-FAZER-O-BACKEND-FUNCIONAR.md`**
Passo a passo do deploy: publicar as Edge Functions e configurar as chaves.
Consulte quando algo parar de funcionar no servidor.

**`POSTFORME_API_MAP.md`** e **`postforme-openapi.json`**
Referência da API do Post for Me (publicação nas redes).

**`STUDIO_IMPROVEMENTS.md`**
Backlog de melhorias do Studio.

## SQL reutilizável

**`SETUP-MAMMA-JAMMA.sql`**
Cria (ou atualiza) o acesso do cliente: usuário, organização e a marca-raiz
da Mamma Jamma já preenchida. Rode de novo para trocar a senha.

---

As migrações já aplicadas foram removidas — o estado do banco está em
`supabase/migrations/`.

## Onde a IA se alimenta do cliente

- `supabase/functions/_shared/client-context.ts` — o contexto da Mamma Jamma
  (tom de voz, insumos, regras) injetado em toda geração.
- `knowledge/mamma-jamma/` — a base de conhecimento completa do cliente.
  Abra `knowledge/mamma-jamma/brand-hub/index.html` no navegador para ver
  tudo de forma visual.
