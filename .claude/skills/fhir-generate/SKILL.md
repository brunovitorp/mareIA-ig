---
name: fhir-generate
description: Converte os componentes do DAK (l2/*) em FHIR Shorthand (input/fsh/**) para o IG ATENTO 60+. Use após /dak-build.
---

# Skill: fhir-generate (L2 DAK → L3 FSH)

Terceira etapa do pipeline. Gera os artefatos FHIR.

## Pré-requisito
Componentes do DAK em `l2/*`.

## Como executar
Invoque o subagente **`fhir-author`**. Ordem recomendada (validar `sushi .` a cada grupo):
1. Terminologia: `input/fsh/codesystems/`, `input/fsh/valuesets/` (faixas IVCF-20, prioridade alerta).
2. Profiles: `input/fsh/profiles/` (Observation escore + sinais vitais IoT; Patient idoso).
3. Questionnaire IVCF-20 (SDC, 20 itens + escore) em `input/fsh/instances/`.
4. Lógica: `input/fsh/libraries/` (CQL) + PlanDefinition em `instances/`.
5. ActorDefinition (personas), Measure (indicadores), CapabilityStatement/Requirements.

Siga `docs/cookbooks/l2-to-l3-fhir.md` e as convenções do `CLAUDE.md`.

## Critério de pronto
- `sushi .` com 0 erros; cada FSH com cabeçalho de rastreabilidade; pendências marcadas `REVISAR`.

## Próximo passo
`/ig-build`.
