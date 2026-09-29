# Pathway 2: ATENTO 60+ (Telemonitoramento da Pessoa Idosa)

- **População-Alvo:** Pessoas idosas (>= 60 anos) cadastradas e acompanhadas na Atenção Primária à Saúde (APS / Estratégia Saúde da Família).
- **Instituição Líder:** UFPE (Universidade Federal de Pernambuco / Recife-PE).
- **ID Canônico FHIR:** `br.gov.mareia.atento60`
- **Fonte L1:** *Protocolo Clínico Geral mareIA / Linha de Cuidado do Idoso (UFPE)*.

---

## 1. Justificativa Clínica e Escopo

O envelhecimento populacional exige ferramentas ágeis de identificação precoce da fragilidade clínico-funcional para prevenção de quedas, perda de autonomia e hospitalizações evitáveis. O ATENTO 60+ fundamenta-se em:
1. **Instrumento IVCF-20 (Índice de Vulnerabilidade Clínico-Funcional):** 20 questões multidimensionais cobrindo idade, autopercepção de saúde, atividades da vida diária (AVDs), cognição, humor, mobilidade, continência, comunicação e comorbidades múltiplas (escore de 0 a 40).
2. **Estratificação em 3 Níveis e Periodicidade de Coleta:**
   - **Robusto (0 a 6 pontos):** coleta a cada 1 mês.
   - **Em Risco de Fragilização (7 a 14 pontos):** coleta a cada 2 meses.
   - **Frágil (>= 15 pontos):** coleta a cada 3 meses.

   > ⚠️ Esta periodicidade é a do protocolo L1 e é inversa ao risco. Está em revisão pela equipe clínica (ver [Lógica de Decisão](l2-decision-logic.html), seção 6.5).
3. **Gatilhos de Alerta (independentes da faixa):** queda, internação recente (< 6 meses), sinal vital IoT fora da referência crítica (PA, FC, oximetria), perda de peso não intencional, IMC < 22, humor alterado e autopercepção da saúde piorando entre visitas.
4. **Resiliência Offline-First:** Coleta em tablets por Agentes Comunitários de Saúde (ACS) em domicílio sem necessidade de sinal de celular constante.

---

## 2. Diagramas de Fluxo e Decisão Clínica

### 2.1 Fluxo Clínico em 4 Macrofases
<div style="text-align: center; margin: 20px 0;">
  <img src="process-atento60.svg" alt="Fluxo Clínico ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.2 Algoritmo de Decisão (PlanDefinition)
<div style="text-align: center; margin: 20px 0;">
  <img src="plandef-atento60.svg" alt="Algoritmo de Decisão ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.3 Atores e Casos de Uso
<div style="text-align: center; margin: 20px 0;">
  <img src="actors-atento60.svg" alt="Atores e Papéis ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.4 Diagrama de Sequência de Visita Domiciliar
<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-atento60.svg" alt="Sequência de Intervenção ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3. Artefatos FHIR R4 Principais

- **Perfis:** `Atento60PatientElderly`, `Atento60ObservationIvcfScore`, `Atento60ObservationIotVital`.
- **Formulários:** `Atento60Ivcf20Questionnaire` (pontuação HL7 SDC via `ordinalValue`).
- **Lógica e Suporte:** `Atento60RiskStratification` (PlanDefinition), `Atento60Ivcf20Logic` (Library).
- **Indicadores (Measures):** `Atento60MeasureCadastro`, `Atento60MeasureCompletude`, `Atento60MeasureAlertas`, `Atento60MeasureOffline`.
