# Mamma Jamma — Design System

> *Pizzeria Rustica. 16 anos, desde 2009.*

This is the official design system for **Mamma Jamma**, a chef-driven Italian restaurant group with 18 operations across four Brazilian cities (Rio de Janeiro, Niterói, Campinas, Salvador). It serves every surface where the brand lives: the website, the delivery app, social media, printed menus, in-store signage and campaign materials.

The system's job is to keep one voice across all of those touchpoints — artesanal, autoral, com personalidade, acolhedora. Tradição italiana **e** identidade brasileira juntas. Preto-e-branco no esqueleto, com verde-garrafa e dourado como detalhes ocasionais.

---

## Brand Snapshot

| | |
|---|---|
| **Positioning** | *Pizzeria Rustica.* Artesanal, autoral, cheia de personalidade. 16 anos. Tradição italiana **e** identidade brasileira juntas — hospitalidade calorosa, sabor artesanal. É uma anfitriã, não uma rede; um forno, não um conceito. |
| **Product** | Pizza scratch-made: farinha tipo 00 (*farina doppio zero*), tomate pelati selecionado, mozzarella fresca, azeites extravirgens, fermentação lenta de até 48h, forno a lenha, *macchia di leopardo* perfeita. Menu completo italo-brasileiro com capítulos de chefs convidadas. |
| **Footprint** | 18 operações em 4 praças: Rio, Niterói, Campinas, Salvador. Menus vary by praça. |
| **Authorship** | Menu by *chefs autores* **Raimundo Rodrigues** + **Felipe Biscuola**. Guest chapters by *chefs convidadas*: **Flávia Quaresma** ("Mamma Quaresma") and **Tati Lund** ("Giardino"). The system must visually distinguish these two tiers. |
| **Audience** | Classe A com alcance em B. Millennials and Gen Z urbanos. Famílias, casais, jovens adultos. Aspirational, not inaccessible. |
| **Channels** | mammajamma.com.br, delivery app, social, printed menu, in-store signage, campaign creative. |

---

## The Inviolable Rule

> **Nunca, jamais usar linguagem de desconto.**
>
> No "oferta," no "%," no "liquidação," no "dose dupla," no "só hoje," no "imperdível."
>
> Generosity is translated as hospitality, never as retail. The system replaces every discount banner with phrasing like:
> - **"Por nossa conta"**
> - **"Presente da casa"**
> - **"Para brindar conosco"**
>
> If a layout you're making needs a "promo banner," you are looking for the **"Por nossa conta" block** instead. There is a dedicated component for it.

---

## Sources & Provenance

This system was assembled from the following sources provided by the brand team:

| Source | Status |
|---|---|
| [site.mammajamma.com.br](https://site.mammajamma.com.br/) (marketing site — "A Mamma Jamma" + "Eventos") | ✅ Real site reviewed. Voice, IA and patterns reconciled. |
| [mammajamma.com.br/tabs/home](https://mammajamma.com.br/tabs/home) (delivery app) | Not deeply reviewed; the delivery kit interprets the brief. |
| `[Manual-Marca] Mamma Jamma.pdf` | **Referenced in brief but not delivered** — values transcribed from the written brief instead. Please re-attach so this system can be cross-checked against the official manual. |
| `Logo_Mamma-Horizontal-Preto.png` | ✅ Delivered, installed in `assets/logo-horizontal.png`. |
| `Logo_Mamma-Vertical-Preto.png` | ✅ Delivered, installed in `assets/logo-vertical.png`. |
| Eames Century Modern (Thin / Book / Regular / Medium / Bold .ttf + .otf) | ✅ Delivered, installed in `fonts/`. |
| Raleway (Thin → Heavy + Italic VF) | ✅ Delivered, installed in `fonts/`. |

If the original PDFs become available, drop them into `uploads/` and ask for a rebuild of `assets/`.

---

## Manifest

```
/  (this folder is the design system root)
├── README.md                  ← you are here
├── SKILL.md                   ← agent-skill manifest, for use in Claude Code
├── colors_and_type.css        ← single source of truth for color + type tokens
├── fonts/                     ← Eames Century Modern + Raleway (.ttf)
├── assets/
│   ├── logo-horizontal.png    ← official wordmark, horizontal (MAMMA JAMMA · PIZZERIA RUSTICA)
│   ├── logo-vertical.png      ← official wordmark, stacked
│   └── monogram-MJ.svg        ← derived compact mark for favicons / small placements
├── preview/                   ← cards rendered in the Design System tab
├── ui_kits/
│   ├── website/               ← marketing site (mammajamma.com.br)
│   └── delivery/              ← delivery / ordering app
└── uploads/                   ← original raw materials
```

---

## Content Fundamentals

### Voice
Acolhedora, calorosa, afetiva, com humor leve. A Mamma fala como uma anfitriã generosa, não como uma marca de varejo. É fluente em toques italianos mas nunca se fantasia de carícatura — **"mamma mia!" gratuito está banido.** O tom oficial vive em **português com pitadas de italiano em itálico**, não ao contrário.

A referência oficial é [site.mammajamma.com.br](https://site.mammajamma.com.br/). Quando em dúvida, leia uma página do site real para calibrar.

### Posicionamento
"Artesanal, autoral e cheio de personalidade." 16 anos (fundada em 2009 no Jardim Botânico). Tradição italiana **e** identidade brasileira juntas — hospitalidade calorosa, sabor artesanal. *Não* é "pizzaria italiana em Manhattan" no copy público, mesmo que o brief interno use essa referência visual.

### Casing & pontuação
- **Headlines** em sentence case (ou minúsculas para os momentos mais editoriais). Evitar ALL-CAPS para voz corrida.
- **Eyebrows** e **labels** em MAIÚSCULAS com tracking largo (`0.18em`–0.22em) — único lugar onde caps moram. Ex: NOSSA HISTÓRIA, NOSSAS CASAS, EVENTOS, SEGRETTI DELLA MAMMA.
- **Italianismos** ficam em itálico quando aparecem dentro do português: *sapore*, *fermentazione lenta*, *macchia di leopardo*, *per favore*, *un pezzo*, *cuore*.

### Pessoa
Primeira pessoa do plural ("nós", "nossa casa", "a Mamma") para a marca. Segunda pessoa do singular ("você") para o convidado. Nunca "o cliente". Nunca "users".

### Vocabulário patrimonial (português com variantes italianas)
Esta é a linguagem que a cozinha tem propriedade. Usar nas descrições de produto e About — é o que separa a Mamma da pizzaria da esquina:

*farinha tipo 00 (farina doppio zero) · fermentação lenta 48h (fermentazione lenta) · forno a lenha (forno a legna) · tomate pelati selecionado · macchia di leopardo · massa aerata · ingredienti selezionati a mano · hot box*

**Português é a base.** As versões em italiano são suplemento, para momentos de ênfase editorial — não substituto da fala normal.

### Patterns nomeados

O site oficial tem três patterns recorrentes que o sistema deve respeitar:

1. **SEGRETTI DELLA MAMMA #N — [título]** — vinhetas numeradas (#1–#7) que contam os princípios da cozinha (ingredientes, sem fatiar no delivery, farinha pura, fermentação lenta, macchia di leopardo, hot box, forno a lenha). Formato: eyebrow numerado em itálico-dourado + título display + parágrafo aconchegante. Componente: `ui_kits/website/SegrettiSection.jsx`.

2. **NOSSA HISTÓRIA** — seção de heritage. Sempre com o eyebrow assim, e o número de anos como marca tipográfica grande (atual: "16 anos"). Origem: 2009, Jardim Botânico. Componente: `NossaHistoria.jsx`.

3. **Presente da casa / Por nossa conta** — único lugar onde verde-garrafa lidera. Substitui qualquer banner promocional. Componente: `PorNossaContaBlock.jsx`.

### Italianismos (usar com parcimônia, em itálico)
*sapore · per favore · cuore · un pezzo · fermentazione lenta · selezionati a mano · macchia di leopardo · massa aerata*

E expressões do real-site que combinam PT+IT:
*"do jeitinho que a Itália gosta" · "abraço italiano" · "pura magia italiana" · "Mangia bene!"*

Uma por parágrafo, no máximo. Salpicar, não derramar.

### Emoji
**Nunca.** Nem no app, nem no site, nem em push, nem no menu. Calor se expressa em tipo, cor e copy — nunca em glyph Unicode.

### Exemplos de copy (bons — vindos do site real)

> **Artesanal, Autoral e Cheio de Personalidade.**  
> Na Mamma Jamma, cada pizza carrega história, técnica e um toque de ousadia. Usamos farinha italiana tipo "00", tomate pelati selecionado, mozzarella fresca e azeites extravirgens escolhidos com rigor. A massa descansa por até 48 horas, ganhando leveza e sabor.

> **SEGRETTI DELLA MAMMA #4 — *Fermentazione lenta* até 48h**  
> Aqui a massa não tem pressa: descansa como um bom italiano por até 48 horas. Borda crocante, miolo aerado, leveza na barriga e um perfume de forno a lenha que é pura magia italiana.

> **16 Anos de Sabor, Força e Afeto.**  
> A Mamma Jamma nasceu em 2009, no Jardim Botânico, inspirada pela força de uma mulher que acolhe, emociona e transforma tudo ao seu redor.

> **Para brindar conosco**  
> Hoje, uma taça de Chianti por nossa conta para quem pedir o menu della casa.

### Exemplos de copy (proibidos)

> ❌ "20% OFF — só hoje!"  
> ❌ "Dose dupla de pizza: leve 2, pague 1"  
> ❌ "MAMMA MIA, que oferta!"  
> ❌ "Promoção imperdível"  
> ❌ "Cosa serve al tavolo stasera?" (italianizado além do que a marca usa)  
> ❌ Qualquer emoji 🍕🇮🇹❤️

---

## Visual Foundations

### Palette

The palette is intentionally narrow and **mostly black-and-white-and-cream.** Nero, bianco, and crema do almost all the work. **Verde-garrafa** and **dourado** are occasional accents — used to differentiate signature moments (the "por nossa conta" panel, chef-convidada badge, primary signature CTA), never as a default surface or default heading color.

If you're reaching for verde because a headline "feels too plain in nero," stop. The default IS nero. Verde is the punctuation, not the body.

| Token | Value | Role | Frequency |
|---|---|---|---|
| `--mj-nero` | `#231f20` | **Headlines, body type, primary CTA, frame** | Dominant |
| `--mj-bianco` | `#fbf9f6` | Digital page background | Dominant |
| `--mj-crema` | `#ebdfc9` | Print + warm-section digital background | Frequent |
| `--mj-verde` | `#2b4f44` | Signature CTA, "por nossa conta" panel, praça pill | **Sparingly** |
| `--mj-oro` | `#c69633` | Chef-convidada badge, hairline rule (occasional), premium CTA | **Sparingly** |
| `--mj-teal` | `#143b3d` | Ambient / signage / dark mode | Rare |

**Default heading color is `--fg-1` (`#231f20`).** Use `<h2 class="accent-verde">` only when the headline is a signature moment — "Por nossa conta," "Mamma Quaresma," or a major hero on a dark surface.

### Type

- **Display: Eames Century Modern.** Used for headlines, prices, italianisms, marquee numbers. Italic is a *feature* of this family — lean into it for product names, chef signatures, and *italianisms*.
- **Body: Raleway.** Used for everything that isn't display. Light (300) for ledes, Regular (400) for body, SemiBold (600) for eyebrows and labels.
- **System fallback fonts: forbidden.** No Arial, no Inter, no system-ui. The font stack always falls back to Garamond / Helvetica Neue — *never* to system defaults.

### Backgrounds
- **Default surface** is off-white `--bg`. Most screens are this surface.
- **Warm sections** use cream `--bg-warm` to create rhythm between blocks. Use whenever a section needs to feel *al tavolo*-warm rather than gallery-cool.
- **Verde-garrafa panels** (`--bg-verde`) are reserved for hero / brand-defining moments. Headlines on verde panels are cream, never white-white.
- **Full-bleed photography** is the heaviest visual move available — desaturated, warm, low-key lit. Treat the page like a magazine spread.
- **No gradients** as primary background. The brand does not use purple-blue gradient slop. A subtle paper-grain texture overlay (5–8% opacity) on cream surfaces is permitted to evoke print.

### Animation
- **Easing:** `cubic-bezier(0.2, 0.6, 0.2, 1)` (standard) and `cubic-bezier(0.16, 1, 0.3, 1)` (out). Never bouncy/elastic.
- **Durations:** 140ms (state changes), 220ms (page transitions), 420ms (image reveals).
- **No spin, no bounce, no parallax-on-scroll.** The brand moves like a restaurant door — calmly, with intent.
- Reveal animations are fade + 8px upward translate. Nothing more.

### Hover / Press states
- **Primary (nero) buttons** lift to a soft drop shadow on hover — no color change, no scale. 140ms.
- **Verde signature buttons** darken to `--mj-verde-deep`. Same timing.
- **Cards** lift slightly to `--shadow-2`-plus and the optional gold rule beneath the title extends from 36px to 64px. That's the entire interaction.
- **Press:** inset 1px shadow, no scale, no color change.
- **Link underlines** are 1px gold, never blue. On hover, color stays nero and underline saturates from `--line-gold` to solid `--mj-oro`.

### Borders & dividers
- **Default divider** is `rgba(35,31,32,0.18)`, 1px, 36–64px wide. Quiet graphite.
- **The gold hairline rule** is an *occasional* accent, not a recurring system mark. Use it under section eyebrows on signature moments ("Por nossa conta," hero) and under the brand wordmark in the footer. Avoid using it on every card.

### Shadows
- Industrial, never soft retail puffs.
- `--shadow-1`: hairline edge for inputs.
- `--shadow-2`: default card.
- `--shadow-3`: floating modals.
- `--shadow-hover`: tinted with verde, not gray.

### Corner radii
Restrained.
- `2px` for inputs and chips (hairline, *not* pill).
- `4px` for buttons.
- `8px` for cards and image masks.
- `pill` ONLY for badges (chef-convidada, praça).

Never use `16px`+ rounded corners for primary surfaces — that reads as retail/SaaS.

### Cards
- 1px line in `--line` OR `--shadow-2` — never both at once.
- 8px corners.
- Generous internal padding (`--s-5` minimum on cards larger than 200px).
- Title is display family in **nero**, body in Raleway light/regular in graphite.
- Gold hairline rules are reserved for hero/signature surfaces — use a default graphite line on regular cards.
- Hover: lift to a slightly stronger shadow. No color change.

### Transparency & blur
Used only for overlays on imagery (e.g. dish title over a hot-box photo). Always `rgba(35, 31, 32, 0.55)` + `backdrop-filter: blur(8px)`. Never frosted-glass UI chrome — this is not iOS.

### Imagery
- **Warm, low-key, golden-hour.** Tungsten-leaning white balance.
- Slight grain (film, not noise) acceptable on hero shots.
- Ingredients photographed on dark surfaces — verde-garrafa, deep walnut, or matte black.
- No bright-flash overhead pizza shots. No top-down on white marble. That's competitor visual language.
- People in frame are dining, plating, or pouring — never posed grinning at the lens.

### Layout
- 12-column grid, 1240px container, 880px narrow for editorial reading.
- Gutters scale from 20px (mobile) to 64px (desktop) — generous whitespace is a brand value.
- Section rhythm alternates `--bg` and `--bg-warm`. Never two `--bg-warm` sections back-to-back.
- Section vertical padding is `--s-9` (96px) on desktop, `--s-7` (48px) on mobile. Don't crowd.

### Fixed elements
- **Top nav** is the only persistent surface. Sticky, 80px tall, transparent over hero, opaque cream after 60px scroll.
- **No** sticky CTAs, banners, chat bubbles, or cookie footer "deals."
- **Hot box order CTA** lives in the nav, not as a floating button.

---

## Iconography

The brand is **not icon-led.** Most surfaces communicate through type, color, and photography — iconography is restrained and serves wayfinding, not decoration.

### Where icons appear
- **Nav and footer:** delivery, reservation, locations.
- **Praça selector:** small geographic mark.
- **Order flow:** status indicators (hot box, motoboy, al tavolo).
- **Forms:** input affordances.

### System chosen
**[Phosphor Icons](https://phosphoricons.com/) — `regular` weight (1.5px stroke).** Loaded from CDN; this is a flagged substitution since the brand manual was not delivered. Phosphor's editorial-warm aesthetic + thin-line stroke matches the system's industrial-classical tone better than Heroicons or Lucide (both feel too SaaS).

```html
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<i class="ph ph-wine"></i>  <!-- example -->
```

**If the brand manual specifies a different icon set, replace `@phosphor-icons/web` everywhere and update this section.** Phosphor was chosen for stroke-weight harmony with Raleway Light/Regular.

### Custom marks
- **MJ monogram** (`assets/monogram-MJ.svg`) — for favicons, app icons, in-app loading states.
- **Hairline gold rule** — recurring "icon" of the brand; treat it as glyph.

### Emoji
**Banned.** Already covered in Content Fundamentals.

### Unicode glyphs as icons
Permitted very sparingly for typographic effect, in display family only:
- `·` (middle dot) as separator in inline meta
- `—` (em dash) as a visual breath in copy
- `*` for footnote / fine print marker
That's it.

---

## How to use this system

1. **Always import `colors_and_type.css`** at the root of your HTML, before any other stylesheet.
2. **Use semantic tokens** (`--fg-1`, `--bg-warm`, `--mj-verde`) — not raw hex values. The token layer is what lets the brand evolve.
3. **Reach for the components in `ui_kits/`** before building anything from scratch. Each kit is a pixel-accurate set of buildable pieces.
4. **When unsure, default to:** verde headline, cream surface, gold hairline rule, Raleway Light lede. That's the safest expression of the brand.
5. **Never invent new colors.** If you need an "almost-verde-but-lighter," it already exists as `--mj-verde-soft`. Check `colors_and_type.css` first.
6. **Default to nero, not verde.** Verde + oro are accents — if more than one element on a screen is verde, you've probably overused it.

---

## Index

| File | Purpose |
|---|---|
| [`colors_and_type.css`](./colors_and_type.css) | Tokens, type scale, semantic CSS variables. **Single source of truth.** |
| [`SKILL.md`](./SKILL.md) | Agent-skill manifest. Use this in Claude Code or any other coding agent. |
| [`assets/`](./assets/) | Logos, monogram. |
| [`fonts/`](./fonts/) | Eames Century Modern + Raleway font files. |
| [`preview/`](./preview/) | Cards rendered into the Design System tab. |
| [`ui_kits/website/`](./ui_kits/website/) | Marketing site components + sample home page. |
| [`ui_kits/delivery/`](./ui_kits/delivery/) | Delivery app components + sample order flow. |

---

*Salute. Bem-vindos à casa.*
