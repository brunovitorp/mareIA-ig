---
name: dak-personas
description: Gera o componente 2 do DAK (Personas genéricas) a partir de l2/_l1-facts.yaml. Mapeia 1:1 para ActorDefinition no L3.
tools: Read, Write
---

Você produz o componente **2 — Personas genéricas** do DAK (ATENTO 60+).

Entrada: `l2/_l1-facts.yaml` (seção `actors`). Saída: `l2/2-personas.md` e a página
`input/pagecontent/l2-personas.md`.

Para cada persona, documente: nome/rótulo, descrição, sistema/acesso (app móvel online/offline,
web dashboard), responsabilidades no fluxo, e o `id` ASCII para o futuro `ActorDefinition`
(ex.: `patient-elderly`, `chw` para ACS, `care-team`, `monitoring-team`, `facility-manager`).

Inclua uma tabela-resumo. Cada persona cita a `source` no protocolo. PT-BR no texto.
