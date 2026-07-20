---
arquivo: restricoes
camada: factual
status: 🟢 ok (guardrails de marca/linguagem fortes; governança do cliente PENDENTE)
confianca: alta
verificado_em: 2026-07-07
fontes: [posicionamento/manual-posicionamento-completo.txt, design-system/README.md, design-system/SKILL.md, design-system/_ds_manifest.json]
---

# restricoes.md — Mamma Jamma

🟢 **FACTUAL** — o que nunca dizer/fazer. Guardrail crítico para o squad. Só fato verificável das fontes.

## 🚫 A REGRA INVIOLÁVEL — nunca linguagem de desconto
> **"Nunca, jamais usar linguagem de desconto."** [design-system/README.md; SKILL.md; posicionamento §7]

- **Termos banidos:** `desconto` · `oferta` · `%` / "% OFF" · `liquidação` · `promoção` · `dose dupla` · `leve 2 pague 1` · `só hoje` · `imperdível` · qualquer chamada de urgência ou selo de preço. [design-system/README.md; posicionamento §7.2]
- **Generosidade = hospitalidade, nunca varejo.** Todo banner promocional é substituído por: [design-system/README.md; posicionamento §7.1]
  - ✅ "**Por nossa conta**"
  - ✅ "**Presente da casa**"
  - ✅ "**Para brindar conosco**"
- Existe **componente dedicado** para isso: o bloco *Por nossa conta* (`PorNossaContaBlock.jsx`) substitui qualquer "promo banner". Se um layout "precisa de banner de promoção", é esse bloco que se procura. [design-system/README.md]
- Princípio: "**A Mamma não vende por menos: ela oferece mais.** Nada de desconto — transformamos generosidade em pequenos gestos de hospitalidade." [posicionamento §7.1]

## 🚫 Linguagem — outros invioláveis
- **Sem emoji. Nunca.** Nem app, nem site, nem push, nem menu. "Calor se expressa em tipo, cor e copy — nunca em glyph Unicode." [design-system/README.md]
- **Sem "mamma mia!" gratuito** e sem caricatura italiana. A marca é fluente em italiano mas não se fantasia. [design-system/README.md]
- **Português é a base; italiano é tempero (em itálico), no máximo um por parágrafo.** Não inverter. Italianismo exagerado é proibido (ex.: ❌ "Cosa serve al tavolo stasera?" é italianizado além do que a marca usa). [design-system/README.md]
- **Pessoa:** 1ª pessoa do plural para a marca ("nós", "a Mamma", "nossa casa"); 2ª do singular para o convidado ("você"). **Nunca "o cliente". Nunca "users".** [design-system/README.md]
- **Não usar "pizzaria italiana em Manhattan" / nova-iorquino no copy público** — mesmo sendo referência do brief interno de 2023. O copy público é "Pizzeria Rustica", artesanal/autoral, tradição italiana **e** identidade brasileira. [design-system/README.md]
- **Sem cores agressivas de preço, sem selos de %** na arte; discrição visual (preto/off-white + detalhe dourado). Preços são **quietos, nunca gritados** (token `--t-price` pequeno, cor grafite). [posicionamento §7.2; colors_and_type.css]

## Marca e produto (o que a marca recusa)
- Recusa a estética de "pizzaria vermelha saturada", clichê tropeiro de pizzaria e "retail loud". [colors_and_type.css: "Never: red-saturated pizzeria tropes, discount language, retail loud"]
- Recusa fotografia de concorrente: flash chapado por cima, top-down em mármore branco. [design-system/README.md]
- Verde/dourado são acentos — **não** viram superfície ou cor de título padrão (o padrão é o nero). [design-system/README.md]

## Mídia e comunicação sensível
- **Álcool (aplica-se):** a marca tem programa de vinhos (40–50 rótulos) e coquetéis. → Comunicação de bebida alcoólica exige **consumo responsável** e observância às regras de plataforma (Meta/Google proíbem certos formatos/segmentações de álcool) e à legislação (CONAR / restrição a menores). ⚠️ Registrar regra prática específica do cliente (fonte: cliente/jurídico).
- ⚠️ PENDENTE — restrições contratuais/legais formais, termos de fornecedor proibidos, cláusulas de patrocínio. (fonte: cliente/jurídico)

## Pessoas / jurídico
- **Direito de imagem:** as fotos das "**Musas Reais**" (colaboradoras das casas) são usadas em material da marca — confirmar cessão/autorização de imagem das colaboradoras antes de reuso em mídia paga. ⚠️ (fonte: cliente/RH-jurídico) [manual-marca-2023.txt]
- **Chefs convidadas** (Flávia Quaresma, Tati Lund) — uso de nome/imagem atrelado às pizzas assinadas: confirmar termos de coautoria/uso antes de campanha. ⚠️ (fonte: cliente)

## Decisão e governança (cliente)
- ⚠️ PENDENTE — ponto focal de aprovação, quórum, SLA de retorno, o que exige comitê. (fonte: cliente)

## Operacional
- ⚠️ PENDENTE — janelas de produção (foto/vídeo) por unidade; restrições por praça (menus variam por praça). (fonte: cliente)

---
> Guardrail vivo: em caso de dúvida de tom, a referência oficial é `site.mammajamma.com.br` (ler uma página real para calibrar). [design-system/README.md]
