# ADR-0004 — Estratificação de Risco e Gatilhos de Alerta do CardioRemoto

- **Status:** Aceito (2026-06-22)
- **Decisores:** Equipe UFPB / HULW + Claude

## Contexto
O protocolo clínico do CardioRemoto (UFPB/HULW) estabelece regras para monitoramento de pacientes com Diabetes Mellitus (DM) e Hipertensão Arterial Sistêmica (HAS):
- **Classificação de Risco (Controle Clínico):**
  - **Verde (Controlado):** PA < 140/90 mmHg, HbA1c < 7%, LDL < 130 mg/dL (ou < 100 mg/dL para alto risco), sem evento cardiovascular aterosclerótico nos últimos 12 meses.
  - **Amarelo (Moderado):** 1 a 2 parâmetros fora da meta e sem evento cardiovascular recente.
  - **Vermelho (Grave):** 3 ou mais parâmetros fora da meta OU evento cardiovascular recente (< 12 meses).
- **Sistema de Alertas (4 níveis):**
  - **Vermelho (Imediato):** PA ≥ 180/120 mmHg ou PA < 90/60 mmHg; Glicemia ≥ 250 mg/dL com sintomas ou < 70 mg/dL; Sinais de síndrome coronariana aguda ou AVC; FC > 100 ou < 50 bpm.
  - **Laranja (Semanal a Quinzenal):** Triglicerídeos > 1000 mg/dL; perda de peso não intencional ≥ 5%.
  - **Amarelo (Quinzenal a Trimestral):** PA fora da meta (não crítico); LDL ≥ 190 mg/dL; HbA1c ≥ 7%; Glicemia > 300 mg/dL (sem sintomas críticos).
  - **Sem disparo (Verde):** Todos os parâmetros na meta.

## Decisão
Codificar a classificação de risco e os 4 níveis de alertas na `Library` CQL e no `PlanDefinition`, utilizando CodeSystems locais `cardio-risk` e `cardio-alert-priority` compatíveis com o modelo FHIR R4.

## Consequências
- (+) Suporte automatizado à decisão clínica na plataforma mareIA.
- (+) Clareza na priorização da lista de pacientes para os profissionais do HULW.
