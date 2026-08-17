// Fonte L1: Metodologia §7.7.3.4, Requisitos RN001. L2: 6-decision-logic.
Profile: ObservationCardioRisk
Parent: Observation
Id: atento-cardio-observation-risk
Title: "CardioRemoto — Observação de Estratificação de Risco"
Description: "Registra a classificação de risco e controle clínico do paciente (Verde, Amarelo, Vermelho)."
* status = #final
* code = CardioObsCodeCS#cardio-risk-score "Classificação de Risco Cardiovascular"
* subject 1..1
* subject only Reference(PatientCardio)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from CardioRiskVS (required)
