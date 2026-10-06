// Exemplos do fluxo IoT: glicosímetro → o que ele mede → medições (Observations na Task 3).

Instance: mareia-device-glucometer-example
InstanceOf: MareiaDevice
Usage: #example
Title: "Exemplo — Glicosímetro (Device)"
Description: "Glicosímetro com conexão Bluetooth, identificado pelo número de série."
* identifier[serial].value = "GLI-0001"
* status = #active
* type = $sct#337414009 "Glucometer"
* serialNumber = "GLI-0001"
* manufacturer = "Fabricante Exemplo"
* deviceName[0].name = "Glicosímetro BT Exemplo"
* deviceName[0].type = #model-name

Instance: mareia-devicemetric-glucose-example
InstanceOf: MareiaDeviceMetric
Usage: #example
Title: "Exemplo — Glicemia capilar medida pelo glicosímetro (DeviceMetric)"
Description: "Tipo de medida (LOINC) e unidade (UCUM) do glicosímetro de exemplo."
* identifier[metricKey].value = "GLI-0001-41653-7"
* type = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* unit = $ucum#mg/dL "mg/dL"
* source = Reference(mareia-device-glucometer-example)
* category = #measurement

Instance: atento60-iot-glucose-example
InstanceOf: Atento60ObservationIotVital
Usage: #example
Title: "Exemplo — Glicemia capilar por glicosímetro (ATENTO 60+)"
Description: "Medição recebida do glicosímetro de exemplo, rastreável até o aparelho via DeviceMetric."
* status = #final
* category[VSCat] = $obs-category#vital-signs
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* subject = Reference(atento60-patient-example)
* effectiveDateTime = "2026-10-05T10:00:00-03:00"
* valueQuantity = 112 'mg/dL' "mg/dL"
* device = Reference(mareia-devicemetric-glucose-example)

Instance: cardio-iot-glucose-example
InstanceOf: ObservationCardioVital
Usage: #example
Title: "Exemplo — Glicemia capilar por glicosímetro (CardioRemoto)"
Description: "Mesma estrutura de medição IoT aplicada ao CardioRemoto."
* status = #final
* category[VSCat] = $obs-category#vital-signs
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* subject = Reference(ExamplePatientCardio)
* effectiveDateTime = "2026-10-05T10:05:00-03:00"
* valueQuantity = 138 'mg/dL' "mg/dL"
* device = Reference(mareia-devicemetric-glucose-example)
