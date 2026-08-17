// Fonte L1: NR-7 item 7.4.1 (valor basal), Quadro I (classificação); Nota Informativa nº
// 16/2019-CGLAB/DAEVS/SVS/MS, Anexo I itens 1, 3 e 4, Anexo III itens 1.1 e 3. L2:
// 6-decision-logic.csv (colinesterase-valor-basal, percentual-inibicao, classificacao,
// precaucao, conduta-alterado). Ver Library/AgroSUSIntoxicacaoLogic e
// PlanDefinition/AgroSUSEstratificacaoRisco.
//
// Cenário ilustrativo: linha do tempo fictícia da colinesterase plasmática de
// Maria Aparecida de Souza (agrosus-patient-example), do valor basal admissional a um
// resultado alterado, demonstrando os três estados descritos em DT-3 (Normal, Precaução,
// Alterado) e a conduta de DT-5. Os quatro resultados abaixo são independentes entre si
// (não representam necessariamente a evolução real de uma única pessoa) — servem para
// exercitar a lógica de classificação e os códigos LOINC de colinesterase
// (AgroSUSResultadosLaboratoriaisVS), que não eram usados em nenhum exemplo anterior.

// Solicitação do exame basal (admissional), antes do início do manuseio de
// organofosforados/carbamatos — DT-1 / NR-7 item 7.4.1.

Instance: agrosus-solicitacao-colinesterase-basal-exemplo
InstanceOf: AgroSUSSolicitacaoExame
Usage: #example
Title: "Exemplo de Solicitação de Colinesterase — Valor Basal Admissional"
Description: "Solicitação fictícia do exame de colinesterase realizada na admissão do trabalhador, antes do início do manuseio de organofosforados/carbamatos (NR-7 item 7.4.1)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/solicitacao-exame"
* identifier.value = "SOL-EXAME-2024-000001"

* requisition.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/requisicao-laboratorial"
* requisition.value = "REQ-LAB-2024-000001"

* status = #completed
* intent = #order
* priority = #routine

* category = http://snomed.info/sct#108252007
    "Laboratory procedure"
* category.text = "Exame laboratorial"

* code = http://loinc.org#35558-6
    "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma and Erythrocytes"
* code.text = "Colinesterases eritrocitária e plasmática (painel)"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* authoredOn = "2024-01-10T08:00:00-03:00"
* occurrenceDateTime = "2024-01-15T07:30:00-03:00"

* requester = Reference(agrosus-profissional-medico-role-exemplo)
* requester.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* reasonCode[0].text = "Exame admissional de colinesterase, antes do início do manuseio de organofosforados/carbamatos"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* note[0].text = "Valor basal — anterior ao cadastro da trabalhadora no AgroSUS em 2026; registrado retroativamente a partir do prontuário do PCMSO, conforme NR-7 item 7.4.1."


// Valor basal — referência para o cálculo do percentual de inibição (DT-2).

Instance: agrosus-resultado-colinesterase-basal-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Colinesterase — Valor Basal"
Description: "Valor basal fictício de colinesterase plasmática, obtido na admissão, antes do início do manuseio de organofosforados/carbamatos (NR-7 item 7.4.1; Nota Informativa 16/2019, Anexo I itens 1 e 3)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2024-000001-COLIN-BASAL"

* basedOn[0] = Reference(agrosus-solicitacao-colinesterase-basal-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#2099-0 "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2024-01-15T07:30:00-03:00"
* issued = "2024-01-15T14:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* valueQuantity = 8200 'U/L' "U/L"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"

* note[0].text = "Valor basal (pré-ocupacional), obtido antes do início do manuseio de organofosforados/carbamatos. Referência para o cálculo do percentual de inibição dos resultados subsequentes (DT-2)."


// Solicitação semestral de rotina (2026-07) — DT-4, NR-7 item 7.4.2.1.

Instance: agrosus-solicitacao-colinesterase-semestral-2026-exemplo
InstanceOf: AgroSUSSolicitacaoExame
Usage: #example
Title: "Exemplo de Solicitação de Colinesterase — Rotina Semestral (2026-07)"
Description: "Solicitação fictícia do exame de colinesterase na periodicidade semestral mínima de rotina (NR-7 item 7.4.2.1)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/solicitacao-exame"
* identifier.value = "SOL-EXAME-2026-000002"

* requisition.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/requisicao-laboratorial"
* requisition.value = "REQ-LAB-2026-000002"

* status = #completed
* intent = #order
* priority = #routine

* category = http://snomed.info/sct#108252007
    "Laboratory procedure"
* category.text = "Exame laboratorial"

* code = http://loinc.org#2099-0
    "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* encounter = Reference(agrosus-atendimento-ubs-avaliacao-exemplo)
* encounter.display = "Avaliação clínica na UBS após visita do ACS"

* authoredOn = "2026-07-20T11:05:00-03:00"
* occurrenceDateTime = "2026-07-25T08:15:00-03:00"

* requester = Reference(agrosus-profissional-medico-role-exemplo)
* requester.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* reasonCode[0].text = "Monitoramento biológico de rotina — periodicidade semestral mínima (NR-7 item 7.4.2.1)"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* note[0].text = "Exame de rotina semestral, solicitado na mesma consulta em que foi pedido o hemograma."


// Estado 1 — Normal (DT-3): inibição de 14,63% em relação ao basal (8200 → 7000 U/L).

Instance: agrosus-resultado-colinesterase-normal-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Colinesterase — Normal"
Description: "Resultado fictício de colinesterase plasmática dentro do limite aceitável (inibição de 14,63% em relação ao valor basal), na periodicidade semestral de rotina (NR-7 item 7.4.2.1)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2026-000002-COLIN"

* basedOn[0] = Reference(agrosus-solicitacao-colinesterase-semestral-2026-exemplo)
* derivedFrom[0] = Reference(agrosus-resultado-colinesterase-basal-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#2099-0 "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2026-07-25T08:15:00-03:00"
* issued = "2026-07-25T12:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* valueQuantity = 7000 'U/L' "U/L"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#N "Normal"

* note[0].text = "Percentual de inibição = (8200 − 7000) / 8200 × 100 = 14,63%. Até 50% de inibição plasmática = Normal (DT-3); abaixo da faixa de precaução (20%–50%), sem gatilho de alerta."


// Solicitação semestral de rotina (2027-01) — DT-4, NR-7 item 7.4.2.1.

Instance: agrosus-solicitacao-colinesterase-semestral-2027-01-exemplo
InstanceOf: AgroSUSSolicitacaoExame
Usage: #example
Title: "Exemplo de Solicitação de Colinesterase — Rotina Semestral (2027-01)"
Description: "Solicitação fictícia do exame de colinesterase na periodicidade semestral mínima de rotina (NR-7 item 7.4.2.1)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/solicitacao-exame"
* identifier.value = "SOL-EXAME-2027-000001"

* requisition.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/requisicao-laboratorial"
* requisition.value = "REQ-LAB-2027-000001"

* status = #completed
* intent = #order
* priority = #routine

* category = http://snomed.info/sct#108252007
    "Laboratory procedure"
* category.text = "Exame laboratorial"

* code = http://loinc.org#2099-0
    "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* authoredOn = "2027-01-15T09:00:00-03:00"
* occurrenceDateTime = "2027-01-20T08:00:00-03:00"

* requester = Reference(agrosus-profissional-medico-role-exemplo)
* requester.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* reasonCode[0].text = "Monitoramento biológico de rotina — periodicidade semestral mínima (NR-7 item 7.4.2.1)"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"


// Estado 2 — Precaução (DT-3): inibição de 39,02% (dentro de 20–50%, sem exceder o IBMP).

Instance: agrosus-resultado-colinesterase-precaucao-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Colinesterase — Precaução"
Description: "Resultado fictício de colinesterase plasmática dentro do limite aceitável, mas na faixa de precaução (inibição de 39,02%), sem exceder o Índice Biológico Máximo Permitido (IBMP)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2027-000001-COLIN"

* basedOn[0] = Reference(agrosus-solicitacao-colinesterase-semestral-2027-01-exemplo)
* derivedFrom[0] = Reference(agrosus-resultado-colinesterase-basal-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#2099-0 "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2027-01-20T08:00:00-03:00"
* issued = "2027-01-20T13:30:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* valueQuantity = 5000 'U/L' "U/L"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L "Low"

* note[0].text = "Percentual de inibição = (8200 − 5000) / 8200 × 100 = 39,02%. Não excede o IBMP (50% para colinesterase plasmática) — permanece classificado como Normal por DT-3, mas está na faixa de precaução (20%–50%) descrita na Nota Informativa 16/2019, Anexo I. Gera alerta de prioridade 'Atenção' (AgroSUSPrioridadeAlertaCS#atencao): reforçar uso de EPI e técnica de aplicação, sem afastamento automático."


// Solicitação semestral de rotina (2027-07) — DT-4, NR-7 item 7.4.2.1.

Instance: agrosus-solicitacao-colinesterase-semestral-2027-07-exemplo
InstanceOf: AgroSUSSolicitacaoExame
Usage: #example
Title: "Exemplo de Solicitação de Colinesterase — Rotina Semestral (2027-07)"
Description: "Solicitação fictícia do exame de colinesterase na periodicidade semestral mínima de rotina (NR-7 item 7.4.2.1); resultado veio alterado (ver DT-5)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/solicitacao-exame"
* identifier.value = "SOL-EXAME-2027-000003"

* requisition.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/requisicao-laboratorial"
* requisition.value = "REQ-LAB-2027-000003"

* status = #completed
* intent = #order
* priority = #routine

* category = http://snomed.info/sct#108252007
    "Laboratory procedure"
* category.text = "Exame laboratorial"

* code = http://loinc.org#2099-0
    "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* authoredOn = "2027-07-18T09:00:00-03:00"
* occurrenceDateTime = "2027-07-22T08:10:00-03:00"

* requester = Reference(agrosus-profissional-medico-role-exemplo)
* requester.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* reasonCode[0].text = "Monitoramento biológico de rotina — periodicidade semestral mínima (NR-7 item 7.4.2.1)"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"


// Estado 3 — Alterado (DT-3): inibição de 58,54% (excede o IBMP) → conduta de DT-5.

Instance: agrosus-resultado-colinesterase-alterada-exemplo
InstanceOf: AgroSUSResultadoLaboratorial
Usage: #example
Title: "Exemplo de Resultado de Colinesterase — Alterado"
Description: "Resultado fictício de colinesterase plasmática acima do Índice Biológico Máximo Permitido (inibição de 58,54%), exigindo afastamento do contato com o defensivo por 30 dias (DT-5)."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/resultado-laboratorial"
* identifier.value = "RES-LAB-2027-000002-COLIN"

* basedOn[0] = Reference(agrosus-solicitacao-colinesterase-semestral-2027-07-exemplo)
* derivedFrom[0] = Reference(agrosus-resultado-colinesterase-basal-exemplo)

* status = #final

* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory "Laboratory"

* code = http://loinc.org#2099-0 "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* effectiveDateTime = "2027-07-22T08:10:00-03:00"
* issued = "2027-07-22T13:00:00-03:00"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* valueQuantity = 3400 'U/L' "U/L"

* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#LL "Critical low"

* note[0].text = "Percentual de inibição = (8200 − 3400) / 8200 × 100 = 58,54%. Acima de 50% de inibição plasmática = Alterado, excede o IBMP (DT-3). Alerta de prioridade 'Crítica' (AgroSUSPrioridadeAlertaCS#critica). Conduta (DT-5; Nota Informativa 16/2019, Anexo III item 3): afastar do contato com o defensivo por 30 dias, encaminhar para avaliação clínica e laboratorial, repetir o exame após 30 dias e investigar outras causas de depressão enzimática antes de concluir pela exposição ocupacional."


// Retestagem 30 dias após resultado alterado (DT-4 / DT-5).

Instance: agrosus-solicitacao-colinesterase-retestagem-exemplo
InstanceOf: AgroSUSSolicitacaoExame
Usage: #example
Title: "Exemplo de Solicitação de Retestagem de Colinesterase Pós-Resultado Alterado"
Description: "Solicitação fictícia de retestagem da colinesterase 30 dias após o resultado alterado, conforme a conduta descrita em DT-5."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/solicitacao-exame"
* identifier.value = "SOL-EXAME-2027-000002"

* requisition.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/requisicao-laboratorial"
* requisition.value = "REQ-LAB-2027-000002"

* status = #active
* intent = #order
* priority = #urgent

* category = http://snomed.info/sct#108252007
    "Laboratory procedure"
* category.text = "Exame laboratorial"

* code = http://loinc.org#2099-0
    "Cholinesterase [Enzymatic activity/volume] in Serum or Plasma"
* code.text = "Colinesterase plasmática"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* authoredOn = "2027-07-22T13:10:00-03:00"
* occurrenceDateTime = "2027-08-21T08:00:00-03:00"

* requester = Reference(agrosus-profissional-medico-role-exemplo)
* requester.display = "Eduardo Henrique Almeida — Médico da Estratégia de Saúde da Família"

* reasonCode[0].text = "Retestagem 30 dias após resultado alterado de colinesterase plasmática, conforme Nota Informativa 16/2019, Anexo III item 3"

* reasonReference[0] = Reference(agrosus-resultado-colinesterase-alterada-exemplo)
* reasonReference[0].display = "Resultado alterado de colinesterase plasmática (inibição de 58,54%)"

* performer[0] = Reference(agrosus-laboratorio-exemplo)
* performer[0].display = "Laboratório Municipal de Referência — Exemplo AgroSUS"

* patientInstruction = "Manter afastamento do contato com o defensivo agrícola até a reavaliação. Comparecer ao serviço indicado na data marcada com documento de identificação e a requisição do exame."

* note[0].text = "Repetição do exame 30 dias após o resultado alterado, antes do retorno ao manuseio de organofosforados/carbamatos (DT-4, DT-5)."
