**Uso.** Registra o **resultado consolidado de um registro ESAS**: a soma dos 6 domínios
(`valueInteger`) e o nível de risco derivado (componente `nivelRisco`). Produzido após o
preenchimento do `Questionnaire/familiarativa-esas` e das regras do
`PlanDefinition/FamiliarAtivaRiskDetection` (BP-01, etapas 4–5).

**Escopo.** Uma observação por registro ESAS (padrão diário; 2×/dia se risco Alto recente). As
faixas de risco (0–30 / 31–50 / 51–70) estão sujeitas a confirmação clínica — a tabela do DAK vai
até 70, mas o máximo aritmético com 6 domínios é 60 (**REVISAR ADR-0004**). Fora de escopo: o
detalhamento domínio a domínio, que vive no `QuestionnaireResponse` e nas observações de sintoma.

**Identificadores.** `code` fixo `familiarativa-obs-code#esas-total-score`; `subject` (1..1) →
`FamiliarAtivaPatientPalliative`; `status` e `effective[x]` *must-support* — `effective[x]` é o
**timestamp imutável** exigido por RF-PC01. O componente de risco usa
`code` = `familiarativa-obs-code#esas-nivel-risco` com `valueCodeableConcept` ligado (*required*)
ao ValueSet `familiarativa-esas-risk-vs` (`baixo` · `moderado` · `alto`).

**Extensões.** **Sem extensões próprias.** O nível de risco é modelado como `component` (não como
extensão) — código distinto do `code` principal para satisfazer a invariante `obs-7`.

*Fonte L1: DAK FamilIAr_Ativa, §4.2 (etapas 4–5), §5.1 e §6.1.*
