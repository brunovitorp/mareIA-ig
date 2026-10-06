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
* type = $loinc#14743-9 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* unit = $ucum#mg/dL "mg/dL"
* source = Reference(mareia-device-glucometer-example)
* category = #measurement
