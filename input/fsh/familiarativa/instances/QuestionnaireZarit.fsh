// Fonte L1: DAK §1.1 e §5.2 (Escala Zarit, 22 itens, 0–4). L2: 5-data-dictionary.
// IMPORTANTE (ADR-0005): o texto oficial dos itens do Zarit Burden Interview (ZBI-22) é protegido
// por direitos autorais e NÃO consta no DAK fonte; os itens abaixo usam placeholders. O texto
// oficial deve ser inserido apenas mediante licença de uso do instrumento.
Instance: FamiliarAtivaZaritQuestionnaire
InstanceOf: Questionnaire
Usage: #definition
* status = #draft
* experimental = false
* name = "FamiliarAtivaZarit"
* title = "Escala Zarit (ZBI-22) — Sobrecarga do Cuidador (FamilIAr_Ativa)"
* description = "Avaliação periódica de sobrecarga do cuidador familiar: 22 itens com resposta de 0 a 4 (pontuação total 0–88). A classificação (Leve/Moderada/Severa) é derivada pelas regras de decisão (ver PlanDefinition). Texto oficial dos itens pendente de licença — ver ADR-0005."
* subjectType = #RelatedPerson
* publisher = "Plataforma mareIA"
* copyright = "Zarit Burden Interview © Zarit, Reever & Bach-Peterson. Itens não reproduzidos neste IG; uso do texto oficial condicionado a licença (ADR-0005)."

// Item 1
* item[+].linkId = "z01"
* item[=].text = "Item 1 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 2
* item[+].linkId = "z02"
* item[=].text = "Item 2 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 3
* item[+].linkId = "z03"
* item[=].text = "Item 3 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 4
* item[+].linkId = "z04"
* item[=].text = "Item 4 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 5
* item[+].linkId = "z05"
* item[=].text = "Item 5 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 6
* item[+].linkId = "z06"
* item[=].text = "Item 6 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 7
* item[+].linkId = "z07"
* item[=].text = "Item 7 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 8
* item[+].linkId = "z08"
* item[=].text = "Item 8 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 9
* item[+].linkId = "z09"
* item[=].text = "Item 9 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 10
* item[+].linkId = "z10"
* item[=].text = "Item 10 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 11
* item[+].linkId = "z11"
* item[=].text = "Item 11 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 12
* item[+].linkId = "z12"
* item[=].text = "Item 12 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 13
* item[+].linkId = "z13"
* item[=].text = "Item 13 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 14
* item[+].linkId = "z14"
* item[=].text = "Item 14 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 15
* item[+].linkId = "z15"
* item[=].text = "Item 15 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 16
* item[+].linkId = "z16"
* item[=].text = "Item 16 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 17
* item[+].linkId = "z17"
* item[=].text = "Item 17 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 18
* item[+].linkId = "z18"
* item[=].text = "Item 18 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 19
* item[+].linkId = "z19"
* item[=].text = "Item 19 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 20
* item[+].linkId = "z20"
* item[=].text = "Item 20 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 21
* item[+].linkId = "z21"
* item[=].text = "Item 21 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
// Item 22
* item[+].linkId = "z22"
* item[=].text = "Item 22 da Escala Zarit (ZBI-22) — texto oficial sob licença; ver ADR-0005"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 4
