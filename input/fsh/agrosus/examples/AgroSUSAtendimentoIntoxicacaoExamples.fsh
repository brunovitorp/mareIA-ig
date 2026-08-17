// Atendimento clínico da UBS

Instance: agrosus-atendimento-ubs-avaliacao-exemplo
InstanceOf: AgroSUSAtendimentoUBS
Usage: #example
Title: "Exemplo de Atendimento Clínico da UBS AgroSUS"
Description: "Avaliação clínica fictícia realizada após a visita e anamnese do ACS."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/atendimento-ubs"
* identifier.value = "ATEND-UBS-2026-000001"

* status = #finished

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
    "ambulatory"

* type[0].text = "Avaliação clínica de trabalhador rural exposto a defensivos agrícolas"

* priority = http://terminology.hl7.org/CodeSystem/v3-ActPriority#R
    "routine"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* participant[0].type[0] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF
    "primary performer"

* participant[0].period.start = "2026-07-20T10:30:00-03:00"
* participant[0].period.end = "2026-07-20T11:10:00-03:00"

* participant[0].individual = Reference(agrosus-profissional-medico-role-exemplo)
* participant[0].individual.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* period.start = "2026-07-20T10:30:00-03:00"
* period.end = "2026-07-20T11:10:00-03:00"

* reasonCode[0].text = "Avaliação clínica após identificação de exposição ocupacional a defensivos agrícolas"

* serviceProvider = Reference(agrosus-ubs-exemplo)
* serviceProvider.display = "UBS Jardim Esperança — Exemplo AgroSUS"


// Condição clínica provisória

Instance: agrosus-intoxicacao-pesticida-suspeita-exemplo
InstanceOf: AgroSUSIntoxicacaoPesticida
Usage: #example
Title: "Exemplo de Suspeita de Intoxicação por Pesticida"
Description: "Suspeita clínica fictícia registrada pelo médico da UBS e mantida em investigação."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/condicao-clinica"
* identifier.value = "COND-2026-000001"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
    "Active"

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional
    "Provisional"

* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
    "Problem List Item"

* code = https://terminologia.saude.gov.br/fhir/CodeSystem/BRCID10#T60.9
    "Efeito tóxico de pesticida não especificado"

* code.text = "Suspeita de intoxicação por pesticida em investigação"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-atendimento-ubs-avaliacao-exemplo)
* encounter.display = "Avaliação clínica na UBS após visita do ACS"

* onsetDateTime = "2026-07-20T09:30:00-03:00"
* recordedDate = "2026-07-20T10:50:00-03:00"

* recorder = Reference(agrosus-profissional-medico-role-exemplo)
* recorder.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* asserter = Reference(agrosus-profissional-medico-role-exemplo)
* asserter.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* evidence[0].detail[0] = Reference(agrosus-anamnese-response-example)
* evidence[0].detail[0].display = "Resposta da anamnese ocupacional aplicada pelo ACS"

* note[0].text = "História de exposição ocupacional avaliada pelo médico. Condição provisória, pendente de investigação clínica e laboratorial; não gerada automaticamente pelo sistema."