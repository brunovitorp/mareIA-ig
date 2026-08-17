// Atendimento de revisão após liberação dos resultados

Instance: agrosus-atendimento-ubs-revisao-exames-exemplo
InstanceOf: AgroSUSAtendimentoUBS
Usage: #example
Title: "Exemplo de Atendimento para Revisão dos Exames"
Description: "Atendimento fictício para avaliação dos resultados laboratoriais e definição do acompanhamento longitudinal."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/atendimento-ubs"
* identifier.value = "ATEND-UBS-2026-000002"

* status = #finished

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
    "ambulatory"

* type[0].text = "Revisão clínica e laboratorial de trabalhador rural exposto a defensivos agrícolas"

* priority = http://terminology.hl7.org/CodeSystem/v3-ActPriority#R
    "routine"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* participant[0].type[0] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF
    "primary performer"

* participant[0].period.start = "2026-07-26T10:00:00-03:00"
* participant[0].period.end = "2026-07-26T10:40:00-03:00"

* participant[0].individual = Reference(agrosus-profissional-medico-role-exemplo)
* participant[0].individual.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* period.start = "2026-07-26T10:00:00-03:00"
* period.end = "2026-07-26T10:40:00-03:00"

* reasonReference[0] = Reference(agrosus-intoxicacao-pesticida-suspeita-exemplo)
* reasonReference[0].display = "Suspeita de intoxicação por pesticida em investigação"

* diagnosis[0].condition = Reference(agrosus-intoxicacao-pesticida-suspeita-exemplo)
* diagnosis[0].condition.display = "Suspeita de intoxicação por pesticida em investigação"
* diagnosis[0].use = http://terminology.hl7.org/CodeSystem/diagnosis-role#AD "Admission diagnosis"

* serviceProvider = Reference(agrosus-ubs-exemplo)
* serviceProvider.display = "UBS Jardim Esperança — Exemplo AgroSUS"


// Plano longitudinal

Instance: agrosus-plano-acompanhamento-exemplo
InstanceOf: AgroSUSPlanoAcompanhamento
Usage: #example
Title: "Exemplo de Plano de Acompanhamento AgroSUS"
Description: "Plano fictício para acompanhamento longitudinal de trabalhadora rural com suspeita de intoxicação por pesticida."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/plano-acompanhamento"
* identifier.value = "PLANO-2026-000001"

* instantiatesUri[0] = "https://www.gov.br/trabalho-e-emprego/pt-br/acesso-a-informacao/participacao-social/conselhos-e-orgaos-colegiados/comissao-tripartite-partitaria-permanente/normas-regulamentadora/normas-regulamentadoras-vigentes/nr-07-atualizada-2022-1.pdf"

* status = #active
* intent = #plan

* category[0] = AgroSUSCategoriaPlanoCuidadoCS#investigacao-intoxicacao
    "Investigação de possível intoxicação"

* title = "Acompanhamento clínico e ocupacional AgroSUS"

* description = "Plano individual definido pelo médico da UBS para acompanhamento da exposição ocupacional, revisão clínica e reavaliação da necessidade de exames complementares."

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-atendimento-ubs-revisao-exames-exemplo)
* encounter.display = "Atendimento para revisão clínica e laboratorial"

* period.start = "2026-07-26"
* period.end = "2027-07-20"

* created = "2026-07-26T10:35:00-03:00"

* author = Reference(agrosus-profissional-medico-role-exemplo)
* author.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* contributor[0] = Reference(agrosus-ubs-exemplo)
* contributor[0].display = "UBS Jardim Esperança — Exemplo AgroSUS"

* addresses = Reference(agrosus-intoxicacao-pesticida-suspeita-exemplo)
* addresses.display = "Suspeita de intoxicação por pesticida em investigação"

* supportingInfo[0] = Reference(agrosus-anamnese-response-example)
* supportingInfo[0].display = "Resposta da anamnese AgroSUS"

* supportingInfo[1] = Reference(agrosus-solicitacao-hemograma-exemplo)
* supportingInfo[1].display = "Solicitação de hemograma completo"

* supportingInfo[2] = Reference(agrosus-laudo-hemograma-exemplo)
* supportingInfo[2].display = "Laudo de hemograma completo"

* activity.detail.kind = #ServiceRequest

* activity.detail.code = https://terminologia.saude.gov.br/fhir/CodeSystem/BRSubgrupoTabelaSUS#0301
    "Consultas / Atendimentos / Acompanhamentos"

* activity.detail.reasonReference[0] = Reference(agrosus-intoxicacao-pesticida-suspeita-exemplo)
* activity.detail.reasonReference[0].display = "Suspeita de intoxicação por pesticida em investigação"

* activity.detail.status = #scheduled

* activity.detail.scheduledPeriod.start = "2027-07-01"
* activity.detail.scheduledPeriod.end = "2027-07-20"

* activity.detail.performer[0] = Reference(agrosus-profissional-medico-role-exemplo)
* activity.detail.performer[0].display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* activity.detail.performer[1] = Reference(agrosus-ubs-exemplo)
* activity.detail.performer[1].display = "UBS Jardim Esperança — Exemplo AgroSUS"

* activity.detail.description = "Realizar reavaliação clínica e ocupacional em até doze meses, repetir a anamnese AgroSUS e avaliar individualmente a necessidade de novos exames."

* activity.progress[0].text = "Antecipar o atendimento se houver surgimento ou agravamento de sintomas, nova exposição relevante ou alteração laboratorial."

* note[0].text = "O intervalo anual deste exemplo foi definido pelo médico responsável com base na exposição ocupacional e na NR-7. A aplicação utiliza a NR-7 como referência assistencial; a periodicidade deve ser individualizada e não calculada automaticamente."

* note[1].text = "Quando houver exposição a inseticidas inibidores da colinesterase, o profissional deverá avaliar a aplicação da periodicidade específica dos indicadores biológicos prevista no Anexo I da NR-7."
