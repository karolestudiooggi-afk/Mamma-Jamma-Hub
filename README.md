# Domani Agentes — Mamma Jamma

Versão **especializada** da plataforma Domani, dedicada a **um único cliente: a Mamma Jamma**.

Mesma engine do Domani Social Hub (mesma interface Domani, laranja/chumbo), mas em vez de multi-cliente, o app abre já dentro da organização da Mamma Jamma, com a marca-raiz pré-carregada. Toda geração de conteúdo — textos, legendas, imagens — já sai no tom, nos insumos e nas regras da marca, sem o operador precisar configurar nada.

## O que torna "especialista"

O conhecimento da Mamma Jamma está embutido no sistema de IA:

- `supabase/functions/_shared/client-context.ts` — o "cérebro": tom de voz, DNA da marca, insumos reais (farinha 00, forno a lenha, fermentação 48h), regras invioláveis (a Mamma **não dá desconto**), direção visual.
- Esse contexto é injetado em **toda** chamada de IA (texto e imagem) automaticamente, via `_shared/ai.ts`.
- `knowledge/mamma-jamma/` — a base de conhecimento destilada do cliente (posicionamento, cardápio, mercado, identidade visual), para referência e futura expansão.

## Setup

Usa o **mesmo Supabase** da plataforma Domani. As tabelas são compartilhadas — a Mamma Jamma é uma organização dentro do banco.

1. **Banco:** se ainda não rodou, aplique `supabase/migrations/20260714000000_init_domani_social_hub.sql` (o mesmo da plataforma).
2. **Cliente:** rode `docs/SETUP-MAMMA-JAMMA.sql` — cria a organização Mamma Jamma, o usuário de acesso e a marca-raiz já preenchida.
3. **Schemas expostos:** Settings → API → Exposed schemas → `core`, `app_social`.
4. **Secrets** (Edge Functions → Secrets): `OPENAI_API_KEY`, `CRON_SECRET`, e as opcionais.
5. **Deploy:** `supabase functions deploy`.
6. **Front:** copie `.env.example` para `.env`, preencha o Supabase, e `npm install && npm run dev`.

## Acesso

- **Login:** `ai@estudiooggi.com`
- **Senha:** `oggi1234`

O app abre direto no dashboard, já como Mamma Jamma.

## Diferença para o Domani Social Hub

|  | Social Hub | Agentes (este) |
|---|---|---|
| Clientes | Vários, com seletor de marca | **Um só** (Mamma Jamma) |
| Marca | Criada pelo operador | **Pré-carregada** |
| IA | Genérica, guiada pela marca escolhida | **Especialista na Mamma Jamma** por padrão |
| Interface | Domani | Domani (igual) |

Para especializar em **outro** cliente: troque o conteúdo de `client-context.ts` e crie um SQL de setup análogo ao da Mamma Jamma.
