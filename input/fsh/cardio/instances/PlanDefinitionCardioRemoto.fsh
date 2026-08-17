// Fonte L1: Metodologia §7.7.3 e §7.8.3, Requisitos RN001, RN003, RN004. L2: 4-business-process, 6-decision-logic.
Instance: PlanDefinitionCardioRemoto
InstanceOf: PlanDefinition
Usage: #definition
* status = #active
* experimental = false
* name = "PlanDefinitionCardioRemoto"
* title = "CardioRemoto — Estratificação de Risco, Alertas e Periodicidade"
* description = "Workflow clínico de suporte à decisão: realiza a triagem com IoT/laboratórios, classifica o risco (Verde, Amarelo, Vermelho), dispara alertas em 4 níveis e define a periodicidade de visitas no Ambulatório de Telessaúde do HULW."
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#workflow-definition
* library = Canonical(CardioLogic)

// Ação 1: Coleta e Triagem
* action[+].title = "Realizar triagem clínica e coleta de dados vitais IoT e laboratoriais"
* action[=].description = "Coleta de parâmetros antropométricos, vitais IoT e importação dos exames laboratoriais."
* action[=].definitionCanonical = Canonical(QuestionnaireCardioTriage)

// Ação 2: Estratificação de Controle e Risco
* action[+].title = "Classificar faixa de controle e risco cardiovascular"
* action[=].description = "Estratifica o paciente em Verde (Controlado), Amarelo (Moderado) ou Vermelho (Grave)."

* action[=].action[+].title = "Verde (Controlado)"
* action[=].action[=].description = "PA < 140/90 mmHg, HbA1c < 7.0%, LDL < 130 mg/dL e sem evento recente."
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%systolicBp < 140 and %diastolicBp < 90 and %hba1c < 7.0 and %ldl < 130 and %hasRecentCvEvent = false"

* action[=].action[+].title = "Amarelo (Moderado)"
* action[=].action[=].description = "1 a 2 parâmetros fora da meta e sem evento cardiovascular recente."
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%outOfTargetCount >= 1 and %outOfTargetCount <= 2 and %hasRecentCvEvent = false"

* action[=].action[+].title = "Vermelho (Grave)"
* action[=].action[=].description = "3 ou mais parâmetros fora da meta OU evento cardiovascular nos últimos 12 meses."
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%outOfTargetCount >= 3 or %hasRecentCvEvent = true"

// Ação 3: Definir Periodicidade de Visitas
* action[+].title = "Definir periodicidade de acompanhamento e teleconsultas"
* action[=].description = "Reavaliação periódica definida pelo estrato de risco."
* action[=].action[+].title = "Paciente Verde → Retorno / Reavaliação a cada 90 dias (3 meses)"
* action[=].action[+].title = "Paciente Amarelo / Vermelho → Retorno / Reavaliação a cada 30 dias (1 mês)"

// Ação 4: Avaliação de Gatilhos de Alerta Clínico
* action[+].title = "Avaliar gatilhos de alerta clínico"
* action[=].description = "Emissão de alertas automáticos estratificados por gravidade."

* action[=].action[+].title = "Alerta Vermelho (Crítico / Imediato)"
* action[=].action[=].description = "PA ≥ 180/120 ou < 90/60 mmHg; Glicemia ≥ 250 mg/dL c/ sintomas ou < 70 mg/dL; Sinais de SCA/AVC; FC > 100 ou < 50 bpm."

* action[=].action[+].title = "Alerta Laranja (Grave)"
* action[=].action[=].description = "Triglicerídeos > 1000 mg/dL ou perda ponderal severa ≥ 5%."

* action[=].action[+].title = "Alerta Amarelo (Atenção)"
* action[=].action[=].description = "PA 140–179/90–119 mmHg; LDL ≥ 190 mg/dL; HbA1c ≥ 7.0%; Glicemia > 300 mg/dL."
