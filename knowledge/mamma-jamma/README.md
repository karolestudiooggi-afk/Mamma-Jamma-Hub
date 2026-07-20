# Base de Conhecimento — Mamma Jamma

Tudo que a IA do **Domani Agentes** sabe sobre a Mamma Jamma. Esta pasta é a
fonte da verdade do cliente: identidade, tom de voz, insumos, regras e assets.

## 👀 Comece por aqui: o Brand Hub visual

Abra **`brand-hub/index.html`** no navegador (é só dar duplo-clique).
É uma página visual e navegável que mostra, de forma bonita e organizada:
logos, paleta de cores, tipografia, tom de voz, a regra de ouro (sem desconto),
insumos reais, público — e **exatamente o que a IA usa** para gerar conteúdo.

É o material ideal para apresentar ao cliente: ele abre e vê, de cara, tudo
que alimenta o agente.

## Estrutura da pasta

```
brand-hub/          → 👀 a página visual (abra o index.html)
  index.html
  assets/           → logos e avatar usados na página
assets/             → logos oficiais (horizontal, vertical, branca) + avatar
design-system/      → tokens do design system (cores, tipografia) + manifest
posicionamento/     → textos-fonte do cliente (posicionamento, história, insumos)
*.md                → conteúdo destilado por tema (perfil, marca, público, etc.)
```

## Os arquivos de conteúdo (.md)

| Arquivo | O que tem |
|---|---|
| `marca.md` | Essência e posicionamento |
| `perfil.md` | Perfil completo da marca |
| `publico.md` | Público-alvo |
| `ofertas.md` | Cardápio e ofertas |
| `visual.md` | Identidade visual detalhada |
| `restricoes.md` | O que nunca fazer (a regra de ouro) |
| `mercado.md` | Contexto de mercado e concorrência |
| `exemplos.md` | Exemplos de conteúdo no tom certo |
| `brand-os.md` | Sistema operacional da marca |

## Importante: onde a IA realmente lê

O conteúdo desta pasta é a **referência humana**. O que a IA de fato usa em
tempo de geração está em:

```
supabase/functions/_shared/client-context.ts
```

Esse arquivo é o contexto injetado em toda geração de texto e imagem. Se mudar
algo essencial da marca, atualize **os dois**: o `client-context.ts` (o que a IA
usa) e esta pasta (a referência visível). O Brand Hub mostra um resumo do que
está no `client-context.ts`.
