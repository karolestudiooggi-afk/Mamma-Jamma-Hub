---
arquivo: visual
camada: factual
status: 🟢 ok (gold — design system completo com tokens, fontes e assets)
confianca: alta
verificado_em: 2026-07-07
fontes: [design-system/README.md, design-system/colors_and_type.css, design-system/_ds_manifest.json, brand-kit/manual-marca-2023.txt, posicionamento/manual-posicionamento-completo.txt]
---

# visual.md — Mamma Jamma

🟢 **FACTUAL** — brand kit atual (logo, cores, tipografia). A Mamma Jamma tem **dois artefatos visuais**: o **Manual de Marca 2023** (paleta base + fontes) e um **Design System completo e recente** (tokens CSS, componentes, UI kits) que amplia e é a referência viva. Ambos citados; divergências sinalizadas, não "corrigidas".

## Fontes do material visual
- `_fontes/brand-kit/manual-marca-2023.pdf` (+ .docx/.txt) — **Manual de Marca 2023**: define logo (horizontal/vertical), área de reserva, paleta oficial (Black + Off White), fontes da marca, uso de fotografia (halftone e "Musas Reais"). É o documento oficial base.
- `_fontes/design-system/` — **Design System Mamma Jamma** (export completo): `colors_and_type.css` (single source of truth de tokens), `README.md` (fundamentos de marca), `preview/` (cards de cor/tipo/componentes), `ui_kits/website/` e `ui_kits/delivery/` (componentes React), `assets/` (logos PNG + monograma), `fonts/` (Eames Century Modern + Raleway .ttf/.otf). Descritor: "Pizzeria Rustica. 16 anos, desde 2009."
  - ⚠️ **Frescor:** o README do design system anota que o `[Manual-Marca].pdf` "foi referenciado no brief mas não entregue" quando ele foi montado — ou seja, alguns valores foram transcritos do brief. **Agora temos o manual real em `_fontes/brand-kit/`** — os dois se confirmam nos pontos-chave (preto #231f20, off-white #fbf9f6, Eames + Raleway).

## Logotipo (oficial)
- **Wordmark:** "MAMMA JAMMA" + assinatura "**PIZZERIA RUSTICA**". [design-system/README.md; _ds_manifest.json]
- **Lockups disponíveis:**
  - **Horizontal** — `assets/logo-horizontal.png` (preto sobre claro) e `Logomarca_Mamma_Jamma_Branco.png` (branca sobre preto). [_ds_manifest.json]
  - **Vertical / empilhado** — `assets/logo-vertical.png`. [_ds_manifest.json]
  - **Monograma "M" / "MJ"** — ícone único para app icon, favicon, social, loading. (`avatar-M`, monograma derivado). [_ds_manifest.json]
- **Avatar "M"** — ícone de "M" (há versão vetor em PDF: `_fontes/design-system/uploads/Avatar-Vetor-Mamma Jamma.pdf`). [_ds_manifest.json]
- **Versões de cor:** positiva (preto sobre claro) e negativa (branca sobre preto). [manual-marca-2023.txt; _ds_manifest.json]

## Paleta oficial
**Base do Manual de Marca 2023** (âncoras invioláveis):
| Cor | RGB | CMYK | HEX | Uso |
|-----|-----|------|-----|-----|
| **Black** | 0, 0, 0 | 0/0/0/100 | **#231f20** | Cor âncora — títulos, corpo, fundos negativos |
| **Off White** | 251, 249, 246 | 1/1/2/1 | **#fbf9f6** | Fundo digital padrão |

> ⚠️ Fidelidade: o "Black" é rotulado CMYK 0/0/0/100 mas o HEX oficial é **#231f20** (preto levemente quente, não #000 puro) — registrado exatamente como no doc. O design system confirma: "*slightly warm black, not pure #000*". [manual-marca-2023.txt; colors_and_type.css]

**Acentos de assinatura (design system — amplia o manual):** preto-branco-creme fazem ~todo o trabalho; **verde e dourado são acentos ocasionais**, nunca superfície ou cor de título padrão. [design-system/README.md]
| Token | HEX | Papel | Frequência |
|-------|-----|-------|-----------|
| `--mj-nero` | #231f20 | Títulos, corpo, CTA primário, moldura | Dominante |
| `--mj-bianco` | #fbf9f6 | Fundo digital | Dominante |
| `--mj-crema` | #ebdfc9 | Fundo impresso + seção quente digital | Frequente |
| `--mj-verde` (verde-garrafa) | #2b4f44 | CTA de assinatura, painel "por nossa conta", pill de praça | **Com parcimônia** |
| `--mj-oro` (dourado) | #c69633 | Badge chef-convidada, filete hairline, CTA premium | **Com parcimônia** |
| `--mj-teal` | #143b3d | Ambiente / sinalização / dark mode | Raro |

> ⚠️ **Evolução da paleta (registro factual):** o Manual/Posicionamento **2023** citava "**teal profundo e amarelo dourado**" como acentos de decoração. O design system atual promove **verde-garrafa `#2b4f44`** a acento de **assinatura** e rebaixa o **teal `#143b3d`** a uso "raro/ambiente". A cor que hoje "lidera" nos momentos de assinatura (painel *Por nossa conta*, badge de chef convidada) é o **verde-garrafa**. [posicionamento §5.2, §6.1; design-system/README.md, colors_and_type.css]
- Regra de ouro do design system: "**O padrão É o nero. Verde é a pontuação, não o corpo.**" Se mais de um elemento na tela é verde, provavelmente foi usado demais. [design-system/README.md]
- Escala completa de tokens (nero 900→200, crema, verde-deep/soft/wash, oro light/deep/foil, linhas, sombras, etc.) documentada em `_fontes/design-system/colors_and_type.css`.

## Tipografia
- **Display: Eames Century Modern** (Thin/Book/Regular/Medium/Bold) — títulos, preços, italianismos, números-marquee. **O itálico é um recurso da família** — usar em nomes de produto, assinaturas de chef e *italianismos*. [colors_and_type.css; design-system/README.md]
- **Corpo: Raleway** (Thin→Heavy + Italic variable) — todo o resto. Light (300) para ledes, Regular (400) corpo, SemiBold (600) eyebrows/labels. [colors_and_type.css]
- **Fallback de sistema proibido** — nada de Arial/Inter/system-ui. Stack cai para Garamond / Helvetica Neue, nunca defaults do SO. [design-system/README.md]
- Arquivos das fontes entregues em `_fontes/design-system/fonts/` (.ttf/.otf). Confirma o Manual 2023: "Primária Eames Century Modern; Secundária Raleway". [manual-marca-2023.txt; posicionamento §5.2]

## Elementos de sistema (do design system)
- **Casing:** headlines em sentence case (ou minúsculas editoriais); MAIÚSCULAS só em eyebrows/labels com tracking largo (0.18em). [design-system/README.md]
- **Radii restritos:** 2px inputs/chips, 4px botões, 8px cards, pill só em badges. Nada de cantos ≥16px (lê como varejo/SaaS). [design-system/README.md]
- **Filete dourado (gold hairline rule):** acento ocasional recorrente (sob eyebrows de momentos de assinatura, wordmark no rodapé), não em todo card. [design-system/README.md]
- **Fotografia:** quente, low-key, golden-hour; ingredientes sobre superfícies escuras; **sem flash chapado por cima, sem top-down em mármore branco** (isso é linguagem de concorrente). Efeito **halftone** permitido (Manual 2023). Fotos das **"Musas Reais"** (colaboradoras das casas) usadas em decoração/material gráfico. [design-system/README.md; manual-marca-2023.txt]
- **Sem gradientes** como fundo primário; textura de papel sutil (5–8%) permitida em creme. [design-system/README.md]
- **Ícones:** marca não é icon-led; sistema substituto sinalizado = **Phosphor Icons** (regular, 1.5px) via CDN — flag de substituição até o set oficial ser definido. [design-system/README.md]

## Patterns nomeados (do site oficial, no design system)
- **SEGRETTI DELLA MAMMA #1–#7** — vinhetas numeradas com os princípios da cozinha (ver `ofertas.md`/`exemplos.md`). Componente `SegrettiSection.jsx`.
- **NOSSA HISTÓRIA** — seção de heritage com o nº de anos como marca tipográfica grande ("16 anos"; origem 2009, Jardim Botânico). Componente `NossaHistoria.jsx`.
- **Presente da casa / Por nossa conta** — único lugar onde o verde-garrafa lidera; substitui qualquer banner promocional. Componente `PorNossaContaBlock.jsx`.

## Pendências de ativo
- ⚠️ PENDENTE — **vetor editável** do wordmark completo (.ai/.svg/.eps). Temos PNGs (horizontal/vertical/branca) e o **Avatar-M em PDF vetor**; falta o lockup principal vetorizado. (fonte: cliente / agência criadora)
- ⚠️ PENDENTE — set de ícones oficial (hoje Phosphor é substituto sinalizado). (fonte: cliente)
- ✅ Fontes (Eames + Raleway) entregues; verificar **licença de uso comercial** da Eames Century Modern. (fonte: cliente)

---
> Direção visual nova / rebranding / sistema editorial de feed → estratégico; ver `marca.md` (PENDENTE). Aqui é o retrato do que já existe e é oficial.
