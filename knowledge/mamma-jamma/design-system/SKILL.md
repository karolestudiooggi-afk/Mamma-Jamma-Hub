---
name: mamma-jamma-design
description: Use this skill to generate well-branded interfaces and assets for Mamma Jamma (Pizzeria Rustica — Rio · Niterói · Campinas · Salvador), either for production or throwaway prototypes/mocks/etc. Contains essential design guidelines, colors, type, fonts, assets, and UI kit components for prototyping.
user-invocable: true
---

Read the `README.md` file within this skill, and explore the other available files.

This is the design system for **Mamma Jamma**, a Brazilian-Italian restaurant group ("Pizzeria Rustica") founded in 2009 in the Jardim Botânico, Rio de Janeiro. The brand is artesanal, autoral, com personalidade — acolhedora, warm, and chef-led. The visual system is mostly black-and-white, with verde-garrafa and dourado as occasional accents only.

> **Never use the language of discount.** No "oferta," "%," "liquidação," "só hoje," "imperdível." Generosity is always translated as hospitality: *por nossa conta · presente da casa · para brindar conosco.*

If creating visual artifacts (slides, mocks, throwaway prototypes, etc.), copy assets out of this folder and create static HTML files for the user to view. If working on production code, you can copy assets and read the rules here to become an expert in designing with this brand.

If the user invokes this skill without any other guidance, ask them what they want to build or design, ask some questions (audience, surface, praça, whether they need to distinguish chef autor vs chef convidada, etc.), and act as an expert designer who outputs HTML artifacts *or* production code, depending on the need.

## Where to start

- `README.md` — full brand context, voice, visual foundations, iconography.
- `colors_and_type.css` — **single source of truth.** Always import this first.
- `fonts/` — Eames Century Modern (display) + Raleway (body).
- `assets/` — logos and monogram.
- `preview/` — reference cards: type, color, spacing, components, brand.
- `ui_kits/website/` — marketing-site components + composed home page.
- `ui_kits/delivery/` — mobile delivery app with five click-thru screens.

## House defaults

When in doubt: **nero headline** (`#231f20`), cream or off-white surface, default graphite hairline divider, Raleway Light lede. Verde and oro enter only as occasional accents (signature CTA, "por nossa conta" panel, chef-convidada badge, gold rule on hero/signature moments). Italianisms in italic display family. No emoji. No saturated red. No gradients as primary background. No retail rounded corners larger than 8px on surfaces.

*Salute.*
