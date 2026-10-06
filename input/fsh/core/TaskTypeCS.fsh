// Tipos e motivos de Task gravados pelo app (buildTask / buildTaskCardio).
CodeSystem: TaskTypeCS
Id: task-type
Title: "mareIA — Tipo e motivo de tarefa"
Description: "Códigos de Task (encaminhamento) e de motivo usados pela plataforma mareIA."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #encaminhamento-profissional "Encaminhamento ACS → Profissional de Saúde" "Encaminhamento do ATENTO 60+ do ACS para o profissional de saúde."
* #encaminhamento-cardioremoto "Encaminhamento CardioRemoto" "Encaminhamento gerado pela estratificação de risco do CardioRemoto."
* #idoso-fragil "Idoso frágil" "Motivo: classificação IVCF-20 frágil."
* #idoso-em-risco "Idoso em risco" "Motivo: classificação IVCF-20 em risco de fragilização."
* #vermelho "Risco vermelho (CardioRemoto)" "Motivo: nível de risco vermelho na estratificação do CardioRemoto."
* #laranja "Risco laranja (CardioRemoto)" "Motivo: nível de risco laranja na estratificação do CardioRemoto."
