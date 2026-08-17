// Laboratório executor

Instance: agrosus-laboratorio-exemplo
InstanceOf: AgroSUSLaboratorio
Usage: #example
Title: "Exemplo de Laboratório AgroSUS"
Description: "Laboratório municipal fictício responsável pela emissão dos resultados."

* language = #pt-BR
* active = true

* identifier[cnes].use = #official
* identifier[cnes].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[cnes].system = "https://saude.gov.br/fhir/sid/cnes"
* identifier[cnes].value = "1234567"

* name = "Laboratório Municipal de Referência — Exemplo AgroSUS"
* alias[0] = "Laboratório Municipal AgroSUS"

* address[0].use = #work
* address[0].type = #physical
* address[0].text = "Rua das Acácias, 100 — Centro — Ferraz de Vasconcelos/SP"
* address[0].line[0] = "Rua das Acácias, 100"
* address[0].district = "Centro"
* address[0].city = "Ferraz de Vasconcelos"
* address[0].state = "SP"
* address[0].postalCode = "08500-000"
* address[0].country = "Brasil"


// Hemoglobina

Instance: agrosus-resultado-hemoglobina-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Hemoglobina"

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2026-000001-HB"

* basedOn[0] = Reference(agrosus-solicitacao-hemograma-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#718-7 "Hgb Sg-mCnc"
* code.text = "Hemoglobina"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2026-07-25T08:15:00-03:00"
* issued = "2026-07-25T12:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* valueQuantity = 13.2 'g/dL' "g/dL"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* note[0].text = "Faixa de referência informada pelo laboratório: 12,0 a 16,0 g/dL."

// Hematócrito

Instance: agrosus-resultado-hematocrito-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Hematócrito"

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2026-000001-HT"

* basedOn[0] = Reference(agrosus-solicitacao-hemograma-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#4544-3 "Hct Fr Sg Auto"
* code.text = "Hematócrito"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2026-07-25T08:15:00-03:00"
* issued = "2026-07-25T12:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)

* valueQuantity = 39.5 '%' "%"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* note[0].text = "Faixa de referência informada pelo laboratório: 36,0% a 46,0%."

// Leucócitos

Instance: agrosus-resultado-leucocitos-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Leucócitos"

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2026-000001-LEU"

* basedOn[0] = Reference(agrosus-solicitacao-hemograma-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#6690-2 "WBC # Sg Auto"
* code.text = "Leucócitos"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2026-07-25T08:15:00-03:00"
* issued = "2026-07-25T12:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)

* valueQuantity = 6.8 '10*3/uL' "10³/µL"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* note[0].text = "Faixa de referência informada pelo laboratório: 4,0 a 10,0 × 10³/µL."

// Plaquetas

Instance: agrosus-resultado-plaquetas-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Plaquetas"

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2026-000001-PLAQ"

* basedOn[0] = Reference(agrosus-solicitacao-hemograma-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#777-3 "plaqueta # Sg Auto"
* code.text = "Plaquetas"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2026-07-25T08:15:00-03:00"
* issued = "2026-07-25T12:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)

* valueQuantity = 250 '10*3/uL' "10³/µL"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"
* note[0].text = "Faixa de referência informada pelo laboratório: 150 a 450 × 10³/µL."

// Laudo agrupador

Instance: agrosus-laudo-hemograma-exemplo
InstanceOf: AgroSUSLaudoLaboratorial
Usage: #example
Title: "Exemplo de Laudo de Hemograma AgroSUS"
Description: "Laudo fictício que agrupa os resultados individuais do hemograma."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/laudo-laboratorial"
* identifier.value = "LAUDO-LAB-2026-000001"

* basedOn[0] = Reference(agrosus-solicitacao-hemograma-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/v2-0074#HM "Hematology"

* code = http://loinc.org#58410-2 "CBC (hemogram) Sg Auto"
* code.text = "Hemograma completo"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2026-07-25T08:15:00-03:00"
* issued = "2026-07-25T12:10:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* result[0] = Reference(agrosus-resultado-hemoglobina-exemplo)
* result[1] = Reference(agrosus-resultado-hematocrito-exemplo)
* result[2] = Reference(agrosus-resultado-leucocitos-exemplo)
* result[3] = Reference(agrosus-resultado-plaquetas-exemplo)

* conclusion = "Resultados apresentados dentro das faixas de referência informadas pelo laboratório neste exemplo fictício."
