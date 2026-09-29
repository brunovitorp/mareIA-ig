# 6. Lógica de Suporte à Decisão Clínica (DAK L2 — Tabelas DMN)

A Lógica de Decisão da **Plataforma mareIA** formaliza o raciocínio clínico e as condutas assistenciais por meio de **Tabelas de Decisão DMN (Decision Model and Notation)** e bibliotecas computáveis FHIR R4 (`Library` e `PlanDefinition`).

As tabelas abaixo reproduzem as regras codificadas no L3 (`input/fsh/**`), que por sua vez citam as fontes L1 de cada linha de cuidado. Pontos em que o L1 é ambíguo ou em que L1 e L3 divergem estão listados na seção **6.5 Pendências de Validação Clínica**.

---

## 6.1 🧓 ATENTO 60+ — Suporte à Decisão na Atenção Primária

*Fonte L3: `Library/Atento60Ivcf20Logic`, `PlanDefinition/Atento60RiskStratification`, `Questionnaire/Atento60Ivcf20Questionnaire`. Fonte L1: protocolo ATENTO 60+ §6, §8, §10 e Anexo 15.6.3.*

### 6.1.1 Algoritmo de Cálculo do Escore IVCF-20 (com Tetos de Grupo)

Cada item do IVCF-20 é uma pergunta Sim/Não (exceto idade e autopercepção), com pontuação expressa via extensão SDC `ordinalValue`. O escore total é a soma das pontuações, respeitando os tetos de grupo:

| Domínio | Itens | Pontuação por resposta | Teto do grupo |
|---|---|---|---|
| **Idade** | `q01` | 60–74 anos = 0 · 75–84 anos = 1 · ≥ 85 anos = 3 | 3 |
| **Autopercepção da saúde** | `q02` | Excelente/muito boa/boa = 0 · Regular/ruim = 1 | 1 |
| **AVD Instrumental** | `q03` compras · `q04` dinheiro · `q05` trabalhos domésticos | Sim = 4 cada | **4** (grupo q03–q05) |
| **AVD Básica** | `q06` banho | Sim = 6 | 6 |
| **Cognição** | `q07` esquecimento · `q08` piora · `q09` impede atividades | Sim = 1 · 1 · 2 | 4 |
| **Humor** | `q10` desânimo/tristeza · `q11` perda de interesse | Sim = 2 · 2 | 4 |
| **Mobilidade — membros superiores** | `q12` elevar braços · `q13` segurar objetos | Sim = 1 · 1 | 2 |
| **Mobilidade — sarcopenia/marcha** | `q14` perda de peso, IMC < 22, panturrilha < 31 cm ou marcha 4 m > 5 s | Sim = 2 | **2** |
| **Mobilidade — marcha** | `q15` dificuldade para caminhar | Sim = 2 | 2 |
| **Quedas** | `q16` duas ou mais quedas no último ano | Sim = 2 | 2 |
| **Continência** | `q17` perda de urina ou fezes | Sim = 2 | 2 |
| **Comunicação** | `q18` visão · `q19` audição | Sim = 2 · 2 | 4 |
| **Comorbidades múltiplas** | `q20` 5+ doenças crônicas, 5+ medicamentos/dia ou internação nos últimos 6 meses | Sim = 4 | **4** |
| **ESCORE TOTAL IVCF-20** | `q01` a `q20` | Soma com aplicação dos tetos | **0 a 40** |

### 6.1.2 Tabela de Decisão DMN — Estratificação Clínico-Funcional e Periodicidade

| Regra ID | Escore IVCF-20 | Código (`Atento60IvcfRiskCS`) | Status Clínico | Periodicidade de coleta (L3) |
|---|---|---|---|---|
| `DT-AT-01` | **0 a 6** | `robusto` | Idoso robusto (baixo risco) | A cada **1 mês** |
| `DT-AT-02` | **7 a 14** | `risco-fragilizacao` | Em risco de fragilização (médio) | A cada **2 meses** |
| `DT-AT-03` | **≥ 15** | `fragil` | Idoso frágil (alto risco) | A cada **3 meses** |

> ⚠️ A periodicidade acima é a do protocolo L1, reproduzida no L3. Ela é **inversa** à intuição clínica (o idoso mais frágil é visto com menos frequência) e está marcada como `REVISAR ADR-0005` no FSH. Ver seção 6.5.

### 6.1.3 Gatilhos de Alerta (independentes da faixa de risco)

Qualquer gatilho presente gera alerta e notifica a equipe. Um alerta crítico antecipa o agendamento ou aumenta a frequência de coleta. A prioridade é atribuída com `Atento60AlertPriorityCS` (`alta`, `media`, `baixa`); o protocolo não fixa uma prioridade por gatilho.

| Gatilho ID | Condição detectada | Fonte do dado |
|---|---|---|
| `GA-AT-01` | **Queda** (qualquer) | `q16 = Sim` ou registro avulso de queda |
| `GA-AT-02` | **Internação recente** (< 6 meses) | `q20` ou registro de internação |
| `GA-AT-03` | **Sinal vital IoT fora da referência crítica** (PA, FC ou oximetria) | `Atento60ObservationIotVital` |
| `GA-AT-04` | **Perda de peso não intencional** | `q14` ou série de peso por balança IoT |
| `GA-AT-05` | **IMC < 22 kg/m²** | `q14` ou peso/altura registrados |
| `GA-AT-06` | **Humor alterado** | `q10 = Sim` ou `q11 = Sim` |
| `GA-AT-07` | **Autopercepção da saúde piorando** em visitas consecutivas | `q02` comparado entre visitas |

---

## 6.2 🫀 CardioRemoto — Suporte à Decisão Cardiovascular e Telessaúde

*Fonte L3: `PlanDefinition/PlanDefinitionCardioRemoto`, `CardioRiskCS`, `AlertPriorityCS`. Fonte L1: Metodologia HULW/UFPB §7.7.3.4–§7.7.3.6; Requisitos RN001–RN004; ADR-0004.*

### 6.2.1 Tabela de Decisão DMN — Estratificação em 3 Estratos

Os **parâmetros de controle** são: pressão arterial (meta < 140/90 mmHg), HbA1c (meta < 7,0%) e LDL (meta < 130 mg/dL). `outOfTargetCount` é o número de parâmetros fora da meta (0 a 3). **Evento cardiovascular recente** é IAM, AVC ou outro evento aterosclerótico nos últimos 12 meses.

| Regra ID | Condição (FHIRPath do L3) | Estrato (`CardioRiskCS`) | Periodicidade |
|---|---|---|---|
| `DT-CR-01` | PA < 140/90 **E** HbA1c < 7,0% **E** LDL < 130 **E** sem evento CV recente | 🟢 `verde` — Controlado | **90 dias** |
| `DT-CR-02` | 1 ou 2 parâmetros fora da meta **E** sem evento CV recente | 🟡 `amarelo` — Moderado | **30 dias** |
| `DT-CR-03` | ≥ 3 parâmetros fora da meta **OU** evento CV recente | 🔴 `vermelho` — Grave | **30 dias** (avaliação médica prioritária) |

### 6.2.2 Matriz de Alertas em 4 Níveis (`AlertPriorityCS`)

| Alerta ID | Nível | Gatilho | Prazo | Conduta |
|---|---|---|---|---|
| `AL-CR-01` | 🔴 `vermelho` — Crítico | PA ≥ 180/120 mmHg **ou** PA < 90/60 mmHg | Imediato | Avaliação médica imediata / encaminhamento à emergência |
| `AL-CR-02` | 🔴 `vermelho` — Crítico | Glicemia capilar ≥ 250 mg/dL **com sintomas** **ou** < 70 mg/dL | Imediato | Conduta imediata para hiper/hipoglicemia aguda |
| `AL-CR-03` | 🔴 `vermelho` — Crítico | FC > 100 bpm **ou** < 50 bpm | Imediato | Avaliação médica imediata |
| `AL-CR-04` | 🔴 `vermelho` — Crítico | Sinais de SCA ou AVC (dor torácica, déficit neurológico, dispneia aguda) | Imediato | Encaminhamento imediato à emergência |
| `AL-CR-05` | 🟠 `laranja` — Grave | Triglicerídeos > 1000 mg/dL | Semanal a quinzenal | Encaminhamento médico + nutricionista (risco de pancreatite) |
| `AL-CR-06` | 🟠 `laranja` — Grave | Perda de peso involuntária ≥ 5% | Semanal a quinzenal | Investigação clínica + apoio nutricional |
| `AL-CR-07` | 🟡 `amarelo` — Atenção | PA fora da meta, não crítica (140–179 / 90–119 mmHg) | Quinzenal a trimestral | Teleconsulta para ajuste anti-hipertensivo |
| `AL-CR-08` | 🟡 `amarelo` — Atenção | LDL ≥ 190 mg/dL **ou** HbA1c ≥ 7,0% **ou** glicemia > 300 mg/dL sem sintomas | Quinzenal a trimestral | Teleconsulta + nutricionista; ajuste de estatina/hipoglicemiante |
| `AL-CR-09` | ⚪ `sem-disparo` | Todos os parâmetros na meta | Conforme estrato | Seguir monitoramento regular |

---

## 6.3 🏡 FamilIAr_Ativa — Detecção de Risco em Cuidados Paliativos

*Fonte L3: `Library/FamiliarAtivaEsasZaritLogic`, `PlanDefinition/FamiliarAtivaRiskDetection`, `FamiliarAtivaAlertTypeCS`. Fonte L1: DAK FamilIAr_Ativa §4.2, §6.1–6.3 e Componente 7.*

### 6.3.1 Nível de Risco pela Soma ESAS

O ESAS do L3 tem **6 domínios** (dor, dispneia, ansiedade, cansaço, falta de apetite e mal-estar), cada um de 0 a 10. O sistema calcula a soma (`somaEsas`) e grava um timestamp imutável.

| Regra ID | Soma ESAS | Nível (`FamiliarAtivaEsasRiskCS`) | Resposta do sistema |
|---|---|---|---|
| `DT-FA-01` | **0 a 30** | `baixo` | Confirmação de envio; sem alerta |
| `DT-FA-02` | **31 a 50** | `moderado` | Confirmação de envio; registro para análise de tendência |
| `DT-FA-03` | **51 a 70** | `alto` | Orientação ao cuidador + alerta + notificação ao profissional vinculado |

> ⚠️ As faixas vêm do DAK de origem e vão até 70, mas com 6 domínios o máximo aritmético é **60** (`REVISAR ADR-0004` no FSH).

### 6.3.2 Sobrecarga do Cuidador pela Escala de Zarit (ZBI-22)

A Zarit tem 22 itens de 0 a 4, com pontuação total de 0 a 88.

| Regra ID | Pontuação Zarit | Classificação (`FamiliarAtivaZaritClassCS`) |
|---|---|---|
| `DT-FA-04` | **0 a 20** | Leve |
| `DT-FA-05` | **21 a 40** | Moderada |
| `DT-FA-06` | **41 a 88** | Severa (notificar profissional — RA-02) |

### 6.3.3 Regras de Alerta (RA-01 a RA-05)

| Regra ID | Condição | Tipo de alerta (`Flag.code`) | Resposta do sistema |
|---|---|---|---|
| `RA-01` | `somaEsas > 50` | `esas-alto` (ESAS_ALTO) | Alerta + notificação ao profissional + mensagem ao cuidador |
| `RA-02` | `zarit >= 41` | `zarit-severa` (ZARIT_SEVERA) | Alerta + notificação ao profissional |
| `RA-03` | Dias sem registro > janela esperada | `adesao-baixa` (ADESAO_BAIXA) | Sinalização de queda de adesão no painel do Gestor |
| `RA-04` | Alerta com status Aberto (`active`) sem resolução | — | Mantém o alerta visível como "requer atenção" no painel |
| `RA-05` | Nível de risco ESAS `alto` | — | Mensagem bidirecional entre cuidador e profissional |

O alerta (`FamiliarAtivaFlagClinicalAlert`) fica Aberto (`active`) até ser resolvido com anotação clínica, quando passa a `inactive`.

### 6.3.4 Periodicidade de Coleta (`ServiceRequest.occurrence[x]`)

| Instrumento / processo | Padrão | Ajuste |
|---|---|---|
| ESAS | Diário | 2× ao dia se houve risco alto recente (definido pelo profissional) |
| Zarit | Mensal | Semanal se a última classificação foi Severa (definido pelo profissional) |
| Notificação de adesão | Semanal | Imediata se a taxa de adesão for < 80% em 7 dias (automático) |
| Dashboard do Gestor | A cada hora | Tempo real para alertas abertos (automático) |

### 6.3.5 Predição por IA com Explicabilidade (XAI)

A detecção por protocolo auditável (RF-PS05) é a regra de referência. A predição por IA com XAI (RF-PS06) **complementa, e não substitui**, o julgamento clínico: a predição é exibida ao profissional junto com os atributos de maior peso, e qualquer conduta depende da validação do profissional responsável (*human-in-the-loop*). O L1 não define limiares de probabilidade para a predição.

---

## 6.4 🌾 AgroSUS — Vigilância Biológica da Exposição a Defensivos

*Fonte L3: `Library/AgroSUSIntoxicacaoLogic`, `PlanDefinition/AgroSUSEstratificacaoRisco`, `AgroSUSPrioridadeAlertaCS`. Fonte L1: NR-7 (item 7.4 e Quadro I), NR-31 e Nota Informativa nº 16/2019-CGLAB/DAEVS/SVS/MS.*

Não existe, nas fontes adotadas, um escore composto de risco ocupacional (ADR-0002 do AgroSUS). A lógica combina um indicador biológico objetivo (colinesterase) com gatilhos de alerta discretos e independentes, sem pesos entre eles.

### 6.4.1 Valor Basal e Percentual de Inibição

* **Valor basal:** obtido no exame admissional, antes do início do manuseio de organofosforados/carbamatos. Se ausente, afastar o trabalhador por 30 dias e realizar o exame (idealmente 2 análises com 7 a 15 dias de intervalo). Repetir a obtenção a cada 2 anos.
* **% de inibição** = (atividade basal − atividade obtida) ÷ atividade basal × 100.

### 6.4.2 Tabela de Decisão DMN — Classificação da Colinesterase

| Regra ID | Colinesterase plasmática | Sangue total / eritrocitária | Classificação | Prioridade do alerta | Conduta |
|---|---|---|---|---|---|
| `DT-AG-01` | Inibição **< 20%** | Inibição **< 20%** | **Normal** | — | Manter monitoramento de rotina |
| `DT-AG-02` | Inibição **20% a 50%** | Inibição **20% a 25%** | **Precaução** (não atinge o IBMP) | `atencao` | Reforçar práticas de proteção (EPI e técnica de aplicação); **sem afastamento automático** |
| `DT-AG-03` | Inibição **> 50%** | Inibição **> 25%** | **Alterado** (excede o IBMP) | `critica` | Afastar do contato com o agrotóxico por **30 dias**; avaliação clínica e laboratorial; **repetir o exame após 30 dias**; investigar outras causas antes de concluir pela exposição ocupacional; registrar em `AgroSUSPlanoAcompanhamento` |

### 6.4.3 Periodicidade do Monitoramento Biológico

* **Rotina:** no mínimo **semestral** (NR-7 7.4.2.1), podendo ser reduzida pelo médico coordenador do PCMSO.
* **Gatilhos adicionais:** exame admissional; retorno ao trabalho após afastamento > 30 dias; mudança de função; trabalhador sintomático (a qualquer tempo); após aplicações em surto/bloqueio; retestagem após resultado alterado.

### 6.4.4 Gatilhos de Alerta Independentes

| Gatilho ID | Condição | Prioridade (`AgroSUSPrioridadeAlertaCS`) |
|---|---|---|
| `GA-AG-01` | Sintoma agudo compatível com intoxicação (Seção 13 da anamnese) | `critica` |
| `GA-AG-02` | Manuseio de defensivo de categoria toxicológica 1 ou 2 sem EPI adequado registrado (Seções 6 e 9) | `critica` |
| `GA-AG-03` | Histórico de intoxicação aguda prévia (Seção 14) | Acompanhamento prioritário |
| `GA-AG-04` | Colinesterase alterada (`DT-AG-03`) ou em precaução (`DT-AG-02`) | `critica` / `atencao` |

Conduta comum a qualquer alerta: priorizar a avaliação clínica na UBS e considerar antecipar o plano de acompanhamento.

### 6.4.5 Contraindicação ao Manuseio e Registro

* Trabalhadores com hepatopatia, cardiopatia, pneumopatia, desnutrição, gestação, lactação, câncer, imunossupressão, neuropatia ou uso de medicamento inibidor de colinesterase **não devem manusear** organofosforados/carbamatos.
* Exames, afastamentos e condutas ficam registrados (`AgroSUSProvenance`) por, no mínimo, **40 anos** após o desligamento do trabalhador (ADR-0006 do AgroSUS).

---

## 6.5 Pendências de Validação Clínica

Pontos em que as fontes são ambíguas ou em que L1 e L3 divergem. Precisam de decisão da equipe clínica de cada linha de cuidado antes da fase L4.

| # | Linha de cuidado | Pendência |
|---|---|---|
| 1 | ATENTO 60+ | Periodicidade inversa ao risco (robusto 1 mês, frágil 3 meses), marcada `REVISAR ADR-0005`. |
| 2 | ATENTO 60+ | O protocolo não define os limiares "críticos" de PA, FC e oximetria do `GA-AT-03`, nem a prioridade de cada gatilho. |
| 3 | CardioRemoto | O L1 (§7.7.3.4) também classifica como Vermelho "qualquer parâmetro crítico"; a expressão do `DT-CR-03` no L3 considera só a contagem e o evento CV. |
| 4 | CardioRemoto | O L1 (§7.7.3.6) usa LDL ≥ 100 mg/dL no alerta Amarelo; ADR-0004 e L3 usam LDL ≥ 190 mg/dL. |
| 5 | FamilIAr_Ativa | Faixas ESAS vão até 70, mas o máximo com 6 domínios é 60 (`REVISAR ADR-0004`). |
| 6 | AgroSUS | No `PlanDefinition` L3, a condição "Normal" (`inibição plasmática <= 50 or sangue total <= 25`) se sobrepõe à faixa de Precaução, e a condição de Precaução cobre só a colinesterase plasmática. Esta página adota Normal < 20%. |
