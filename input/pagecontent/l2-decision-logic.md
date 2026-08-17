# 6. Lógica de Suporte à Decisão Clínica

A lógica de suporte à decisão do **CardioRemoto** compreende duas frentes principais:
1. **Estratificação de Controle / Risco Cardiovascular**
2. **Sistema de Alertas Clínicos em 4 Níveis**

---

### 1. Matriz de Estratificação de Risco / Controle Clínico

| Estrato de Risco | Critérios Clínicos de Entrada | Periodicidade de Visitas | Ação Recomendada |
|---|---|---|---|
| **Verde (Controlado)** | PA < 140/90 mmHg E HbA1c < 7.0% E LDL < 130 mg/dL E sem evento cardiovascular no último ano | A cada **90 dias** (3 meses) | Manter conduta medicamentosa e monitoramento regular. |
| **Amarelo (Moderado)** | 1 ou 2 parâmetros fora da meta E sem evento cardiovascular recente | A cada **30 dias** (1 mês) | Teleconsulta de ajuste farmacológico e encaminhamento nutricional. |
| **Vermelho (Grave)** | ≥ 3 parâmetros fora da meta OU evento cardiovascular nos últimos 12 meses (IAM, AVC, DAP) | A cada **30 dias** (1 mês) | Avaliação médica prioritária e ajuste intensivo de tratamento. |

---

### 2. Matriz de Gatilhos de Alerta Clínico

| Nível do Alerta | Gatilhos e Condições | Prazo de Ação | Conduta Clínica |
|---|---|---|---|
| **Vermelho** *(Crítico/Imediato)* | PA ≥ 180/120 mmHg OU PA < 90/60 mmHg; Glicemia ≥ 250 mg/dL com sintomas OU < 70 mg/dL; Sinais de SCA/AVC; FC > 100 ou < 50 bpm | **Imediato** | Avaliação médica imediata / encaminhamento para emergência. |
| **Laranja** *(Grave)* | Triglicerídeos > 1000 mg/dL (risco de pancreatite); Perda de peso não intencional ≥ 5% | **Semanal a Quinzenal** | Encaminhamento médico e avaliação nutricional intensiva. |
| **Amarelo** *(Atenção)* | PA fora da meta não crítica (140–179 / 90–119 mmHg); LDL ≥ 190 mg/dL; HbA1c ≥ 7.0%; Glicemia > 300 mg/dL | **Quinzenal a Trimestral** | Agendamento de teleconsulta para ajuste terapêutico. |
| **Sem disparo** *(Verde)* | Todos os parâmetros dentro das metas clínicas | Conforme risco | Continuar acompanhamento conforme periodicidade do estrato. |
