// Fonte L1: DAK §5.1 (dicionário ESAS). L2: 5-data-dictionary. REVISAR ADR-0004 (códigos LOINC).
Profile: FamiliarAtivaObservationEsasSymptom
Parent: Observation
Id: familiarativa-observation-esas-symptom
Title: "Observação — Sintoma ESAS (domínio individual)"
Description: "Registro de um domínio do formulário ESAS (dor, dispneia, ansiedade, cansaço, apetite ou bem-estar), com valor inteiro de 0 a 10 e código LOINC do dicionário de dados."
* ^status = #active
* status MS
* category = $obs-category#survey
* code MS
* code from FamiliarAtivaEsasLoincVS (required)
* subject 1..1 MS
* subject only Reference(FamiliarAtivaPatientPalliative)
* performer ^short = "Quem registrou: cuidador (RelatedPerson) ou o próprio paciente"
* effective[x] 1..1 MS
* effective[x] ^short = "Timestamp imutável do registro (UTC) — RF-PC01"
* value[x] only integer
* valueInteger MS
* valueInteger ^short = "Intensidade do sintoma (0–10)"
