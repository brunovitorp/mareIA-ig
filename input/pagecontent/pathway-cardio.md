# Pathway 1: CardioRemoto (DM / HAS e Risco Cardiovascular)

- **População-Alvo:** Adultos e idosos com Diabetes Mellitus Tipo 2 e/ou Hipertensão Arterial Sistêmica com fatores de risco cardiovascular aterosclerótico.
- **Cenário de Aplicação:** Ambulatório de Telessaúde da Endocrinologia do Hospital Universitário Lauro Wanderley (HULW / UFPB), João Pessoa/PB.
- **ID Canônico FHIR:** `br.gov.mareia.cardio`
- **Fonte L1:** *Protocolo Clínico CardioRemoto (Metodologia HULW/UFPB)*.

---

## 1. Justificativa Clínica e Escopo

O Diabetes Mellitus (DM) e a Hipertensão Arterial Sistêmica (HAS) são os maiores determinantes de morbimortalidade cardiovascular no SUS. O CardioRemoto estabelece um fluxo contínuo de telecuidado baseado em:
1. **Sinais Vitais IoT:** Aferição domiciliar ou ambulatorial de Pressão Arterial (sistólica/diastólica), Frequência Cardíaca e Glicemia Capilar com dispositivos Bluetooth homologados ANVISA.
2. **Avaliação Laboratorial:** Hemoglobina Glicada (HbA1c), LDL-c, HDL-c, Triglicerídeos, Creatinina e Taxa de Filtração Glomerular (CKD-EPI).
3. **Estratificação Automatizada de Risco:**
   - **Verde (Controlado):** PA < 140/90 mmHg, HbA1c < 7.0%, LDL na meta.
   - **Amarelo (Moderado):** Desvios moderados ou não atingimento de meta lipídica/glicêmica sem sintomas de gravidade.
   - **Vermelho (Grave):** PA >= 180/110 mmHg, Glicemia > 300 mg/dL ou < 70 mg/dL, ou disfunção renal aguda.
4. **Periodicidade e Agendamento Inteligente:** Monitoramento a cada 90 dias (Verde) ou 30 dias (Amarelo/Vermelho), com priorização da fila por dias de atraso.
5. **Integração com AGHUX (EBSERH):** Sincronização bidirecional de dados clínicos e laudos de teleconsultoria.

---

## 2. Diagrama de Fluxo e Decisão Clínica (PlanDefinition)

<div style="text-align: center; margin: 20px 0;">
  <img src="plandef-cardio.svg" alt="Algoritmo de Decisão CardioRemoto" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3. Artefatos FHIR R4 Principais

- **Perfis:** `PatientCardio`, `ObservationCardioVital`, `ObservationCardioLab`, `ObservationCardioRisk`.
- **Formulários:** `QuestionnaireCardioTriage` (Triagem clínica e antropométrica).
- **Lógica e Suporte:** `PlanDefinitionCardioRemoto`, `Library/CardioLogic`.
- **Indicadores (Measures):** `MeasureCardioHba1cControlada`, `MeasureCardioPAControlada`.
