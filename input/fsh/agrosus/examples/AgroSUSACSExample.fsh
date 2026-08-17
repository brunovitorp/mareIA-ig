Instance: agrosus-acs-exemplo
InstanceOf: AgroSUSACS
Usage: #example
Title: "ACS AgroSUS de exemplo"
Description: "Exemplo sintético de Agente Comunitário de Saúde responsável pela aplicação da anamnese AgroSUS."

* active = true

* identifier[cns].use = #official
* identifier[cns].type = http://terminology.hl7.org/CodeSystem/v2-0203#HC
* identifier[cns].type.text = "Cartão Nacional de Saúde"
* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns].value = "123456789101112"

* name[0].use = #official
* name[0].given[0] = "Maria"
* name[0].given[1] = "Clara"
* name[0].family = "Oliveira"