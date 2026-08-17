---
name: dak-build
description: Constrói os 9 componentes do DAK (L2) a partir de l2/_l1-facts.yaml, gerando l2/* e as páginas input/pagecontent/l2-*.md. Use após /l1-extract.
---

# Skill: dak-build (L1-facts → DAK L2)

Segunda etapa do pipeline. Produz o Digital Adaptation Kit do ATENTO 60+.

## Pré-requisito
`l2/_l1-facts.yaml` (de `/l1-extract`).

## Como executar
Faça fan-out dos subagentes (podem rodar em paralelo onde não há dependência):
- `dak-personas` → `l2/2-personas.md`
- `dak-user-scenarios` → `l2/3-user-scenarios.md` (depende de personas)
- `dak-bpmn` → `l2/4-business-process.{md,bpmn}`
- `dak-data-dictionary` → `l2/5-data-dictionary.csv`
- `dak-decision-logic` → `l2/6-decision-logic.{csv,dmn}` (depende do dicionário)
- `dak-indicators` → `l2/7-indicators.csv`
- `dak-requirements` → `l2/8-requirements.md`

Componente 1 (intervenções) e 9 (cenários de teste): redija a partir do `_l1-facts.yaml` em
`l2/1-interventions.md` e `l2/9-test-scenarios.md`.

Cada subagente também escreve a página correspondente em `input/pagecontent/l2-*.md`.

## Critério de pronto
- 9 componentes presentes; rastreabilidade `source` em cada item; pendências em ADR-0004/0005.

## Próximo passo
`/fhir-generate`.
