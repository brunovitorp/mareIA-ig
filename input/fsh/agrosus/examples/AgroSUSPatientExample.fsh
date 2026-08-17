Instance: agrosus-patient-example
InstanceOf: AgroSUSPatient
Usage: #example
Title: "Exemplo de Paciente AgroSUS"
Description: "Trabalhadora rural fictícia utilizada para validar o perfil Paciente AgroSUS."

* language = #pt-BR
* active = true

* identifier[cpf].use = #official
* identifier[cpf].type = http://terminology.hl7.org/CodeSystem/v2-0203#TAX "Tax ID number"
* identifier[cpf].system = "https://receita.fazenda.gov.br/fhir/sid/cpf"
* identifier[cpf].value = "12345678901"

* identifier[cns].use = #official
* identifier[cns].type = http://terminology.hl7.org/CodeSystem/v2-0203#HC "Health Card Number"
* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns].value = "987654321098765"

* extension[raca].valueCodeableConcept = https://terminologia.saude.gov.br/fhir/CodeSystem/BRRacaCor#01 "Branca"

* name[0].use = #official
* name[0].text = "Maria Aparecida de Souza"
* name[0].family = "Souza"
* name[0].given[0] = "Maria"
* name[0].given[1] = "Aparecida"

* gender = #female
* birthDate = "1978-05-14"

* telecom[0].system = #phone
* telecom[0].value = "+55 11 90000-0000"
* telecom[0].use = #mobile

* address[0].use = #home
* address[0].type = #physical
* address[0].text = "Propriedade Rural Exemplo, Jundiapeba, Mogi das Cruzes, SP"
* address[0].line[0] = "Propriedade Rural Exemplo, s/n"
* address[0].district = "Jundiapeba"
* address[0].city = "Mogi das Cruzes"
* address[0].state = "SP"
* address[0].country = "Brasil"