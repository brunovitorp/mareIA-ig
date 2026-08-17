// Fonte L1: Metodologia §7.6.3, Requisitos RF002, RF005. L2: 5-data-dictionary.
Instance: QuestionnaireCardioTriage
InstanceOf: Questionnaire
Usage: #definition
* status = #active
* experimental = false
* name = "QuestionnaireCardioTriage"
* title = "CardioRemoto — Formulário de Triagem Clínica, Hábitos e Sintomas"
* description = "Instrumento estruturado de triagem clínica, antropométrica, hábitos de vida e sintomas de alarme para pacientes com DM/HAS."

// Grupo 1: Fatores Clínicos e Hábitos
* item[+].linkId = "g1-habitos"
* item[=].text = "1. Fatores Clínicos e Hábitos de Vida"
* item[=].type = #group

* item[=].item[+].linkId = "g1-tabagismo"
* item[=].item[=].text = "Status de Tabagismo"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#nao-fumante "Não Fumante"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#ex-fumante "Ex-Fumante"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#fumante "Fumante Ativo"

* item[=].item[+].linkId = "g1-atividade"
* item[=].item[=].text = "Nível de Atividade Física"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#nao-praticante "Não Praticante (Sedentário)"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#raramente "Raramente"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#regularmente "Regularmente"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#frequentemente "Frequentemente"

* item[=].item[+].linkId = "g1-estatina"
* item[=].item[=].text = "Faz uso regular de Estatina?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true

* item[=].item[+].linkId = "g1-antihipertensivo"
* item[=].item[=].text = "Faz uso regular de Anti-hipertensivo?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true

* item[=].item[+].linkId = "g1-evento-cv"
* item[=].item[=].text = "Histórico de Evento Cardiovascular Prévio"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#nenhum "Nenhum Evento Prévio"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#iam "Infarto Agudo do Miocárdio (IAM)"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#avc "Acidente Vascular Cerebral (AVC)"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#dap "Doença Arterial Periférica (DAP)"
* item[=].item[=].answerOption[+].valueCoding = CardioClinicalStatusCS#outro "Outro Evento Cardiovascular"

// Grupo 2: Sintomas de Alarme (SCA / AVC / Hipoglicemia)
* item[+].linkId = "g2-sintomas"
* item[=].text = "2. Sintomas de Alarme e Urgência"
* item[=].type = #group

* item[=].item[+].linkId = "g2-dor-toracica"
* item[=].item[=].text = "Apresenta dor ou aperto no peito / tórax com irradiação recente?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true

* item[=].item[+].linkId = "g2-deficit-neuro"
* item[=].item[=].text = "Apresenta fraqueza súbita em um lado do corpo, desvio de rima labial ou fala arrastada?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true

* item[=].item[+].linkId = "g2-dispneia-aguda"
* item[=].item[=].text = "Apresenta falta de ar intensa súbita ou em repouso?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true

* item[=].item[+].linkId = "g2-sintomas-hipo"
* item[=].item[=].text = "Apresenta sudorese fria, tremores, tontura severa ou confusão mental?"
* item[=].item[=].type = #boolean
* item[=].item[=].required = true
