// Fonte L1: Metodologia §7.6.3. L2: 5-data-dictionary.
CodeSystem: CardioObsCodeCS
Id: cardio-obs-code
Title: "CardioRemoto — Códigos de Observação Local"
Description: "Códigos locais para observações calculadas e estratificações de risco na plataforma mareIA."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #cardio-risk-score "Classificação de Risco Cardiovascular" "Resultado da classificação clínica (Verde, Amarelo, Vermelho)."
* #waist-to-height-ratio "Relação Cintura / Altura" "Cálculo da relação entre circunferência da cintura e altura."
* #days-overdue "Dias de Atraso da Visita" "Número de dias decorridos além do prazo previsto da próxima visita."
