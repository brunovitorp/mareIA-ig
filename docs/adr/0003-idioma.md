# ADR-0003 — Idioma dos artefatos

- **Status:** Aceito (2026-06-22)

## Contexto
O protocolo é PT-BR. FHIR convenciona ids/nomes técnicos em ASCII/inglês, mas suporta conteúdo
localizado.

## Decisão
- `language: pt-BR` no IG.
- **Conteúdo visível** (`title`, `description`, `display`, textos de `Questionnaire`, narrativa
  do IG) em **PT-BR**.
- **Identificadores técnicos** (`id`, `name`, nomes de FSH, URLs canônicas) em **ASCII/inglês**.
- Códigos de CodeSystems locais: código ASCII curto + `display` PT-BR.

## Consequências
- (+) IG legível para a equipe clínica brasileira; ids estáveis e válidos.
- (−) Dupla convenção exige atenção; mitigado por exemplos em `docs/cookbooks/`.
