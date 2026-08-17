# ADR-0002 — Stack L3: FHIR R4 + FSH/SUSHI + IG Publisher

- **Status:** Aceito (2026-06-22)

## Contexto
Precisamos gerar artefatos máquina-legíveis interoperáveis com o SUS Digital. O protocolo (§12)
já define **HL7 FHIR R4** com CID-10 e LOINC, e envio à RNDS.

## Decisão
- **FHIR R4 (4.0.1)** como versão base (compatível com RNDS).
- **FSH + SUSHI** como linguagem-fonte dos artefatos (legível, versionável, padrão WHO/HL7).
- **IG Publisher** (HL7) para gerar o site e rodar o QA.
- Dependências: `hl7.fhir.uv.sdc` (Questionnaire/score) e `hl7.fhir.uv.cpg` (PlanDefinition/Library).
- Template inicial: `fhir.base.template`. Migração futura para o template SMART da WHO é possível
  sem reescrever os FSH.

## Consequências
- (+) Pipeline reprodutível e validável; ecossistema maduro.
- (−) IG Publisher exige Java 11+ e download de pacotes (rede). Build de FSH (SUSHI) é leve e roda
  sem Java — usado como gate rápido.
