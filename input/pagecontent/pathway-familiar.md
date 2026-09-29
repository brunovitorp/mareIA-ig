# Pathway 3: FamilIAr_Ativa (Telemonitoramento em Cuidados Paliativos Domiciliares)

- **População-Alvo:** Pacientes em cuidados paliativos domiciliares com doenças crônicas avançadas e seus cuidadores familiares principais.
- **Instituição Líder:** UFPel (Universidade Federal de Pelotas / CUIDATIVA / RS).
- **ID Canônico FHIR:** `br.gov.mareia.familiarativa`
- **Fonte L1:** *Protocolo Clínico DAK L2 FamilIAr_Ativa (UFPel/CUIDATIVA/RNP)*.

---

## 1. Justificativa Clínica e Escopo

O alívio do sofrimento, o controle de sintomas refratários e a preservação do bem-estar do cuidador exigem respostas rápidas e contínuas no ambiente domiciliar. O FamilIAr_Ativa integra:
1. **Escala de Sintomas de Edmonton (ESAS):** registro diário de 6 domínios — dor, falta de ar, ansiedade, cansaço, falta de apetite e mal-estar —, cada um de 0 a 10. A soma define o nível de risco: Baixo (0–30), Moderado (31–50) ou Alto (≥ 51).
2. **Escala de Sobrecarga do Cuidador (Zarit, ZBI-22):** 22 itens de 0 a 4 (total 0–88): Leve (0–20), Moderada (21–40) ou Severa (41–88).
3. **Detecção de Risco (Protocolo Auditável + IA Explicável):**
   - **Regras de Alerta RA-01 a RA-05:** soma ESAS > 50, Zarit ≥ 41, queda de adesão ao registro, alerta aberto sem resolução e mensagem bidirecional em risco Alto.
   - **Predição por IA com XAI:** complementa as regras e não substitui o julgamento clínico; a predição é exibida ao profissional com os fatores de maior peso e depende da validação dele.
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

- **Perfis:** `FamiliarAtivaPatientPalliative`, `FamiliarAtivaRelatedPersonCaregiver`, `FamiliarAtivaObservationEsasScore`, `FamiliarAtivaObservationEsasSymptom`, `FamiliarAtivaObservationZaritScore`, `FamiliarAtivaFlagClinicalAlert`.
- **Formulários:** `FamiliarAtivaEsasQuestionnaire`, `FamiliarAtivaZaritQuestionnaire`.
- **Lógica e Suporte:** `FamiliarAtivaRiskDetection` (PlanDefinition), `FamiliarAtivaEsasZaritLogic` (Library).
- **Indicadores (Measures):** `FamiliarAtivaMeasureAdesao`, `FamiliarAtivaMeasureMediaEsas`, `FamiliarAtivaMeasureRiscoAlto`, `FamiliarAtivaMeasureSobrecargaSevera`, `FamiliarAtivaMeasureResolucaoAlertas`, `FamiliarAtivaMeasureTempoResolucao`, `FamiliarAtivaMeasureEngajamentoEducativo`.
