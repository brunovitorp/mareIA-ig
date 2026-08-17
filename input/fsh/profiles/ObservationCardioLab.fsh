// Fonte L1: Metodologia §7.6.3.4, Requisitos RF005. L2: 5-data-dictionary.
Profile: ObservationCardioLab
Parent: Observation
Id: atento-cardio-observation-lab
Title: "CardioRemoto — Observação de Exame Laboratorial"
Description: "Registra os resultados dos exames laboratoriais especializados realizados no HULW (HbA1c, perfil lipídico, função renal)."
* status = #final
* category 1..*
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code from CardioLabLoincVS (extensible)
* subject 1..1
* subject only Reference(PatientCardio)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 0..1
* value[x] only Quantity
