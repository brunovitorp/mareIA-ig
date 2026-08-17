---
name: ig-build
description: Compila e valida o IG ATENTO 60+ (sushi + IG Publisher), revisa o QA e registra lições. Use após /fhir-generate ou para validar o estado atual.
---

# Skill: ig-build (compilar & validar)

Etapa final do pipeline.

## Como executar
Invoque o subagente **`ig-validator`**:
1. `sushi .` — gate obrigatório, **0 Errors**.
2. Build completo (se Java 11+): `./_updatePublisher.sh` (1ª vez) + `./_genonce.sh`.
3. Revisar `output/qa.html`; conferir critérios de aceite do PRD.
4. Registrar armadilhas em `docs/hard-earned-lessons.md`.

## Critério de pronto
- `sushi .` 0 erros; (com Java) site gerado com 0 erros de QA.
- Relatório honesto: se Java faltar, declarar e usar `sushi .` como gate.

Detalhes em `docs/cookbooks/build-ig.md`.
