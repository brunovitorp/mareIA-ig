// Spec 3.2. Aparelho físico; criado uma única vez por número de série (criação condicional pelo identifier).
Profile: MareiaDevice
Parent: Device
Id: mareia-device
Title: "mareIA — Dispositivo de medição"
Description: "Aparelho que produziu uma medição (glicosímetro, oxímetro, esfigmomanômetro, balança, termômetro, estadiômetro, fita métrica), identificado pelo número de série."
* ^status = #active
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Número de série do aparelho"
* identifier contains serial 1..1 MS
* identifier[serial].system = "https://mareia.nutes.ufpe.br/fhir/sid/device-serial"
* identifier[serial].value 1..1 MS
* identifier[serial] ^short = "Número de série (estável e único por aparelho)"
* status MS
* type 1..1 MS
* type from MareiaDeviceTypeVS (required)
* serialNumber MS
* manufacturer MS
* deviceName MS
