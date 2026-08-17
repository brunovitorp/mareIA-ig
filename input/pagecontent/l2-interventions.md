# 1. Intervenções e Recomendações Clínicas (DAK L2 — Intervenções)

As **Intervenções e Recomendações de Saúde da Plataforma mareIA** traduzem as diretrizes do **Ministério da Saúde**, da **Organização Mundial da Saúde (OMS)** e dos comitês científicos acadêmicos (UFPB, UFPE, UFPel e FATEC) em especificações computáveis para execução no SUS.

---

## 1.1 🫀 CardioRemoto — Manejo de Diabetes Mellitus e Hipertensão Arterial

* **População-Alvo:** Cidadãos adultos e idosos acompanhados na Atenção Ambulatorial Especializada e Atenção Primária com diagnóstico de DM2 e/ou HAS.
* **Fontes L1:** Diretrizes Brasileiras de Hipertensão Arterial (SBC/SBH 2020), Diretrizes da Sociedade Brasileira de Diabetes (SBD 2023) e Protocolo Clínico CardioRemoto HULW/UFPB.
* **Artefato FHIR L3:** `PlanDefinition/PlanDefinitionCardioRemoto`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Condição / Gatilho Clínico | Intervenção Clínica Recomendada | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-CR-01` | **Acolhimento e Linha de Base** | Triagem clínica inicial, registro antropométrico e solicitação de exames basais (HbA1c, Perfil Lipídico, Creatinina e TFG). | Aplicação do `Questionnaire/CardioTriage` e pareamento dos dispositivos Bluetooth. |
| `INT-CR-02` | **Controle Estável (Estrato Verde)**<br>PA < 140/90 mmHg e HbA1c < 7.0% | Reforço de adesão terapêutica, orientações dietéticas e agendamento de telemonitoramento longitudinal. | Definição de periodicidade de reavaliação para **90 dias**; Envio de mensagens educativas. |
| `INT-CR-03` | **Descontrole Moderado (Estrato Amarelo)**<br>PA 140–179/90–109 ou HbA1c 7.0–8.9% | Avaliação de adesão (Morisky), ajuste dietético por nutricionista e titulação de anti-hipertensivos/antidiabéticos. | Redução da periodicidade para **30 dias**; Notificação na fila de teleconsultoria do HULW. |
| `INT-CR-04` | **Crise Hipertensiva / Descontrole Grave (Vermelho)**<br>PA ≥ 180/110 mmHg ou Glicemia > 300 mg/dL | Avaliação imediata de sintomas de lesão de órgão-alvo (precordialgia, dispneia, cefaleia refratária, déficits). | Disparo de **Alerta Nível 1**; Notificação com tela cheia para o médico plantonista; Teleconsulta de emergência. |

---

## 1.2 🧓 ATENTO 60+ — Rastreamento e Gestão da Fragilidade na Pessoa Idosa

* **População-Alvo:** Pessoas com 60 anos ou mais adscritas ao território da Estratégia Saúde da Família (ESF).
* **Fontes L1:** Caderneta de Saúde da Pessoa Idosa (MS), Manual do IVCF-20 (Moraes et al.) e Protocolo Clínico mareIA Idoso (UFPE / Recife-PE).
* **Artefato FHIR L3:** `PlanDefinition/PlanDefinitionAtento60`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Classificação Funcional / Gatilho | Intervenção Clínica Recomendada | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-AT-01` | **Idoso Robusto (0 a 6 pontos)** | Promoção da saúde, vacinação, estímulo à atividade física comunitária e preservação da autonomia. | Agendamento de reavaliação anual do IVCF-20 (`Questionnaire/atento60-ivcf20`). |
| `INT-AT-02` | **Em Risco de Fragilização (7 a 14 pontos)** | Elaboração compartilhada do Projeto Terapêutico Singular (PTS), intervenção nutricional preventiva e grupos de equilíbrio. | Definição de telemonitoramento **trimestral**; Alerta preventivo na UBS. |
| `INT-AT-03` | **Idoso Frágil (≥ 15 pontos)** | **Avaliação Geriátrica Ampla (AGA)** por equipe multiprofissional (eMulti), visita domiciliar prioritária e prevenção ativa de quedas. | Definição de acompanhamento **mensal**; Emissão de `CarePlan` prioritário na APS. |
| `INT-AT-04` | **Evento Sentinela (Queda Recente / SpO2 < 92%)** | Investigação imediata de instabilidade postural, hipotensão ortostática, polifarmácia e riscos ambientais no domicílio. | Emissão de `FlagClinicalAlert` (`high`); Notificação da equipe da ESF para visita em 7 dias. |

---

## 1.3 🏡 FamilIAr_Ativa — Cuidados Paliativos Domiciliares e Suporte ao Cuidador

* **População-Alvo:** Pacientes com doenças crônicas ameaçadoras da vida em atenção domiciliar e seus cuidadores familiares.
* **Fontes L1:** Diretrizes da Academia Nacional de Cuidados Paliativos (ANCP) e DAK L2 FamilIAr_Ativa (UFPel/CUIDATIVA).
* **Artefato FHIR L3:** `PlanDefinition/PlanDefinitionFamiliarAtiva`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Dimensão / Gatilho Clínico | Intervenção Clínica Recomendada | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-FA-01` | **Monitoramento Diário de Sintomas** | Avaliação sistemática de 10 sintomas pelo paciente/cuidador através da Escala ESAS (0–10). | Registro estruturado via `Questionnaire/familiarativa-esas`. |
| `INT-FA-02` | **Dor Intensa ou Dispneia Aguda (ESAS ≥ 7)** | Ajuste imediato da posologia analgésica de resgate (opioides) e orientações não-farmacológicas de alívio do sofrimento. | Disparo de regra `RA-01`; Emissão de `FlagClinicalAlert` de prioridade crítica para médico do CUIDATIVA. |
| `INT-FA-03` | **Sobrecarga Severa do Cuidador (Zarit ≥ 41)** | Apoio psicossocial, acolhimento pelo serviço social, treinamento de técnicas de manejo e reorganização de rede de apoio. | Disparo de regra `RA-02`; Emissão de tarefa para equipe de Psicologia e Assistência Social. |
| `INT-FA-04` | **Alerta Preditivo por IA (Probabilidade > 70%)** | Intervenção proativa preventiva antes da instalação de crise álgica ou dispneica aguda no domicílio. | Notificação explicável com valores SHAP detalhando os fatores de descompensação. |

---

## 1.4 🌾 AgroSUS — Saúde do Trabalhador Rural e Vigilância Toxicológica

* **População-Alvo:** Pequenos produtores, agricultores familiares e trabalhadores rurais expostos a agrotóxicos.
* **Fontes L1:** Norma Regulamentadora n.º 7 (NR-7 / Portaria MTP 672), Diretrizes da Rede Nacional de Atenção Integral à Saúde do Trabalhador (RENAST) e Protocolo AgroSUS (FATEC Ferraz).
* **Artefato FHIR L3:** `PlanDefinition/AgroSUSEstratificacaoRisco`

### Matriz de Recomendações e Intervenções:

| Código Intervenção | Classificação / Queda Enzimática | Intervenção Clínica e Ocupacional | Ação Automatizada no Sistema |
|---|---|---|---|
| `INT-AG-01` | **Busca Ativa e Anamnese Ocupacional** | Mapeamento no campo de culturas agrícolas, agrotóxicos utilizados, hábitos de pulverização e uso de EPIs. | Aplicação de `Questionnaire/AgroSUSAnamnese` por ACS Rural via app Offline-First. |
| `INT-AG-02` | **Estabelecimento da Linha de Base** | Coleta de sangue para determinação dos valores basais individuais de Colinesterase Eritrocitária e Plasmática. | Registro estruturado em `AgroSUSResultadoLaboratorial` como valor basal (100%). |
| `INT-AG-03` | **Alerta de Sobre-exposição (Queda 30%–50%)** | Orientação técnica de segurança, inspeção sanitária de EPIs e redução da jornada de manipulação de químicos. | Agendamento de retestagem em 15 a 30 dias na UBS; Alerta no prontuário. |
| `INT-AG-04` | **Intoxicação / Queda Crítica (> 50% ou Sintomas)** | **Afastamento temporário imediato das atividades com agrotóxicos**, consulta médica prioritária e monitoramento de sequelas. | Emissão de `AgroSUSPlanoAcompanhamento`; Geração de ficha de notificação compulsória no SINAN. |
