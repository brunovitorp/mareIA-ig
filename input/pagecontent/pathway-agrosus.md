# Pathway 4: AgroSUS (Saúde do Trabalhador Rural e Intoxicações por Defensivos)

- **População-Alvo:** Pequenos produtores, agricultores familiares e trabalhadores rurais expostos ocupacional ou ambientalmente a defensivos agrícolas.
- **Instituição Líder:** FATEC Ferraz de Vasconcelos (SP).
- **ID Canônico FHIR:** `br.gov.mareia.agrosus`
- **Fonte L1:** *Diretrizes de Saúde do Trabalhador Rural, NR-7 (Portaria MTP n.º 672) e Protocolo AgroSUS*.

---

## 1. Justificativa Clínica e Escopo

A exposição ocupacional a defensivos agrícolas (organofosforados, carbamatos, piretroides, etc.) constitui grave problema de saúde pública com frequente subnotificação e diagnóstico tardio. O módulo AgroSUS estrutura:
1. **Anamnese Ocupacional Padronizada:** Instrumento aplicado por ACS para registro de tipo de cultivo, agrotóxicos manipulados, uso e higienização de EPIs, forma de aplicação (costal, tratorizada), descarte de embalagens e histórico de intoxicações prévias.
2. **Vigilância Biológica (Colinesterase Plasmática e Eritrocitária):**
   - **Exame Basal (Pré-admissional / Pré-exposição):** Estabelecimento da linha de base individual.
   - **Monitoramento Periódico (NR-7):** no mínimo semestral. O resultado é **Alterado** quando a inibição em relação ao basal excede o IBMP (> 50% na colinesterase plasmática ou > 25% no sangue total/eritrocitária) e fica em **Precaução** a partir de 20% sem atingir o IBMP.
   - **Conduta frente a resultado alterado:** afastamento do contato com o agrotóxico por 30 dias, avaliação clínica e laboratorial, retestagem após 30 dias e investigação de outras causas antes de concluir pela exposição ocupacional.
   - **Gatilhos de alerta independentes:** sintoma agudo compatível com intoxicação, produto de categoria toxicológica 1 ou 2 sem EPI adequado e histórico de intoxicação prévia. Não existe escore composto de risco (ADR-0002).
3. **Plano de Cuidado e Acompanhamento na UBS:** Encaminhamento médico prioritário, orientação de boas práticas e vigilância dos familiares e comunicantes.

---

## 2. Diagramas de Fluxo, Decisão e Sequência

### 2.1 Fluxo Clínico e Vigilância Ocupacional
<div style="text-align: center; margin: 20px 0;">
  <img src="process-agrosus.svg" alt="Fluxo Clínico AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.2 Algoritmo de Suporte à Decisão (PlanDefinition)
<div style="text-align: center; margin: 20px 0;">
  <img src="plandef-agrosus.svg" alt="Algoritmo de Decisão AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.3 Atores e Casos de Uso
<div style="text-align: center; margin: 20px 0;">
  <img src="actors-agrosus.svg" alt="Atores e Papéis AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 2.4 Diagrama de Sequência de Vigilância e Afastamento
<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-agrosus.svg" alt="Sequência de Vigilância AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3. Artefatos FHIR R4 Principais

- **Perfis:** `AgroSUSPatient`, `AgroSUSACS`, `AgroSUSProfissionalUBS`, `AgroSUSVisitaACS`, `AgroSUSAtendimentoUBS`, `AgroSUSResultadoLaboratorial`, `AgroSUSPlanoAcompanhamento`, `AgroSUSIntoxicacaoPesticida`.
- **Formulários:** `agrosus-anamnese` (Anamnese ocupacional e ambiental).
- **Lógica e Suporte:** `AgroSUSEstratificacaoRisco` (PlanDefinition), `AgroSUSIntoxicacaoLogic` (Library).
- **Indicadores (Measures):** `AgroSUSMeasureCoberturaAnamnese`, `AgroSUSMeasureCoberturaBasal`, `AgroSUSMeasureCoberturaEPI`, `AgroSUSMeasureAdesaoPeriodicidade`, `AgroSUSMeasureAlteradosComConduta`.
