// Fonte L1: Metodologia §7.6.3.3, Requisitos RF005. L2: 5-data-dictionary.
// Regras comuns (category, effective, UCUM, device) vêm de MareiaObservationVital.
Profile: ObservationCardioVital
Parent: MareiaObservationVital
Id: atento-cardio-observation-vital
Title: "CardioRemoto — Observação de Sinal Vital e Antropometria (IoT)"
Description: "Registra sinais vitais e medidas antropométricas obtidos por dispositivos IoT certificados ANVISA."
* status = #final
* code from CardioVitalLoincVS (extensible)
* subject only Reference(PatientCardio)
