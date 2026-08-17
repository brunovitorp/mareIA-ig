Instance: agrosus-ubs-exemplo
InstanceOf: AgroSUSUBS
Usage: #example
Title: "UBS AgroSUS de exemplo"
Description: "Exemplo sintético de Unidade Básica de Saúde responsável pelo acompanhamento no AgroSUS."

* active = true

* identifier[cnes].use = #official
* identifier[cnes].type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
* identifier[cnes].system = "https://saude.gov.br/fhir/sid/cnes"
* identifier[cnes].value = "7654321"

* name = "UBS Jardim Esperança — Exemplo AgroSUS"
* alias[0] = "UBS Jardim Esperança"

* address[0].use = #work
* address[0].type = #physical
* address[0].text = "Rua da Esperança, 250 — Jardim Esperança — Ferraz de Vasconcelos/SP"
* address[0].line[0] = "Rua da Esperança, 250"
* address[0].district = "Jardim Esperança"
* address[0].city = "Ferraz de Vasconcelos"
* address[0].state = "SP"
* address[0].postalCode = "08500-000"
* address[0].country = "Brasil"
