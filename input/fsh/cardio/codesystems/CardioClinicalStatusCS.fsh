// Fonte L1: Metodologia §7.6.3.1, Requisitos RF002. L2: 5-data-dictionary.
CodeSystem: CardioClinicalStatusCS
Id: cardio-clinical-status
Title: "CardioRemoto — Fatores Clínicos e Hábitos de Vida"
Description: "Códigos locais para fatores de risco, tabagismo, nível de atividade física e histórico de eventos cardiovasculares."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true

// Status de Tabagismo
* #nao-fumante "Não Fumante" "Indivíduo que não faz uso de derivados do tabaco."
* #ex-fumante "Ex-Fumante" "Indivíduo que cessou o uso de tabaco."
* #fumante "Fumante Ativo" "Indivíduo que consome tabaco regularmente."

// Nível de Atividade Física
* #nao-praticante "Não Praticante (Sedentário)" "Não pratica atividades físicas regulares."
* #raramente "Raramente" "Pratica atividade física esporádica (< 1x por semana)."
* #regularmente "Regularmente" "Pratica atividade física recomendada (150 min/semana)."
* #frequentemente "Frequentemente" "Pratica atividade física intensa (> 3x por semana)."

// Evento Cardiovascular Prévio
* #nenhum "Nenhum Evento Prévio" "Sem histórico de eventos cardiovasculares maiores."
* #iam "Infarto Agudo do Miocárdio (IAM)" "Histórico prévio documentado de IAM."
* #avc "Acidente Vascular Cerebral (AVC)" "Histórico prévio de AVC isquêmico ou hemorrágico."
* #dap "Doença Arterial Periférica (DAP)" "Histórico documentado de vasculopatia periférica."
* #outro "Outro Evento Cardiovascular" "Outros eventos cardiovasculares ateroscleróticos."
