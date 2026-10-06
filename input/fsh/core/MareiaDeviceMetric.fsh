// Spec 3.3. O que um aparelho mede: um DeviceMetric por aparelho e tipo de medida.
Profile: MareiaDeviceMetric
Parent: DeviceMetric
Id: mareia-devicemetric
Title: "mareIA — Medida de um dispositivo"
Description: "Tipo de medida (LOINC) e unidade (UCUM) produzidos por um dispositivo de medição da plataforma mareIA."
* ^status = #active
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Chave para criação condicional: <serial>-<loinc>"
* identifier contains metricKey 1..1 MS
* identifier[metricKey].system = "https://mareia.nutes.ufpe.br/fhir/sid/device-metric"
* identifier[metricKey].value 1..1 MS
* identifier[metricKey] ^short = "Número de série do aparelho + código LOINC da medida (ex.: GLI-0001-41653-7)"
* type from MareiaVitalLoincVS (extensible)
* unit MS
* source 1..1 MS
* source only Reference(MareiaDevice)
* category = #measurement
