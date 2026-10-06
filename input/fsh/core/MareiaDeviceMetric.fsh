// Spec 3.3. O que um aparelho mede: um DeviceMetric por aparelho e tipo de medida.
Profile: MareiaDeviceMetric
Parent: DeviceMetric
Id: mareia-devicemetric
Title: "mareIA — Medida de um dispositivo"
Description: "Tipo de medida (LOINC) e unidade (UCUM) produzidos por um dispositivo de medição da plataforma mareIA."
* ^status = #active
* type from MareiaVitalLoincVS (extensible)
* unit MS
* source 1..1 MS
* source only Reference(MareiaDevice)
* category = #measurement
