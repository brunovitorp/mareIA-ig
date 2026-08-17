// Fonte L1: DAK §1.1, §4.2 (BP-01) e §5.1 (dicionário ESAS). L2: 5-data-dictionary.
// 6 domínios inteiros 0–10; código LOINC por item conforme o DAK (REVISAR ADR-0004).
Instance: FamiliarAtivaEsasQuestionnaire
InstanceOf: Questionnaire
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaEsas"
* title = "ESAS — Escala de Avaliação de Sintomas de Edmonton (FamilIAr_Ativa)"
* description = "Formulário diário de sintomas do paciente em cuidados paliativos domiciliares: 6 domínios com intensidade de 0 (ausente) a 10 (pior possível). A soma e o nível de risco são derivados pelas regras de decisão (ver PlanDefinition). Preenchido pelo cuidador (Cenário B) ou pelo paciente em autocuidado (Cenário A)."
* subjectType = #Patient
* publisher = "Plataforma mareIA"
* copyright = "ESAS © Bruera et al. Uso conforme a fonte original."

// 1. Dor
* item[+].linkId = "dor"
* item[=].code = $loinc#38208-5
* item[=].text = "Dor — de 0 (sem dor) a 10 (pior dor possível)"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 10

// 2. Dispneia
* item[+].linkId = "dispneia"
* item[=].code = $loinc#89443-6
* item[=].text = "Falta de ar (dispneia) — de 0 (sem falta de ar) a 10 (pior falta de ar possível)"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 10

// 3. Ansiedade
* item[+].linkId = "ansiedade"
* item[=].code = $loinc#89444-4
* item[=].text = "Ansiedade — de 0 (sem ansiedade) a 10 (pior ansiedade possível)"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 10

// 4. Cansaço
* item[+].linkId = "cansaco"
* item[=].code = $loinc#89445-1
* item[=].text = "Cansaço (fadiga) — de 0 (sem cansaço) a 10 (pior cansaço possível)"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 10

// 5. Apetite
* item[+].linkId = "apetite"
* item[=].code = $loinc#89446-9
* item[=].text = "Falta de apetite — de 0 (apetite normal) a 10 (pior falta de apetite possível)"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 10

// 6. Bem-estar
* item[+].linkId = "bem-estar"
* item[=].code = $loinc#89447-7
* item[=].text = "Mal-estar (bem-estar geral) — de 0 (melhor sensação de bem-estar) a 10 (pior sensação possível)"
* item[=].type = #integer
* item[=].required = true
* item[=].extension[$minValue].valueInteger = 0
* item[=].extension[$maxValue].valueInteger = 10
