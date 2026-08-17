Este `PlanDefinition` é o **workflow de suporte à decisão** do pathway ATENTO 60+: aplica o IVCF-20,
classifica o risco, define a periodicidade de monitoramento e avalia os gatilhos de alerta. A
plataforma **apoia** a decisão — o profissional mantém autonomia para aceitar, modificar ou recusar
as recomendações (Protocolo §9).

#### Diagrama do processo (PlantUML)

{% include plandef-atento60.svg %}
<br clear="all"/>

#### Estrutura das ações
1. **Aplicar IVCF-20 e coletar sinais vitais** — `definitionCanonical` → `Questionnaire/atento60-ivcf20`.
2. **Classificar faixa de risco** — a partir do escore (`Library/Atento60Ivcf20Logic`): `≤6` Robusto · `7–14` Risco de fragilização · `≥15` Frágil. *(REVISAR ADR-0004.)*
3. **Definir periodicidade** — Frágil → 3 meses · Médio → 2 meses · Robusto → 1 mês. *(REVISAR ADR-0005 — contraintuitivo no protocolo.)*
4. **Avaliar gatilhos de alerta** (independem da faixa) — queda; internação <6 meses; IoT fora de referência crítica (PA, FC, oximetria); perda de peso não intencional; IMC<22; humor alterado; autopercepção piorando.

*Fonte L1: Protocolo mareIA WP1 §6, §8, §10 e Anexo 15.6.3.*
