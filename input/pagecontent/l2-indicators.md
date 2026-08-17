# 7. Indicadores de Monitoramento e Avaliação (DAK L2 — Measures)

Os **Indicadores de Programa da Plataforma mareIA** mensuram o desempenho clínico, a cobertura populacional, a adesão aos protocolos e a efetividade das intervenções no SUS, estruturados canonicamente como recursos `Measure` do FHIR R4 e computáveis via **CQL (Clinical Quality Language)**.

---

## 7.1 Indicadores do CardioRemoto (UFPB / HULW)

### 1. `MeasureCardioHba1cControlada` — Taxa de Controle Glicêmico
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/MeasureCardioHba1cControlada`
* **Tipo:** Desfecho Clínico (Outcome)
* **Objetivo:** Avaliar a proporção de pacientes diabéticos que atingiram controle glicêmico adequado (HbA1c < 7.0% para adultos ou < 8.0% para idosos frágeis).
* **População Inicial (Initial Population):** Pacientes com diagnóstico de Diabetes Mellitus Tipo 2 (`SCT 44054006`) acompanhados há mais de 90 dias no ambulatório do HULW.
* **Denominador:** Pacientes da população inicial com pelo menos 1 dosagem de Hemoglobina Glicada registrada no período de avaliação de 12 meses.
* **Numerador:** Pacientes do denominador cuja última dosagem de HbA1c (`LOINC 4548-4`) é `< 7.0%` (ou `< 8.0%` se idade ≥ 75 anos e IVCF-20 ≥ 15).
* **Meta Programática SUS:** $\ge 70\%$ da coorte monitorada.

### 2. `MeasureCardioPAControlada` — Taxa de Controle Pressórico
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/MeasureCardioPAControlada`
* **Tipo:** Desfecho Clínico (Outcome)
* **Objetivo:** Avaliar a proporção de pacientes hipertensos com pressão arterial controlada.
* **Denominador:** Pacientes com diagnóstico de Hipertensão Arterial Sistêmica (`SCT 38341003`) em telemonitoramento ativo.
* **Numerador:** Pacientes cuja média das últimas 3 aferições por dispositivo Bluetooth ANVISA apresenta $\text{PAS} < 140\text{ mmHg}$ e $\text{PAD} < 90\text{ mmHg}$.
* **Meta Programática SUS:** $\ge 75\%$ dos pacientes hipertensos.

---

## 7.2 Indicadores do ATENTO 60+ (UFPE / Recife-PE)

### 3. `MeasureAtento60CoberturaIVCF` — Cobertura de Rastreamento de Fragilidade
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/MeasureAtento60CoberturaIVCF`
* **Tipo:** Processo / Cobertura Assistencial
* **Objetivo:** Mensurar o alcance da busca ativa de vulnerabilidade funcional na pessoa idosa na Atenção Primária.
* **Denominador:** Total de pessoas idosas (idade $\ge 60$ anos) cadastradas no território da equipe da ESF.
* **Numerador:** Idosos com pelo menos 1 questionário IVCF-20 (`Questionnaire/atento60-ivcf20`) preenchido nos últimos 12 meses.
* **Meta Programática SUS:** $\ge 80\%$ da população idosa do território.

### 4. `MeasureAtento60PlanoCuidadoFragil` — Adesão ao Projeto Terapêutico Singular
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/MeasureAtento60PlanoCuidadoFragil`
* **Tipo:** Processo e Qualidade
* **Objetivo:** Avaliar se os idosos identificados como fráveis receberam plano de intervenção multiprofissional.
* **Denominador:** Idosos com escore total IVCF-20 $\ge 15$ pontos (Classificados como Frágeis).
* **Numerador:** Idosos do denominador com recurso `CarePlan` ativo registrado pela equipe da ESF/eMulti em até 30 dias após a classificação.
* **Meta Programática SUS:** $\ge 90\%$ dos idosos frágeis.

---

## 7.3 Indicadores do FamilIAr_Ativa (UFPel / CUIDATIVA)

### 5. `MeasureFamiliarAtivaControleDor` — Eficácia no Controle de Dor Aguda
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/MeasureFamiliarAtivaControleDor`
* **Tipo:** Desfecho Clínico
* **Objetivo:** Mensurar a capacidade de resolução rápida de episódios de dor intensa em ambiente domiciliar.
* **Denominador:** Total de episódios de dor intensa ($\text{ESAS-Dor} \ge 7/10$) registrados no aplicativo.
* **Numerador:** Episódios nos quais uma reavaliação em até 24 horas após a intervenção médica/farmacológica demonstrou redução $\ge 50\%$ na intensidade da dor ou escore $\le 3/10$.
* **Meta Programática SUS:** $\ge 85\%$ dos episódios críticos resolvidos em 24h.

### 6. `MeasureFamiliarAtivaSobrecargaCuidador` — Prevalência de Esgotamento do Cuidador
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/MeasureFamiliarAtivaSobrecargaCuidador`
* **Tipo:** Impacto Social e Psicossocial
* **Objetivo:** Monitorar a proporção de cuidadores familiares em situação de sobrecarga severa.
* **Denominador:** Total de cuidadores familiares principais acompanhados pelo programa de cuidados paliativos.
* **Numerador:** Cuidadores com escore da escala de Zarit $\ge 41$ pontos (Sobrecarga Severa).
* **Meta Programática SUS:** $< 15\%$ da coorte de cuidadores (meta de redução contínua através de suporte multiprofissional).

---

## 7.4 Indicadores do AgroSUS (FATEC Ferraz)

### 7.7 `AgroSUSMeasureAdesaoPeriodicidade` — Adesão à Vigilância Biológica da NR-7
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/AgroSUSMeasureAdesaoPeriodicidade`
* **Tipo:** Conformidade Regulatória e Sanitária
* **Objetivo:** Avaliar o cumprimento da periodicidade de exames laboratoriais de colinesterase em trabalhadores expostos.
* **Denominador:** Trabalhadores rurais com registro de manipulação frequente de organofosforados ou carbamatos.
* **Numerador:** Trabalhadores do denominador com dosagem laboratorial de colinesterase realizada no intervalo máximo de 6 meses.
* **Meta Programática SUS:** $\ge 80\%$ dos trabalhadores com exames periódicos em dia.

### 8. `AgroSUSMeasureCoberturaAnamnese` — Cobertura da Anamnese Ocupacional em Campo
* **ID Canônico:** `https://mareia.saude.gov.br/ig/Measure/AgroSUSMeasureCoberturaAnamnese`
* **Tipo:** Vigilância em Saúde do Trabalhador
* **Objetivo:** Medir a proporção de propriedades agrícolas mapeadas com anamnese de defensivos e uso de EPIs.
* **Denominador:** Total de estabelecimentos e propriedades da agricultura familiar cadastradas na microrregião.
* **Numerador:** Propriedades com questionário `AgroSUSAnamnese` aplicado pelo ACS Rural nos últimos 12 meses.
* **Meta Programática SUS:** $\ge 85\%$ das propriedades rurais cobertas.
