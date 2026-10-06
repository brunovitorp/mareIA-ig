// Spec 3.1. Base de todo sinal vital / medida antropométrica da plataforma, digitado ou por dispositivo.
Profile: MareiaObservationVital
Parent: Observation
Id: mareia-observation-vital
Title: "mareIA — Sinal vital (base global)"
Description: "Perfil base de sinal vital e medida antropométrica, comum a todos os cenários da plataforma mareIA. A medida pode ser digitada pelo profissional ou recebida de um dispositivo; neste caso, `device` aponta para o DeviceMetric do aparelho."
* ^status = #active
* status MS
* category 1..* MS
* category = $obs-category#vital-signs
* code MS
* code from MareiaVitalLoincVS (extensible)
* subject 1..1 MS
* subject only Reference(PatientMareIABase)
* effective[x] 1..1 MS
* effective[x] only dateTime
* effective[x] ^short = "Momento da medição (no dispositivo, o horário informado pelo aparelho)"
* value[x] only Quantity
* valueQuantity MS
* valueQuantity.system 1..1
* valueQuantity.system = $ucum
* valueQuantity.code 1..1 MS
* device MS
* device only Reference(MareiaDeviceMetric)
* device ^short = "Medida do dispositivo de origem (ausente quando digitada)"
