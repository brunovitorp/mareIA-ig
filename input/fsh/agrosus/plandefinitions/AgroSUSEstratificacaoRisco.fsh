// Fonte L1: NR-7 item 7.4 (Quadro I); NR-31 item 31.8; Nota Informativa nº 16/2019-CGLAB/DAEVS/SVS/MS.
// L2: 6-decision-logic.csv. REVISAR ADR-0002 (não há escore composto validado).
Instance: AgroSUSEstratificacaoRisco
InstanceOf: PlanDefinition
Usage: #definition
* status = #active
* experimental = true
* name = "AgroSUSEstratificacaoRisco"
* title = "AgroSUS — Vigilância biológica, periodicidade e alertas de intoxicação por defensivos"
* description = "Workflow de suporte à decisão: classifica o resultado da colinesterase, define a periodicidade do monitoramento biológico e avalia gatilhos de alerta independentes (sintomas, produto sem EPI adequado, histórico de intoxicação). Apoia — não substitui — o julgamento clínico do profissional assistencial da UBS."
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#workflow-definition
* library = Canonical(AgroSUSIntoxicacaoLogic)

// Ação 1 — Obter valor basal e resultado da colinesterase
* action[+].title = "Obter valor basal e resultado da colinesterase"
* action[=].description = "Determinar a atividade basal (pré-ocupacional) na admissão; calcular o percentual de inibição do resultado atual em relação ao basal. Registrado via ServiceRequest/AgroSUSSolicitacaoExame e Observation/AgroSUSResultadoLaboratorial."

// Ação 2 — Classificar o resultado da colinesterase
* action[+].title = "Classificar o resultado da colinesterase"
* action[=].description = "Classifica o percentual de inibição conforme o tipo de amostra. REVISAR fonte: NR-7 Quadro I; Nota Informativa 16/2019."
* action[=].action[+].title = "Normal — colinesterase plasmática (inibição <= 50%) ou sangue total (inibição <= 25%)"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%inibicaoPlasmatica <= 50 or %inibicaoSangueTotal <= 25"
* action[=].action[+].title = "Precaução — redução de 20% a 50%/25% (não atinge o IBMP)"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%inibicaoPlasmatica >= 20 and %inibicaoPlasmatica <= 50"
* action[=].action[+].title = "Alterado — excede o Índice Biológico Máximo Permitido (IBMP)"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%inibicaoPlasmatica > 50 or %inibicaoSangueTotal > 25"

// Ação 3 — Definir periodicidade do monitoramento biológico
* action[+].title = "Definir periodicidade do monitoramento biológico"
* action[=].description = "Periodicidade mínima semestral (NR-7 7.4.2.1), com gatilhos adicionais independentes da rotina."
* action[=].action[+].title = "Rotina — no mínimo a cada 6 meses"
* action[=].action[+].title = "Gatilho adicional — admissional, retorno de afastamento > 30 dias, mudança de função, sintomático, após surto/bloqueio de aplicação, ou retestagem pós-resultado alterado"

// Ação 4 — Conduta frente a resultado alterado
* action[+].title = "Conduta frente a resultado alterado"
* action[=].description = "Afastar do contato com o agrotóxico por 30 dias; encaminhar para avaliação clínica e laboratorial; repetir exame em 30 dias; investigar outras causas antes de concluir pela exposição ocupacional. Registrado via CarePlan/AgroSUSPlanoAcompanhamento."
* action[=].condition[+].kind = #applicability
* action[=].condition[=].expression.language = #text/fhirpath
* action[=].condition[=].expression.expression = "%inibicaoPlasmatica > 50 or %inibicaoSangueTotal > 25"

// Ação 5 — Avaliar gatilhos de alerta independentes (não pontuados)
* action[+].title = "Avaliar gatilhos de alerta independentes"
* action[=].description = "Gatilhos discretos que não compõem escore (ver ADR-0002). Qualquer gatilho presente prioriza avaliação clínica na UBS."
* action[=].action[+].title = "Sintoma agudo compatível com intoxicação (Seção 13 da anamnese)"
* action[=].action[+].title = "Manuseio de defensivo categoria toxicológica 1 ou 2 sem EPI adequado registrado (Seções 6 e 9)"
* action[=].action[+].title = "Histórico de intoxicação aguda prévia (Seção 14)"
* action[=].action[+].title = "Colinesterase alterada ou em precaução (Ação 2)"

// Ação 6 — Registro e retenção
* action[+].title = "Registrar e manter o histórico"
* action[=].description = "Manter registro de exames, afastamentos e condutas por, no mínimo, 40 anos após o desligamento do trabalhador (exceção de substância cancerígena, NR-7 7.4.5, aplicada de forma geral por decisão clínica de 22/07/2026 — ver ADR-0006). Registrado via Provenance/AgroSUSProvenance."
