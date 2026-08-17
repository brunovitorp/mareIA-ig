// Fonte L1: DAK §6.1 (tabela DMN de risco ESAS). L2: 6-decision-logic. REVISAR ADR-0004.
CodeSystem: FamiliarAtivaEsasRiskCS
Id: familiarativa-esas-risk
Title: "Níveis de risco do ESAS (FamilIAr_Ativa)"
Description: "Classificação de risco derivada da soma dos 6 domínios do ESAS. Faixas conforme o DAK (0–30 / 31–50 / 51–70 — REVISAR ADR-0004: máximo aritmético é 60)."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #baixo "Baixo" "Soma ESAS de 0 a 30."
* #moderado "Moderado" "Soma ESAS de 31 a 50."
* #alto "Alto" "Soma ESAS de 51 a 70. Gera alerta e notificação ao profissional vinculado."
