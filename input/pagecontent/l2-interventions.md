# 1. Intervenções e Recomendações Clínicas (DAK L2 — Intervenções)

As **Intervenções e Recomendações de Saúde da Plataforma mareIA** traduzem as diretrizes do **Ministério da Saúde**, da **Organização Mundial da Saúde (OMS)** e dos comitês científicos acadêmicos (UFPB, UFPE, UFPel e FATEC) em especificações computáveis para execução no SUS.

Os limiares de cada intervenção seguem a [Lógica de Suporte à Decisão](l2-decision-logic.html), que reproduz as regras do L3.

---

## 1.1 🫀 CardioRemoto — Manejo de Diabetes Mellitus e Hipertensão Arterial

* **População-Alvo:** Cidadãos adultos e idosos acompanhados na Atenção Ambulatorial Especializada e Atenção Primária com diagnóstico de DM2 e/ou HAS.
* **Fontes L1:** Diretrizes Brasileiras de Hipertensão Arterial (SBC/SBH 2020), Diretrizes da Sociedade Brasileira de Diabetes (SBD 2023) e Protocolo Clínico CardioRemoto HULW/UFPB.
* **Artefato FHIR L3:** `PlanDefinition/PlanDefinitionCardioRemoto`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Condição / Gatilho Clínico | Intervenção Clínica Recomendada | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-CR-01` | **Acolhimento e Linha de Base** | Triagem clínica inicial, registro antropométrico e solicitação de exames basais (HbA1c, perfil lipídico, creatinina e TFG). | Aplicação do `QuestionnaireCardioTriage` e pareamento dos dispositivos Bluetooth. |
| `INT-CR-02` | **Controle Estável (Estrato Verde)**<br>PA < 140/90, HbA1c < 7,0%, LDL < 130 e sem evento CV recente | Reforço de adesão terapêutica, orientações dietéticas e educação em saúde para DCNT. | Reavaliação a cada **90 dias**; envio de mensagens educativas. |
| `INT-CR-03` | **Descontrole Moderado (Estrato Amarelo)**<br>1 ou 2 parâmetros fora da meta, sem evento CV recente | Teleconsulta para ajuste terapêutico e encaminhamento ao nutricionista. | Reavaliação a cada **30 dias**; alertas Amarelos na fila de teleconsulta do HULW. |
| `INT-CR-04` | **Descontrole Grave (Estrato Vermelho)**<br>3 parâmetros fora da meta ou evento CV nos últimos 12 meses | Avaliação médica prioritária e ajuste terapêutico intensivo. | Reavaliação a cada **30 dias** com prioridade na lista do painel. |
| `INT-CR-05` | **Alerta Vermelho (Imediato)**<br>PA ≥ 180/120 ou < 90/60; glicemia ≥ 250 com sintomas ou < 70; FC > 100 ou < 50; sinais de SCA/AVC | Avaliação médica imediata e encaminhamento à emergência se necessário. | Alerta Vermelho no topo da lista de prioridades; notificação push ao médico. |

---

## 1.2 🧓 ATENTO 60+ — Rastreamento e Gestão da Fragilidade na Pessoa Idosa

* **População-Alvo:** Pessoas com 60 anos ou mais adscritas ao território da Estratégia Saúde da Família (ESF).
* **Fontes L1:** Caderneta de Saúde da Pessoa Idosa (MS), Manual do IVCF-20 (Moraes et al.) e Protocolo Clínico mareIA Idoso (UFPE / Recife-PE).
* **Artefato FHIR L3:** `PlanDefinition/Atento60RiskStratification`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Classificação Funcional / Gatilho | Intervenção Clínica Recomendada | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-AT-01` | **Idoso Robusto (0 a 6 pontos)** | Promoção da saúde, vacinação, estímulo à atividade física comunitária e preservação da autonomia. | Coleta a cada **1 mês** (`Atento60Ivcf20Questionnaire`). |
| `INT-AT-02` | **Em Risco de Fragilização (7 a 14 pontos)** | Elaboração compartilhada do Projeto Terapêutico Singular (PTS), intervenção nutricional preventiva e grupos de equilíbrio. | Coleta a cada **2 meses**. |
| `INT-AT-03` | **Idoso Frágil (≥ 15 pontos)** | **Avaliação Geriátrica Ampla (AGA)** por equipe multiprofissional (eMulti), visita domiciliar prioritária e prevenção ativa de quedas. | Coleta a cada **3 meses**. |
| `INT-AT-04` | **Gatilho de Alerta**<br>Queda, internação < 6 meses, sinal vital IoT crítico, perda de peso não intencional, IMC < 22, humor alterado ou autopercepção piorando | Investigação conforme o gatilho: instabilidade postural e riscos domiciliares, reconciliação medicamentosa, avaliação nutricional ou avaliação do humor. | Alerta e notificação à equipe; antecipação do agendamento ou aumento da frequência de coleta. |

> ⚠️ A periodicidade por faixa é a do protocolo L1 e é inversa ao risco; está em revisão (ver [Lógica de Decisão](l2-decision-logic.html), seção 6.5).

---

## 1.3 🏡 FamilIAr_Ativa — Cuidados Paliativos Domiciliares e Suporte ao Cuidador

* **População-Alvo:** Pacientes com doenças crônicas ameaçadoras da vida em atenção domiciliar e seus cuidadores familiares.
* **Fontes L1:** Diretrizes da Academia Nacional de Cuidados Paliativos (ANCP) e DAK L2 FamilIAr_Ativa (UFPel/CUIDATIVA).
* **Artefato FHIR L3:** `PlanDefinition/FamiliarAtivaRiskDetection`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Dimensão / Gatilho Clínico | Intervenção Clínica Recomendada | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-FA-01` | **Monitoramento Diário de Sintomas** | Registro dos 6 domínios do ESAS (dor, falta de ar, ansiedade, cansaço, falta de apetite e mal-estar, 0–10 cada) pelo paciente ou cuidador. | Registro via `FamiliarAtivaEsasQuestionnaire`; soma e nível de risco calculados pelo sistema. |
| `INT-FA-02` | **Risco Alto (soma ESAS > 50)** | Ajuste da analgesia e do controle de sintomas; orientação ao cuidador. | Regras `RA-01` (alerta ESAS_ALTO) e `RA-05` (mensagem bidirecional); ESAS 2×/dia. |
| `INT-FA-03` | **Sobrecarga Severa do Cuidador (Zarit ≥ 41)** | Apoio psicossocial, acolhimento pelo serviço social, treinamento de técnicas de manejo e reorganização da rede de apoio. | Regra `RA-02` (alerta ZARIT_SEVERA); Zarit semanal. |
| `INT-FA-04` | **Queda de Adesão ou Alerta sem Resolução** | Contato ativo com o cuidador para entender a interrupção dos registros. | Regras `RA-03` (ADESAO_BAIXA no painel do Gestor) e `RA-04` ("requer atenção"). |
| `INT-FA-05` | **Predição por IA com XAI** | Avaliação proativa pelo profissional, que valida a predição antes de qualquer conduta. | Predição exibida com os fatores de maior peso; complementa, sem substituir, as regras RA. |

---

## 1.4 🌾 AgroSUS — Saúde do Trabalhador Rural e Vigilância Toxicológica

* **População-Alvo:** Pequenos produtores, agricultores familiares e trabalhadores rurais expostos a agrotóxicos.
* **Fontes L1:** Norma Regulamentadora n.º 7 (NR-7 / Portaria MTP 672), Nota Informativa nº 16/2019-CGLAB/DAEVS/SVS/MS, Diretrizes da RENAST e Protocolo AgroSUS (FATEC Ferraz).
* **Artefato FHIR L3:** `PlanDefinition/AgroSUSEstratificacaoRisco`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Classificação / Gatilho | Intervenção Clínica e Ocupacional | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-AG-01` | **Busca Ativa e Anamnese Ocupacional** | Mapeamento no campo de culturas agrícolas, agrotóxicos utilizados, hábitos de pulverização e uso de EPIs. | Aplicação da `agrosus-anamnese` por ACS rural via app offline-first. |
| `INT-AG-02` | **Estabelecimento da Linha de Base** | Coleta de sangue no exame admissional, antes do manuseio, para o valor basal individual de colinesterase. Sem basal, afastar por 30 dias e realizar o exame. | Registro em `AgroSUSResultadoLaboratorial` como valor basal. |
| `INT-AG-03` | **Precaução**<br>Inibição ≥ 20% sem exceder o IBMP | Reforço das práticas de proteção (EPI e técnica de aplicação). Sem afastamento automático. | Alerta de prioridade `atencao` no prontuário. |
| `INT-AG-04` | **Resultado Alterado**<br>Inibição > 50% (plasmática) ou > 25% (sangue total) | **Afastamento do contato com agrotóxicos por 30 dias**, avaliação clínica e laboratorial e investigação de outras causas. | Alerta `critica`; `AgroSUSPlanoAcompanhamento`; retestagem em 30 dias. |
| `INT-AG-05` | **Sintoma agudo, produto categoria 1–2 sem EPI ou intoxicação prévia** | Avaliação clínica prioritária na UBS. Em caso de intoxicação, notificação compulsória no SINAN pelo profissional. | Alerta independente (sem escore composto); registro da notificação no item `caso-notificado-sinan` da anamnese. |
