// Exemplos de instâncias para validação do IG CardioRemoto
Instance: ExamplePatientCardio
InstanceOf: PatientCardio
Usage: #example
* identifier[+].system = "http://rnds.saude.gov.br/fhir/r4/NamingSystem/cpf"
* identifier[=].value = "12345678901"
* name[+].use = #official
* name[=].family = "Silva"
* name[=].given[+] = "João"
* name[=].text = "João Silva"
* gender = #male
* birthDate = "1960-05-15"

Instance: ExampleObservationRisk
InstanceOf: ObservationCardioRisk
Usage: #example
* status = #final
* subject = Reference(ExamplePatientCardio)
* effectiveDateTime = "2026-06-20T10:00:00-03:00"
* valueCodeableConcept = CardioRiskCS#amarelo "Amarelo (Moderado)"

Instance: ExampleObservationWeight
InstanceOf: ObservationCardioVital
Usage: #example
* status = #final
* subject = Reference(ExamplePatientCardio)
* effectiveDateTime = "2026-06-20T10:00:00-03:00"
* code = LOINC#29463-7 "Body weight"
* valueQuantity = 78.5 'kg' "kg"

Instance: ExampleObservationHba1c
InstanceOf: ObservationCardioLab
Usage: #example
* status = #final
* subject = Reference(ExamplePatientCardio)
* effectiveDateTime = "2026-06-20T08:30:00-03:00"
* code = LOINC#4548-4 "Hemoglobin A1c/Hemoglobin.total in Blood"
* valueQuantity = 7.4 '%' "%"
