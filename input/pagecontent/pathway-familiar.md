# Pathway 3: FamilIAr_Ativa (Telemonitoramento em Cuidados Paliativos Domiciliares)

- **População-Alvo:** Pacientes em cuidados paliativos domiciliares com doenças crônicas avançadas e seus cuidadores familiares principais.
- **Instituição Líder:** UFPel (Universidade Federal de Pelotas / CUIDATIVA / RS).
- **ID Canônico FHIR:** `br.gov.mareia.familiarativa`
- **Fonte L1:** *Protocolo Clínico DAK L2 FamilIAr_Ativa (UFPel/CUIDATIVA/RNP)*.

---

## 1. Justificativa Clínica e Escopo

O alívio do sofrimento, o controle de sintomas refratários e a preservação do bem-estar do cuidador exigem respostas rápidas e contínuas no ambiente domiciliar. O FamilIAr_Ativa integra:
1. **Escala de Sintomas de Edmonton (ESAS):** Avaliação de 10 sintomas-chave: Dor, Cansaço, Náusea, Depressão, Ansiedade, Sonolência, Apetite, Bem-estar, Falta de Ar e Sintoma Adicional (escore 0–10).
2. **Escala de Sobrecarga do Cuidador (Zarit Burden Interview — Versão Breve):** Mensuração do estresse físico, emocional e financeiro do cuidador.
3. **Detecção Híbrida de Risco (Protocolo + IA Explicável - XAI):**
   - **Regras Clínicas Determinísticas:** Gatilhos para dor intensa (>= 7/10), dispneia aguda ou exaustão do cuidador.
   - **Modelos Preditivos de Descompensação:** Algoritmos de aprendizado de máquina com explicabilidade (SHAP/LIME) que alertam a equipe multiprofissional com antecedência.
4. **Acionamento da Equipe Domiciliar:** Flags clínicos e notificações priorizadas no painel da UBS e do serviço de cuidados paliativos.

---

## 2. Diagramas de Fluxo, Decisão e Sequência

### 2.1 Fluxo Clínico e Macrofases
<div style="text-align: center; margin: 20px 0;">
  <img src="process-familiarativa.svg" alt="Fluxo Clínico FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.2 Algoritmo de Suporte à Decisão (PlanDefinition)
<div style="text-align: center; margin: 20px 0;">
  <img src="plandef-familiarativa.svg" alt="Algoritmo de Decisão FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.3 Atores e Casos de Uso
<div style="text-align: center; margin: 20px 0;">
  <img src="actors-familiarativa.svg" alt="Atores e Papéis FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.4 Diagrama de Sequência de Alertas
<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-familiarativa.svg" alt="Sequência de Intervenção FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3. Artefatos FHIR R4 Principais

- **Perfis:** `FamiliarAtivaPatientPalliative`, `RelatedPersonCaregiver`, `ObservationEsasScore`, `ObservationEsasSymptom`, `ObservationZaritScore`, `FlagClinicalAlert`.
- **Formulários:** `QuestionnaireEsas`, `QuestionnaireZarit`.
- **Lógica e Suporte:** `PlanDefinitionFamiliarAtiva`, `Library/EsasZaritLogic`.
- **Indicadores (Measures):** `MeasureFamiliarAtivaControleDor`, `MeasureFamiliarAtivaSobrecargaCuidador`.
