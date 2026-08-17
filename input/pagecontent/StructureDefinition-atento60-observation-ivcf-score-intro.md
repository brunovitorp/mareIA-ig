**Uso.** Registra o **resultado do IVCF-20**: o escore total (`valueInteger`, 0–40) e a faixa de
risco derivada (componente `faixa`). Produzido após a aplicação do `Questionnaire/atento60-ivcf20` e
das regras do `PlanDefinition/Atento60RiskStratification`.

**Escopo.** Uma observação por aplicação do IVCF-20 (triagem inicial e cada ciclo do *Sentinel loop*).
O escore e as faixas estão sujeitos a confirmação clínica (**REVISAR ADR-0004**). Fora de escopo: o
detalhamento item a item das respostas, que vive no `QuestionnaireResponse`.

**Identificadores.** `code` fixo `atento60-obs-code#ivcf-20-score`; `subject` (1..1) →
`Atento60PatientElderly`; `status` e `effective[x]` *must-support*. O componente de faixa usa
`code` = `atento60-obs-code#ivcf-20-faixa` com `valueCodeableConcept` ligado (*required*) ao
ValueSet `atento60-ivcf-risk-vs` (`robusto` · `risco-fragilizacao` · `fragil`).

**Extensões.** **Sem extensões próprias.** A faixa de risco é modelada como `component` (não como
extensão) — código distinto do `code` principal para satisfazer a invariante `obs-7`.

*Fonte L1: Protocolo mareIA WP1, Anexo 15.6.3; §8 e §10.*
