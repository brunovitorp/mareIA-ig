// Fonte L1: NR-7 item 7.4.5.1 (registro); Nota Informativa nº 16/2019-CGLAB/DAEVS/SVS/MS, Anexo
// III item 3 (afastamento e reavaliação). L2: 6-decision-logic.csv (conduta-alterado). Ver
// ADR-0005 — decisão da equipe clínica (22/07/2026) de que um resultado de colinesterase alterado,
// isoladamente e sem sintomas, gera automaticamente um registro de suspeita clínica de intoxicação.
//
// Este exemplo completa a linha do tempo iniciada em AgroSUSColinesteraseExamples.fsh para o
// resultado "Alterado" (agrosus-resultado-colinesterase-alterada-exemplo, inibição de 58,54%):
// antes da decisão registrada em ADR-0005, não era possível criar um CarePlan de exemplo para este
// cenário porque addresses exigia uma condição de intoxicação, mas o caso não tinha sintomas.

// Atendimento em que o resultado alterado foi avaliado

Instance: agrosus-atendimento-ubs-alerta-colinesterase-exemplo
InstanceOf: AgroSUSAtendimentoUBS
Usage: #example
Title: "Exemplo de Atendimento — Alerta de Colinesterase Alterada"
Description: "Atendimento fictício em que o resultado alterado de colinesterase (sem sintomas relatados) foi avaliado pelo médico da UBS."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/atendimento-ubs"
* identifier.value = "ATEND-UBS-2027-000001"

* status = #finished

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
    "ambulatory"

* type[0].text = "Avaliação de resultado alterado de colinesterase, sem sintomas relatados"

* priority = http://terminology.hl7.org/CodeSystem/v3-ActPriority#UR
    "urgent"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* participant[0].type[0] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF
    "primary performer"

* participant[0].period.start = "2027-07-22T13:15:00-03:00"
* participant[0].period.end = "2027-07-22T13:45:00-03:00"

* participant[0].individual = Reference(agrosus-profissional-medico-role-exemplo)
* participant[0].individual.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* period.start = "2027-07-22T13:15:00-03:00"
* period.end = "2027-07-22T13:45:00-03:00"

* reasonCode[0].text = "Avaliação de resultado alterado de colinesterase plasmática (inibição de 58,54%), sem sintomas relatados"

* serviceProvider = Reference(agrosus-ubs-exemplo)
* serviceProvider.display = "UBS Jardim Esperança — Exemplo AgroSUS"


// Condição clínica — suspeita subclínica, motivada apenas pelo biomarcador alterado (ADR-0005)

Instance: agrosus-intoxicacao-subclinica-colinesterase-exemplo
InstanceOf: AgroSUSIntoxicacaoPesticida
Usage: #example
Title: "Exemplo de Suspeita de Intoxicação Subclínica (Colinesterase Alterada, Sem Sintomas)"
Description: "Suspeita clínica fictícia registrada automaticamente pelo médico da UBS a partir de resultado biológico alterado, sem sintomas relatados, conforme decisão registrada em ADR-0005."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/condicao-clinica"
* identifier.value = "COND-2027-000001"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
    "Active"

* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional
    "Provisional"

* category = http://terminology.hl7.org/CodeSystem/condition-category#problem-list-item
    "Problem List Item"

* severity = http://snomed.info/sct#255604002
    "Mild"

* code = https://terminologia.saude.gov.br/fhir/CodeSystem/BRCID10#T60.0
    "Efeito tóxico de inseticidas organofosforados e carbamatos"

* code.text = "Suspeita de intoxicação subclínica por inibidor de colinesterase, sem sintomas relatados"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-atendimento-ubs-alerta-colinesterase-exemplo)
* encounter.display = "Avaliação do resultado alterado de colinesterase"

* onsetDateTime = "2027-07-22T08:10:00-03:00"
* recordedDate = "2027-07-22T13:40:00-03:00"

* recorder = Reference(agrosus-profissional-medico-role-exemplo)
* recorder.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* asserter = Reference(agrosus-profissional-medico-role-exemplo)
* asserter.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* evidence[0].detail[0] = Reference(agrosus-resultado-colinesterase-alterada-exemplo)
* evidence[0].detail[0].display = "Resultado alterado de colinesterase plasmática (inibição de 58,54%)"

* note[0].text = "Registro aberto automaticamente a partir de um resultado biológico isolado (colinesterase acima do IBMP), sem sintomas relatados pela trabalhadora. Conforme decisão da equipe clínica (ADR-0005, 22/07/2026), todo resultado de colinesterase alterado gera este registro de suspeita, independentemente de sintomas, para fundamentar a conduta de afastamento e reavaliação exigida pela NR-7 e pela Nota Informativa 16/2019."


// Plano de acompanhamento decorrente do biomarcador alterado

Instance: agrosus-plano-acompanhamento-colinesterase-alterada-exemplo
InstanceOf: AgroSUSPlanoAcompanhamento
Usage: #example
Title: "Exemplo de Plano de Acompanhamento — Colinesterase Alterada (Sem Sintomas)"
Description: "Plano fictício de afastamento e reavaliação decorrente de resultado alterado de colinesterase, sem suspeita clínica motivada por sintomas."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/plano-acompanhamento"
* identifier.value = "PLANO-2027-000001"

* instantiatesUri[0] = "https://www.gov.br/trabalho-e-emprego/pt-br/acesso-a-informacao/participacao-social/conselhos-e-orgaos-colegiados/comissao-tripartite-partitaria-permanente/normas-regulamentadora/normas-regulamentadoras-vigentes/nr-07-atualizada-2022-1.pdf"

* status = #active
* intent = #plan

* category[0] = AgroSUSCategoriaPlanoCuidadoCS#investigacao-intoxicacao
    "Investigação de possível intoxicação"

* title = "Afastamento e reavaliação por colinesterase alterada"

* description = "Plano definido pelo médico da UBS para afastamento temporário do contato com o defensivo, retestagem em 30 dias e reavaliação clínica, motivado exclusivamente pelo resultado biológico alterado (sem sintomas relatados)."

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-atendimento-ubs-alerta-colinesterase-exemplo)
* encounter.display = "Avaliação do resultado alterado de colinesterase"

* period.start = "2027-07-22"
* period.end = "2027-08-21"

* created = "2027-07-22T13:40:00-03:00"

* author = Reference(agrosus-profissional-medico-role-exemplo)
* author.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* contributor[0] = Reference(agrosus-ubs-exemplo)
* contributor[0].display = "UBS Jardim Esperança — Exemplo AgroSUS"

* addresses = Reference(agrosus-intoxicacao-subclinica-colinesterase-exemplo)
* addresses.display = "Suspeita de intoxicação subclínica por inibidor de colinesterase, sem sintomas relatados"

* supportingInfo[0] = Reference(agrosus-resultado-colinesterase-alterada-exemplo)
* supportingInfo[0].display = "Resultado alterado de colinesterase plasmática (inibição de 58,54%)"

* supportingInfo[1] = Reference(agrosus-solicitacao-colinesterase-retestagem-exemplo)
* supportingInfo[1].display = "Solicitação de retestagem de colinesterase 30 dias após o resultado alterado"

* activity.detail.kind = #ServiceRequest

* activity.detail.code = https://terminologia.saude.gov.br/fhir/CodeSystem/BRSubgrupoTabelaSUS#0301
    "Consultas / Atendimentos / Acompanhamentos"

* activity.detail.reasonReference[0] = Reference(agrosus-intoxicacao-subclinica-colinesterase-exemplo)
* activity.detail.reasonReference[0].display = "Suspeita de intoxicação subclínica por inibidor de colinesterase, sem sintomas relatados"

* activity.detail.status = #scheduled

* activity.detail.scheduledPeriod.start = "2027-08-21"
* activity.detail.scheduledPeriod.end = "2027-08-21"

* activity.detail.performer[0] = Reference(agrosus-profissional-medico-role-exemplo)
* activity.detail.performer[0].display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* activity.detail.performer[1] = Reference(agrosus-ubs-exemplo)
* activity.detail.performer[1].display = "UBS Jardim Esperança — Exemplo AgroSUS"

* activity.detail.description = "Manter afastamento do contato com organofosforados/carbamatos por 30 dias, repetir a colinesterase e reavaliar clinicamente, investigando outras causas de depressão enzimática antes de concluir pela exposição ocupacional (DT-5)."

* activity.progress[0].text = "Antecipar a reavaliação se surgirem sintomas compatíveis com intoxicação durante o período de afastamento."

* note[0].text = "Plano motivado exclusivamente pelo resultado biológico alterado (DT-5), sem sintomas relatados. Registrado como suspeita clínica provisória (agrosus-intoxicacao-subclinica-colinesterase-exemplo) por decisão da equipe clínica (ADR-0005, 22/07/2026), que confirmou que todo resultado alterado de colinesterase deve gerar automaticamente esse registro, independentemente de sintomas."
