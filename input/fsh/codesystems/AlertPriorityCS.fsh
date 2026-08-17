// Fonte L1: Metodologia §7.7.3.6, Requisitos RN004. L2: 6-decision-logic.
CodeSystem: AlertPriorityCS
Id: cardio-alert-priority
Title: "CardioRemoto — Níveis de Prioridade de Alerta Clínico"
Description: "Níveis de prioridade para os alertas clínicos gerados pelo telemonitoramento da plataforma mareIA."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #sem-disparo "Sem disparo (Verde)" "Todos os parâmetros nas metas clínicas."
* #amarelo "Amarelo (Atenção)" "Parâmetros fora da meta não críticos; conduta em até 15-90 dias."
* #laranja "Laranja (Grave)" "Triglicerídeos > 1000 mg/dL ou perda ponderal severa; conduta semanal."
* #vermelho "Vermelho (Crítico / Imediato)" "Crise hipertensiva, hipoglicemia severa ou sinais de SCA/AVC; conduta imediata."
