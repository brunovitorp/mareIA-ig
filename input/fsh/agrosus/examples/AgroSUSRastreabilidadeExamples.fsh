// Proveniência da anamnese registrada pelo ACS

Instance: agrosus-provenance-anamnese-exemplo
InstanceOf: AgroSUSProvenance
Usage: #example
Title: "Exemplo de Proveniência da Anamnese AgroSUS"
Description: "Registro fictício da autoria da resposta da anamnese pelo ACS."

* language = #pt-BR

* target[0] = Reference(agrosus-anamnese-response-example)
* target[0].display = "Resposta da anamnese AgroSUS"

* occurredDateTime = "2026-07-20T09:30:00-03:00"
* recorded = "2026-07-20T09:31:00-03:00"

* reason[0] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
    "treatment"

* reason[0].text = "Registro assistencial durante visita do ACS"

* activity = http://terminology.hl7.org/CodeSystem/v3-DataOperation#CREATE
    "create"

* agent[0].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
    "Author"

* agent[0].who = Reference(agrosus-acs-role-exemplo)
* agent[0].who.display = "Maria Clara Oliveira — ACS da UBS Jardim Esperança"

* agent[0].onBehalfOf = Reference(agrosus-ubs-exemplo)
* agent[0].onBehalfOf.display = "UBS Jardim Esperança — Exemplo AgroSUS"


// Proveniência do plano criado pelo médico

Instance: agrosus-provenance-plano-acompanhamento-exemplo
InstanceOf: AgroSUSProvenance
Usage: #example
Title: "Exemplo de Proveniência do Plano de Acompanhamento"
Description: "Registro fictício da autoria médica do plano longitudinal AgroSUS."

* language = #pt-BR

* target[0] = Reference(agrosus-plano-acompanhamento-exemplo)
* target[0].display = "Plano de acompanhamento clínico e ocupacional AgroSUS"

* occurredDateTime = "2026-07-26T10:35:00-03:00"
* recorded = "2026-07-26T10:36:00-03:00"

* reason[0] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
    "treatment"

* reason[0].text = "Planejamento do acompanhamento assistencial"

* activity = http://terminology.hl7.org/CodeSystem/v3-DataOperation#CREATE
    "create"

* agent[0].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#author
    "Author"

* agent[0].who = Reference(agrosus-profissional-medico-role-exemplo)
* agent[0].who.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* agent[0].onBehalfOf = Reference(agrosus-ubs-exemplo)
* agent[0].onBehalfOf.display = "UBS Jardim Esperança — Exemplo AgroSUS"

* entity[0].role = #source
* entity[0].what = Reference(agrosus-intoxicacao-pesticida-suspeita-exemplo)
* entity[0].what.display = "Suspeita de intoxicação por pesticida em investigação"

* entity[1].role = #source
* entity[1].what = Reference(agrosus-laudo-hemograma-exemplo)
* entity[1].what.display = "Laudo de hemograma completo"


// Auditoria de consulta ao dashboard

Instance: agrosus-auditoria-consulta-dashboard-exemplo
InstanceOf: AgroSUSAuditEvent
Usage: #example
Title: "Exemplo de Auditoria de Consulta ao Dashboard"
Description: "Evento fictício de acesso aos dados do trabalhador por profissional da UBS."

* language = #pt-BR

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
    "RESTful Operation"

* subtype[0] = http://hl7.org/fhir/restful-interaction#read
    "read"

* action = #R

* period.start = "2026-07-26T09:59:58-03:00"
* period.end = "2026-07-26T10:00:02-03:00"

* recorded = "2026-07-26T10:00:03-03:00"

* outcome = #0
* outcomeDesc = "Consulta realizada com sucesso"

* purposeOfEvent[0] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
    "treatment"

* purposeOfEvent[0].text = "Avaliação e acompanhamento assistencial"

* agent[0].who = Reference(agrosus-profissional-medico-role-exemplo)
* agent[0].who.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* agent[0].name = "Eduardo Henrique Almeida"
* agent[0].requestor = true

* agent[0].network.address = "192.0.2.10"
* agent[0].network.type = #2

* agent[0].purposeOfUse[0] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
    "treatment"

* agent[0].purposeOfUse[0].text = "Continuidade do cuidado na UBS"

* source.site = "Dashboard AgroSUS — UBS Jardim Esperança"

* source.observer = Reference(agrosus-ubs-exemplo)
* source.observer.display = "UBS Jardim Esperança — Exemplo AgroSUS"

* entity[0].what = Reference(agrosus-patient-example)
* entity[0].what.display = "Maria Aparecida de Souza"
* entity[0].description = "Cadastro do trabalhador consultado"

* entity[1].what = Reference(agrosus-anamnese-response-example)
* entity[1].what.display = "Resposta da anamnese AgroSUS"
* entity[1].description = "Anamnese consultada durante a avaliação"

* entity[2].what = Reference(agrosus-laudo-hemograma-exemplo)
* entity[2].what.display = "Laudo de hemograma completo"
* entity[2].description = "Laudo laboratorial consultado durante a avaliação"

* entity[3].what = Reference(agrosus-plano-acompanhamento-exemplo)
* entity[3].what.display = "Plano de acompanhamento AgroSUS"
* entity[3].description = "Plano assistencial consultado no dashboard"