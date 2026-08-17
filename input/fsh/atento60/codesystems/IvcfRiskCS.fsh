// Fonte L1: Anexo 15.6.3 (Score). L2: 6-decision-logic. REVISAR ADR-0004.
CodeSystem: Atento60IvcfRiskCS
Id: atento60-ivcf-risk
Title: "Faixas de risco do IVCF-20 (ATENTO 60+)"
Description: "Classificação de vulnerabilidade clínico-funcional pelo IVCF-20. Faixas conforme protocolo (REVISAR ADR-0004)."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #robusto "Idoso robusto (baixo risco)" "Escore IVCF-20 de 0 a 6."
* #risco-fragilizacao "Em risco de fragilização (médio)" "Escore IVCF-20 de 7 a 14."
* #fragil "Idoso frágil (alto risco)" "Escore IVCF-20 maior ou igual a 15."
