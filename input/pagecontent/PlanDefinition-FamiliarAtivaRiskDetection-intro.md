Este `PlanDefinition` é o **workflow de suporte à decisão** do pathway FamilIAr_Ativa: registra o
ESAS, classifica o risco pela soma, avalia a sobrecarga do cuidador (Zarit), dispara as regras de
alerta (RA-01..RA-05) e ajusta a periodicidade de coleta. A detecção segue **protocolo auditável**
(RF-PS05); a predição por IA com **XAI** (RF-PS06) complementa — e não substitui — o julgamento
clínico.

#### Diagrama do processo (PlantUML)

{% include plandef-familiarativa.svg %}
<br clear="all"/>

#### Estrutura das ações

1. **Registrar sintomas (ESAS)** — `definitionCanonical` → `Questionnaire/familiarativa-esas`.
2. **Classificar nível de risco** — a partir da soma (`Library/FamiliarAtivaEsasZaritLogic`):
   `0–30` Baixo · `31–50` Moderado · `51–70` Alto. *(REVISAR ADR-0004.)*
3. **Avaliar sobrecarga do cuidador (Zarit)** — `definitionCanonical` →
   `Questionnaire/familiarativa-zarit`; 0–20 Leve · 21–40 Moderada · 41–88 Severa.
4. **Avaliar regras de alerta** — RA-01 (ESAS > 50), RA-02 (Zarit ≥ 41), RA-03 (queda de adesão),
   RA-04 (alerta aberto), RA-05 (risco Alto → mensagem bidirecional).
5. **Definir/ajustar periodicidade** — ESAS diário (2×/dia se risco Alto recente); Zarit mensal
   (semanal se Severa); adesão semanal (imediato se < 80% em 7 dias); dashboard do Gestor a cada
   hora (tempo real para alertas abertos).

*Fonte L1: DAK FamilIAr_Ativa, §4.2, §6.1–6.3 e Componente 7.*
