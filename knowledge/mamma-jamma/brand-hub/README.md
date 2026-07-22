# Brand Hub — Mamma Jamma (com feedback do cliente)

Uma página visual que mostra tudo que a IA sabe sobre a Mamma Jamma, **e** deixa
o cliente comentar/sugerir mudanças em cada seção. Você sobe no ar, manda o link,
e recebe o feedback dele — que você gerencia no painel admin.

## Arquivos

- **`index.html`** → a página do Brand Hub (é isso que o cliente abre)
- **`admin.html`** → o painel onde a equipe Oggi vê e gerencia os comentários
- **`setup-feedback.sql`** → cria a tabela de comentários no Supabase
- **`assets/`** → logos e avatar

## Como colocar no ar (passo a passo)

### 1. Cria a tabela no Supabase
No SQL Editor do seu Supabase, rode o **`setup-feedback.sql`**. Cria a tabela
`brand_hub_feedback` (no schema public) com as permissões certas: qualquer um
pode comentar (o cliente não loga), só a equipe logada gerencia.

### 2. Configura a chave nos dois arquivos
Abra **`index.html`** e **`admin.html`** e, no topo do `<script>`, preencha:

```js
const SUPABASE_URL  = "https://SEU-REF.supabase.co";   // Settings → API → Project URL
const SUPABASE_ANON = "sua-chave-anon-public";          // Settings → API → anon public
```

> A chave `anon public` pode ficar no HTML — ela é feita para isso, é pública.
> A segurança vem das políticas (RLS) que o SQL criou, não do segredo da chave.

### 3. Sobe no ar
Joga a pasta `brand-hub/` em qualquer hospedagem estática:
- **GitHub Pages** (grátis): sobe no repositório, ativa Pages nas settings
- **Vercel / Netlify** (grátis): arrasta a pasta

O cliente acessa o `index.html`; você acessa o `admin.html` com seu login.

## Como funciona

- **Cliente:** abre o link, lê tudo, clica em "💬 Comentar" em qualquer seção,
  escreve o nome e a sugestão, envia. Aparece na hora.
- **Você:** abre o `admin.html`, entra com o login do Domani
  (`ai@estudiooggi.com`), vê todos os comentários agrupados, filtra por
  aberto/resolvido, marca como resolvido ou exclui.

## Depois de receber o feedback

Quando você for aplicar uma mudança que o cliente pediu, lembre de atualizar:
1. O conteúdo aqui no `index.html` (a parte visível)
2. O **`client-context.ts`** do projeto (o que a IA realmente usa)

Assim o que o cliente vê e o que a IA usa continuam iguais.
