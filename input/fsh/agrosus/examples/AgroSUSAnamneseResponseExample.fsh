Instance: agrosus-anamnese-response-example
InstanceOf: AgroSUSAnamneseResponse
Usage: #example
Title: "Exemplo de Resposta da Anamnese AgroSUS"
Description: "Resposta parcial fictícia da anamnese AgroSUS registrada durante uma visita do ACS."

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/anamnese"
* identifier.value = "ANAMNESE-2026-000001"

* questionnaire = Canonical(agrosus-anamnese)
* status = #in-progress

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-visita-acs-exemplo)
* encounter.display = "Visita em campo para aplicação inicial da anamnese AgroSUS"

* authored = "2026-07-20T09:30:00-03:00"

* author = Reference(agrosus-acs-role-exemplo)
* author.display = "Maria Clara Oliveira — ACS da UBS Jardim Esperança"

* source = Reference(agrosus-patient-example)
* source.display = "Maria Aparecida de Souza"

// Seção 1 — Identificação do instrumento

* item[0].linkId = "identificacao-instrumento"
* item[0].text = "1. Identificação do instrumento"

* item[0].item[0].linkId = "id-agrosus"
* item[0].item[0].answer[0].valueString = "AGROSUS-000001"

* item[0].item[1].linkId = "numero-formulario"
* item[0].item[1].answer[0].valueString = "FORM-2026-000001"

* item[0].item[2].linkId = "data-entrevista"
* item[0].item[2].answer[0].valueDate = "2026-07-20"

* item[0].item[3].linkId = "tipo-coleta"
* item[0].item[3].answer[0].valueCoding = AgroSUSTipoColetaCS#cadastro-inicial "Cadastro inicial"

* item[0].item[4].linkId = "ubs-referencia"
* item[0].item[4].answer[0].valueString = "UBS Jardim Esperança — Exemplo AgroSUS"

* item[0].item[5].linkId = "acs-responsavel"
* item[0].item[5].answer[0].valueString = "Maria Clara Oliveira"

* item[0].item[6].linkId = "cnes-ubs"
* item[0].item[6].answer[0].valueString = "7654321"

* item[0].item[7].linkId = "municipio"
* item[0].item[7].answer[0].valueString = "Ferraz de Vasconcelos"

* item[0].item[8].linkId = "bairro-localidade"
* item[0].item[8].answer[0].valueString = "Jardim Esperança"