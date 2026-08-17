// Fonte L1: §6, §8, §10, Anexo 15.6.3. L2: 4-business-process, 6-decision-logic.
// REVISAR ADR-0004 (faixas) e ADR-0005 (periodicidade).
Instance: Atento60RiskStratification
InstanceOf: PlanDefinition
Usage: #definition
* status = #active
* experimental = false
* name = "Atento60RiskStratification"
* title = "ATENTO 60+ — Estratificação de risco, periodicidade e alertas"
* description = "Workflow de suporte à decisão: aplica o IVCF-20, classifica o risco, define a periodicidade de monitoramento e avalia gatilhos de alerta. Apoia (não substitui) o julgamento clínico."
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#workflow-definition
* library = Canonical(Atento60Ivcf20Logic)

// Ação 1 — Triagem
* action[+].title = "Aplicar IVCF-20 e coletar sinais vitais"
* action[=].description = "Aplicar o instrumento IVCF-20 e coletar sinais vitais por IoT (baseline)."
* action[=].definitionCanonical = Canonical(Atento60Ivcf20Questionnaire)

// Ação 2 — Classificar risco
* action[+].title = "Classificar faixa de risco (IVCF-20)"
* action[=].description = "Deriva a faixa de risco a partir do escore. REVISAR ADR-0004."
* action[=].action[+].title = "Robusto (baixo risco)"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%ivcfScore <= 6"
* action[=].action[+].title = "Em risco de fragilização (médio)"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%ivcfScore >= 7 and %ivcfScore <= 14"
* action[=].action[+].title = "Frágil (alto risco)"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%ivcfScore >= 15"

// Ação 3 — Definir periodicidade (REVISAR ADR-0005)
* action[+].title = "Definir periodicidade de monitoramento"
* action[=].description = "Periodicidade conforme a faixa de risco. REVISAR ADR-0005 (contraintuitivo no protocolo)."
* action[=].action[+].title = "Frágil → coleta a cada 3 meses"
* action[=].action[+].title = "Risco de fragilização → coleta a cada 2 meses"
* action[=].action[+].title = "Robusto → coleta a cada 1 mês"

// Ação 4 — Gatilhos de alerta (independem da faixa)
* action[+].title = "Avaliar gatilhos de alerta"
* action[=].description = "Gera alerta e notifica equipes. Alerta crítico antecipa agendamento / aumenta a frequência."
* action[=].action[+].title = "Queda (qualquer)"
* action[=].action[+].title = "Internação recente (< 6 meses)"
* action[=].action[+].title = "Sinal vital IoT fora de referência crítica (PA, FC, oximetria)"
* action[=].action[+].title = "Perda de peso não intencional"
* action[=].action[+].title = "IMC < 22"
* action[=].action[+].title = "Humor alterado"
* action[=].action[+].title = "Autopercepção piorando em visitas consecutivas"
