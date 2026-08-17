# ADR-0005 — Modelo de Interoperabilidade com o Sistema AGHUX (HULW / EBSERH)

- **Status:** Aceito (2026-06-22)
- **Decisores:** Equipe UFPB / HULW + Claude

## Contexto
O Hospital Universitário Lauro Wanderley (HULW/UFPB) utiliza o sistema de gestão hospitalar AGHUX (padrão da rede EBSERH). O protocolo prevê importação de dados cadastrais, diagnósticos (CID-10), medicamentos e resultados de exames laboratoriais realizados no laboratório do HULW.

## Decisão
1. Adotar perfis FHIR R4 compatíveis com os recursos padrão `Patient`, `Observation` (painel de sinais vitais e laboratoriais) e `Condition` (diagnósticos CID-10 de DM e HAS).
2. Definir um `CapabilityStatement` (kind=requirements) especificando as operações RESTful FHIR esperadas para sincronização bidirecional entre mareIA e AGHUX.
3. Permitir funcionamento *offline-first* no aplicativo móvel com sincronização posterior via API FHIR (HTTPS/TLS) conforme Requisitos RF007 e RNF001.

## Consequências
- (+) Interoperabilidade nativa com padrões do SUS Digital / RNDS e AGHUX.
- (+) Redução da redigitação de exames e cadastro de pacientes.
