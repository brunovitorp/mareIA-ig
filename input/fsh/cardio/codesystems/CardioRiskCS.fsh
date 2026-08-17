// Fonte L1: Metodologia §7.7.3.4, Requisitos RN001. L2: 6-decision-logic.
CodeSystem: CardioRiskCS
Id: cardio-risk
Title: "CardioRemoto — Estratos de Controle e Risco Cardiovascular"
Description: "Classificação de controle de risco clínico do paciente no pathway CardioRemoto."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #verde "Verde (Controlado)" "PA < 140/90, HbA1c < 7%, LDL < 130 mg/dL e sem evento cardiovascular recente."
* #amarelo "Amarelo (Moderado)" "1 ou 2 parâmetros fora da meta e sem evento cardiovascular recente."
* #vermelho "Vermelho (Grave)" ">= 3 parâmetros fora da meta OU evento cardiovascular recente (< 1 ano)."
