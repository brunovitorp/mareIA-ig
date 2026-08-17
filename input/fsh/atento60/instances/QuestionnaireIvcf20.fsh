// Fonte L1: Anexo 15.6.3 (IVCF-20). L2: 5-data-dictionary. REVISAR ADR-0004 (pesos/escore).
// Pontuação de cada opção expressa via extensão ordinalValue (SDC scoring).
Instance: Atento60Ivcf20Questionnaire
InstanceOf: Questionnaire
Usage: #definition
* status = #active
* experimental = false
* name = "Atento60Ivcf20"
* title = "IVCF-20 — Índice de Vulnerabilidade Clínico-Funcional (ATENTO 60+)"
* description = "Instrumento de triagem da vulnerabilidade clínico-funcional da pessoa idosa (20 itens). O escore total e a faixa de risco são derivados pelas regras de decisão (ver PlanDefinition)."
* subjectType = #Patient
* publisher = "Plataforma mareIA"
* copyright = "IVCF-20 © Moraes et al. Uso conforme a fonte original."

// 1. Idade
* item[+].linkId = "q01"
* item[=].text = "Qual é a sua idade?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#a60-74 "60 a 74 anos"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#a75-84 "75 a 84 anos"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 1
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#a85 "85 anos ou mais"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 3

// 2. Autopercepção da saúde
* item[+].linkId = "q02"
* item[=].text = "Comparando com pessoas de sua idade, como você diria que é sua saúde?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#saude-boa "Excelente, muito boa ou boa"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#saude-regular "Regular ou ruim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 1

// 3-5. AVD Instrumental (teto de grupo = 4 pts; aplicar na regra de escore — ADR-0004)
* item[+].linkId = "q03"
* item[=].text = "Por causa da saúde, deixou de fazer compras? (AVD-I — grupo q3-q5, teto 4 pts)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 4
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q04"
* item[=].text = "Deixou de controlar seu dinheiro, gastos ou contas? (AVD-I — grupo q3-q5, teto 4 pts)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 4
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q05"
* item[=].text = "Deixou de realizar pequenos trabalhos domésticos? (AVD-I — grupo q3-q5, teto 4 pts)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 4
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 6. AVD Básica
* item[+].linkId = "q06"
* item[=].text = "Por causa da saúde, deixou de tomar banho sozinho?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 6
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 7-9. Cognição
* item[+].linkId = "q07"
* item[=].text = "Algum familiar ou amigo falou que você está ficando esquecido?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 1
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q08"
* item[=].text = "Este esquecimento está piorando nos últimos meses?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 1
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q09"
* item[=].text = "Este esquecimento está impedindo a realização de alguma atividade do cotidiano?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 10-11. Humor
* item[+].linkId = "q10"
* item[=].text = "No último mês, ficou com desânimo, tristeza ou desesperança?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q11"
* item[=].text = "No último mês, perdeu o interesse ou prazer em atividades antes prazerosas?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 12-13. Mobilidade — alcance/preensão/pinça
* item[+].linkId = "q12"
* item[=].text = "Você é incapaz de elevar os braços acima do nível do ombro?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 1
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q13"
* item[=].text = "Você é incapaz de manusear ou segurar pequenos objetos?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 1
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 14. Capacidade aeróbica/muscular (teto 2)
* item[+].linkId = "q14"
* item[=].text = "Tem alguma destas condições: perda de peso não intencional; IMC < 22; panturrilha < 31 cm; marcha 4m > 5s?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 15-16. Marcha
* item[+].linkId = "q15"
* item[=].text = "Tem dificuldade para caminhar capaz de impedir alguma atividade do cotidiano?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q16"
* item[=].text = "Teve duas ou mais quedas no último ano?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 17. Continência
* item[+].linkId = "q17"
* item[=].text = "Perde urina ou fezes, sem querer, em algum momento?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 18-19. Comunicação (visão/audição)
* item[+].linkId = "q18"
* item[=].text = "Tem problemas de visão capazes de impedir alguma atividade do cotidiano? (permitido uso de óculos)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

* item[+].linkId = "q19"
* item[=].text = "Tem problemas de audição capazes de impedir alguma atividade do cotidiano? (permitido aparelho auditivo)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 2
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// 20. Comorbidades múltiplas (teto 4)
* item[+].linkId = "q20"
* item[=].text = "Tem alguma destas: 5+ doenças crônicas; uso de 5+ medicamentos/dia; internação nos últimos 6 meses?"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#sim "Sim"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 4
* item[=].answerOption[+].valueCoding = Atento60IvcfAnswerCS#nao "Não"
* item[=].answerOption[=].valueCoding.extension[$ordinalValue].valueDecimal = 0

// Escore total (preenchido pela regra de decisão — ver PlanDefinition/Library)
* item[+].linkId = "ivcf-score"
* item[=].text = "Escore total do IVCF-20 (0-40). Calculado pelas regras de decisão. REVISAR ADR-0004."
* item[=].type = #integer
* item[=].readOnly = true
