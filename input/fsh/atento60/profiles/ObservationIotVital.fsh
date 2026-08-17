// Fonte L1: §7.3 (p.12). L2: 5-data-dictionary (sinais vitais IoT).
Profile: Atento60ObservationIotVital
Parent: Observation
Id: atento60-observation-iot-vital
Title: "Observação — Sinal vital por dispositivo IoT"
Description: "Sinal vital coletado por dispositivo IoT (esfigmomanômetro, glicosímetro, oxímetro, balança, estadiômetro, termômetro), codificado em LOINC."
* ^status = #active
* status MS
* category = $obs-category#vital-signs
* code MS
* code from Atento60VitalLoincVS (extensible)
* subject 1..1 MS
* subject only Reference(Atento60PatientElderly)
* effective[x] MS
* value[x] only Quantity
* valueQuantity MS
* valueQuantity.system = $ucum
* device ^short = "Dispositivo IoT de origem (preferencialmente certificado ANVISA, via BLE)"
