// Fonte L1: §7.3 (p.12). L2: 5-data-dictionary (sinais vitais IoT).
// Regras comuns (category, effective, UCUM, device) vêm de MareiaObservationVital.
Profile: Atento60ObservationIotVital
Parent: MareiaObservationVital
Id: atento60-observation-iot-vital
Title: "Observação — Sinal vital por dispositivo IoT"
Description: "Sinal vital coletado por dispositivo IoT (esfigmomanômetro, glicosímetro, oxímetro, balança, estadiômetro, termômetro), codificado em LOINC."
* ^status = #active
* code from Atento60VitalLoincVS (extensible)
* subject only Reference(Atento60PatientElderly)
* device ^short = "Dispositivo IoT de origem (preferencialmente certificado ANVISA, via BLE)"
