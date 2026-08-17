// Fonte L1: DAK §4.2 (etapa 4), §5.1 e §6.1. L2: 5-data-dictionary, 6-decision-logic. REVISAR ADR-0004.
Profile: FamiliarAtivaObservationEsasScore
Parent: Observation
Id: familiarativa-observation-esas-score
Title: "Observação — Soma ESAS e nível de risco"
Description: "Resultado consolidado de um registro ESAS: soma dos 6 domínios (valueInteger) e nível de risco derivado (componente), classificado como Baixo (0–30), Moderado (31–50) ou Alto (51–70)."
* ^status = #active
* status MS
* code = FamiliarAtivaObsCodeCS#esas-total-score
* code MS
* subject 1..1 MS
* subject only Reference(FamiliarAtivaPatientPalliative)
* effective[x] 1..1 MS
* effective[x] ^short = "Timestamp imutável do registro (UTC) — RF-PC01"
* value[x] only integer
* valueInteger MS
* valueInteger ^short = "Soma dos 6 domínios ESAS. Faixas até 70 no DAK, máximo aritmético 60 — REVISAR ADR-0004."
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains nivelRisco 0..1 MS
* component[nivelRisco].code = FamiliarAtivaObsCodeCS#esas-nivel-risco
* component[nivelRisco].value[x] only CodeableConcept
* component[nivelRisco].valueCodeableConcept from FamiliarAtivaEsasRiskVS (required)
* component[nivelRisco] ^short = "Nível de risco derivado da soma (baixo / moderado / alto)"
