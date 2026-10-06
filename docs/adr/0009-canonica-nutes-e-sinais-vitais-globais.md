# ADR-0009 — Canônica mareia.nutes.ufpe.br e sinais vitais globais com dispositivos IoT

- **Status:** Aceito (2026-10-05)
- **Decisores:** Bruno Pires (UFPE), mantenedor do IG
- **Substitui:** a parte de domínio da ADR-0008 (`mareia.saude.gov.br`)

## Contexto

O IG é publicado em `https://mareia.nutes.ufpe.br/ig`, mas declarava a canônica `https://mareia.saude.gov.br/ig` (ADR-0008), que não é servida. A plataforma é um app único em que qualquer cenário pode coletar sinais vitais, digitados ou recebidos de dispositivos. No IG, cada cenário tinha seu próprio perfil de sinal vital, com regras que divergiram (glicemia 2339-0 no ATENTO 60+ e 14743-9 no CardioRemoto), e não havia perfis para o dispositivo.

## Decisão

1. Canônica `https://mareia.nutes.ufpe.br/ig`. Todas as URLs do domínio (identificadores, publisher, páginas, BPMN, portal) passam para `mareia.nutes.ufpe.br`. Versão 0.2.0.
2. Perfil global `mareia-observation-vital` em `core/`. Os perfis de sinal vital dos cenários herdam dele e só acrescentam restrições próprias (paciente do cenário, subconjunto de códigos).
3. Perfis `mareia-device` (número de série e tipo SNOMED CT obrigatórios) e `mareia-devicemetric` (LOINC + UCUM, `source` → Device). A Observation aponta para o DeviceMetric em `device`.
4. Glicemia = LOINC 14743-9 (glicosímetro) em todos os cenários, digitada ou por aparelho.

## Consequências

- As URLs canônicas de todos os artefatos mudam. Sistemas que gravavam perfis com bases antigas continuam lendo os registros antigos por conta própria; novos registros usam a canônica nova.
- Um novo cenário que colete sinais vitais reutiliza o perfil global sem criar regras próprias.
- Quem integra dispositivos tem um contrato único (página "Sinais vitais e dispositivos IoT").
