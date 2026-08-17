Instance: agrosus-solicitacao-hemograma-exemplo
InstanceOf: AgroSUSSolicitacaoExame
Usage: #example
Title: "Exemplo de Solicitação de Hemograma AgroSUS"
Description: "Solicitação fictícia de hemograma completo realizada pelo médico da UBS após avaliação clínica."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/solicitacao-exame"
* identifier.value = "SOL-EXAME-2026-000001"

* requisition.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/requisicao-laboratorial"
* requisition.value = "REQ-LAB-2026-000001"

* status = #completed
* intent = #order
* priority = #routine

* category = http://snomed.info/sct#108252007
    "Laboratory procedure"

* category.text = "Exame laboratorial"

* code = http://loinc.org#58410-2
    "CBC (hemogram) Sg Auto"

* code.text = "Hemograma completo"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-atendimento-ubs-avaliacao-exemplo)
* encounter.display = "Avaliação clínica na UBS após visita do ACS"

* authoredOn = "2026-07-20T11:00:00-03:00"
* occurrenceDateTime = "2026-07-25T08:00:00-03:00"

* requester = Reference(agrosus-profissional-medico-role-exemplo)
* requester.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* reasonCode[0].text = "Investigação clínica e laboratorial de possível intoxicação relacionada à exposição ocupacional a defensivos agrícolas"

* reasonReference[0] = Reference(agrosus-intoxicacao-pesticida-suspeita-exemplo)
* reasonReference[0].display = "Suspeita de intoxicação por pesticida em investigação"

* supportingInfo[0] = Reference(agrosus-anamnese-response-example)
* supportingInfo[0].display = "Resposta da anamnese AgroSUS"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* patientInstruction = "Comparecer ao serviço indicado com documento de identificação e a requisição do exame."

* note[0].text = "Solicitação realizada após avaliação clínica individual pela equipe da UBS."
