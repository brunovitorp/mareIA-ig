# 9. Cenários de Teste

Casos de teste representativos para homologação das regras de estratificação de risco, disparo de alertas e agendamento no **CardioRemoto**:

---

### Casos de Teste de Estratificação de Risco

| ID do Caso | Dados de Entrada | Resultado Esperado | Periodicidade |
|---|---|---|---|
| `TC-RISK-01` | PA: 125/80 mmHg, HbA1c: 6.5%, LDL: 90 mg/dL, Sem evento CV prévio | **Verde (Controlado)** | 90 dias |
| `TC-RISK-02` | PA: 145/92 mmHg, HbA1c: 6.8%, LDL: 110 mg/dL, Sem evento recente | **Amarelo (Moderado)** | 30 dias |
| `TC-RISK-03` | PA: 155/96 mmHg, HbA1c: 8.8%, LDL: 165 mg/dL | **Vermelho (Grave)** | 30 dias |
| `TC-RISK-04` | PA: 120/75 mmHg, HbA1c: 6.2%, Histórico de IAM há 4 meses | **Vermelho (Grave)** *(por evento recente)* | 30 dias |

---

### Casos de Teste de Alertas Clínicos

| ID do Caso | Parâmetro Crítico Informado | Nível de Alerta Disparado | Ação do Sistema |
|---|---|---|---|
| `TC-ALT-01` | PA: 185/122 mmHg | **Alerta Vermelho (Crítico)** | Notificação médica imediata / encaminhamento emergência |
| `TC-ALT-02` | Glicemia Capilar: 58 mg/dL | **Alerta Vermelho (Crítico)** | Alerta de hipoglicemia severa com conduta imediata |
| `TC-ALT-03` | Triglicerídeos: 1250 mg/dL | **Alerta Laranja (Grave)** | Encaminhamento prioritário ao médico e nutricionista |
| `TC-ALT-04` | LDL: 210 mg/dL | **Alerta Amarelo (Atenção)** | Agendamento de teleconsulta para ajuste terapêutico |
