// Fonte L1: Anexo 15.6.3. L2: 5-data-dictionary, 6-decision-logic. REVISAR ADR-0004.
Profile: Atento60ObservationIvcfScore
Parent: Observation
Id: atento60-observation-ivcf-score
Title: "Observação — Escore e faixa de risco do IVCF-20"
Description: "Resultado do IVCF-20: escore total (valueInteger) e faixa de risco (componente)."
* ^status = #active
* status MS
* code = Atento60ObsCodeCS#ivcf-20-score
* code MS
* subject 1..1 MS
* subject only Reference(Atento60PatientElderly)
* effective[x] MS
* value[x] only integer
* valueInteger MS
* valueInteger ^short = "Escore total do IVCF-20 (0-40). REVISAR ADR-0004."
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains faixa 0..1 MS
* component[faixa].code = Atento60ObsCodeCS#ivcf-20-faixa
* component[faixa].value[x] only CodeableConcept
* component[faixa].valueCodeableConcept from Atento60IvcfRiskVS (required)
* component[faixa] ^short = "Faixa de risco derivada do escore (robusto / risco-fragilização / frágil)"
