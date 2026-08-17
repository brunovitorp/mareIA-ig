---
name: l1-extract
description: Extrai os fatos clínicos do protocolo (L1) para l2/_l1-facts.yaml, base de todo o pipeline DAK. Use quando o protocolo em sources/ mudar ou para iniciar a adaptação.
---

# Skill: l1-extract (L1 → fatos normalizados)

Primeira etapa do pipeline agêntico do IG ATENTO 60+.

## Quando usar
- Início da adaptação, ou quando `sources/` (protocolo) for atualizado.

## Como executar
1. Garanta que `sources/_protocolo_extract.txt` existe (se só houver PDF, extraia com PyMuPDF e
   grave em UTF-8 — ver `docs/hard-earned-lessons.md` HEL-001).
2. Invoque o subagente **`l1-extractor`** (Agent tool, subagent_type `l1-extractor`).
3. Saída esperada: `l2/_l1-facts.yaml` com `recommendations, actors, data_elements,
   decision_rules, indicators, requirements`, cada item com `source`.

## Critério de pronto
- YAML válido; ambiguidades marcadas `status: review` + ADR; nada inventado além do protocolo.

## Próximo passo
`/dak-build`.
