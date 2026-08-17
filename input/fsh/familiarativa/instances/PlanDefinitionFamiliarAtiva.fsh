// Fonte L1: DAK §4.2 (BP-01), §6.1–6.3 (tabelas DMN e regras RA) e Componente 7 (agendamento).
// L2: 4-business-process, 6-decision-logic. REVISAR ADR-0004 (faixas ESAS).
Instance: FamiliarAtivaRiskDetection
InstanceOf: PlanDefinition
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaRiskDetection"
* title = "FamilIAr_Ativa — Detecção de risco, alertas e agendamento"
* description = "Workflow de suporte à decisão: registra o ESAS, classifica o risco pela soma, avalia a Zarit, dispara as regras de alerta (RA-01..RA-05) e ajusta a periodicidade de coleta. Detecção por protocolo auditável (RF-PS05); a predição por IA com XAI (RF-PS06) complementa e não substitui o julgamento clínico."
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#workflow-definition
* library = Canonical(FamiliarAtivaEsasZaritLogic)

// Ação 1 — Registrar ESAS
* action[+].title = "Registrar sintomas (ESAS)"
* action[=].description = "Preencher os 6 domínios ESAS (0–10); soma e timestamp imutável gerados pelo sistema (BP-01)."
* action[=].definitionCanonical = Canonical(FamiliarAtivaEsasQuestionnaire)

// Ação 2 — Classificar nível de risco (ESAS)
* action[+].title = "Classificar nível de risco (soma ESAS)"
* action[=].description = "Deriva o nível de risco a partir da soma. REVISAR ADR-0004."
* action[=].action[+].title = "Baixo — exibir confirmação de envio; sem alerta"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%somaEsas <= 30"
* action[=].action[+].title = "Moderado — exibir confirmação; registrar para tendência"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%somaEsas >= 31 and %somaEsas <= 50"
* action[=].action[+].title = "Alto — orientar cuidador; criar alerta; notificar profissional"
* action[=].action[=].condition[+].kind = #applicability
* action[=].action[=].condition[=].expression.language = #text/fhirpath
* action[=].action[=].condition[=].expression.expression = "%somaEsas >= 51 and %somaEsas <= 70"

// Ação 3 — Avaliar sobrecarga do cuidador (Zarit)
* action[+].title = "Avaliar sobrecarga do cuidador (Zarit)"
* action[=].description = "Aplicar o ZBI-22 (22 itens 0–4); pontuação 0–88. Classificação: 0–20 Leve · 21–40 Moderada · 41–88 Severa."
* action[=].definitionCanonical = Canonical(FamiliarAtivaZaritQuestionnaire)

// Ação 4 — Regras de alerta (RA-01..RA-05)
* action[+].title = "Avaliar regras de alerta ativas"
* action[=].description = "Cria e mantém alertas (Flag) e notificações conforme as regras do DAK §6.3."
* action[=].action[+].title = "RA-01 · soma ESAS > 50 → alerta ESAS_ALTO + notificar profissional + mensagem ao cuidador"
* action[=].action[+].title = "RA-02 · Zarit >= 41 → alerta ZARIT_SEVERA + notificar profissional"
* action[=].action[+].title = "RA-03 · dias sem registro > janela esperada → sinalizar queda de adesão no painel do Gestor"
* action[=].action[+].title = "RA-04 · alerta Aberto sem resolução → manter visível como 'requer atenção'"
* action[=].action[+].title = "RA-05 · nível de risco Alto → mensagem bidirecional (cuidador + profissional)"

// Ação 5 — Agendamento (DAK Componente 7; ServiceRequest.occurrence[x])
* action[+].title = "Definir/ajustar periodicidade de coleta"
* action[=].description = "Frequências padrão configuradas pelo profissional no cadastro do vínculo clínico."
* action[=].action[+].title = "ESAS diário → 2×/dia se risco Alto recente (profissional)"
* action[=].action[+].title = "Zarit mensal → semanal se classificação Severa na última avaliação (profissional)"
* action[=].action[+].title = "Notificação de adesão semanal → alerta imediato se taxa < 80% em 7 dias (automático)"
* action[=].action[+].title = "Dashboard do Gestor a cada hora → tempo real para alertas abertos (automático)"
