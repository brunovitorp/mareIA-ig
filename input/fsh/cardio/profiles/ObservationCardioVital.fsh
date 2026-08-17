// Fonte L1: Metodologia §7.6.3.3, Requisitos RF005. L2: 5-data-dictionary.
Profile: ObservationCardioVital
Parent: Observation
Id: atento-cardio-observation-vital
Title: "CardioRemoto — Observação de Sinal Vital e Antropometria (IoT)"
Description: "Registra sinais vitais e medidas antropométricas obtidos por dispositivos IoT certificados ANVISA."
* status = #final
* category 1..*
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code from CardioVitalLoincVS (extensible)
* subject 1..1
* subject only Reference(PatientCardio)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 0..1
* value[x] only Quantity
