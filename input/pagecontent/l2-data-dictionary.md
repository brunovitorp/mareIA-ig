# 5. Dicionário de Dados Clínicos e Computáveis (DAK L2)

O **Dicionário de Dados do ecossistema mareIA** padroniza a representação formal de todas as variáveis coletadas em campo, dispositivos biomédicos certificados e laudos laboratoriais, mapeadas para as terminologias médicas canônicas internacionais (**LOINC**, **SNOMED CT**, **CID-10**, **UCUM**) e identificadores do **SUS**.

---

## 5.1 Identificadores e Dados Demográficos Centrais (Core mareIA)

Todos os pathways compartilham a estrutura canônica de identificação do cidadão no SUS:

| Campo | Nome Clínico / Descrição | Tipo FHIR | Sistema / Terminologia | Formato / Valores Permitidos | Obrigatoriedade |
|---|---|---|---|---|---|
| `cns` | Cartão Nacional de Saúde (CNS) | `Identifier` | `https://saude.gov.br/fhir/sid/cns` | 15 dígitos numéricos (iniciados em 1, 2, 7, 8 ou 9) | Obrigatório no SUS |
| `cpf` | Cadastro de Pessoas Físicas (CPF) | `Identifier` | `https://receita.fazenda.gov.br/fhir/sid/cpf` | 11 dígitos numéricos com validação de dígitos verificadores | Obrigatório |
| `offlineSyncId` | Identificador UUID Offline | `Identifier` | `https://mareia.nutes.ufpe.br/fhir/sid/offline-id` | UUID v4 (RFC 4122) para coleta sem conectividade | Obrigatório (ACS) |
| `nomeCompleto` | Nome Civil Completo | `HumanName.text` | String UTF-8 | Texto livre (sem abreviações artificiais) | Obrigatório |
| `nomeSocial` | Nome Social (se aplicável) | `HumanName.text` | String UTF-8 | Conforme autodeclaração do usuário | Opcional |
| `dataNascimento` | Data de Nascimento | `date` | ISO 8601 | `YYYY-MM-DD` | Obrigatório |
| `sexo` | Sexo Administrativo | `code` | `http://hl7.org/fhir/administrative-gender` | `male` \| `female` \| `other` \| `unknown` | Obrigatório |
| `racaCor` | Raça/Cor Autodeclarada SUS | `Extension` | `https://saude.gov.br/fhir/ValueSet/BRRacaCor` | `01` Branca, `02` Preta, `03` Parda, `04` Amarela, `05` Indígena, `99` Sem informação | Obrigatório SUS |
| `municipioIBGE` | Código do Município de Residência | `Address.city` | `https://ibge.gov.br/cidades` | Código IBGE com 7 dígitos (ex: `2507507` João Pessoa) | Obrigatório |
| `telefone` | Telefone / Celular de Contato | `ContactPoint.value` | E.164 | `+55 (DD) 9XXXX-XXXX` | Recomendado |
| `cnes` | Código CNES do Estabelecimento | `Identifier` | `https://saude.gov.br/fhir/sid/cnes` | 7 dígitos numéricos | Obrigatório |

---


## 5.2 🧓 ATENTO 60+ — Dicionário do IVCF-20 e Sinais Vitais

### 5.2.1 Os 20 Itens do IVCF-20 (`Atento60Ivcf20Questionnaire`)

O **Índice de Vulnerabilidade Clínico-Funcional (IVCF-20)** tem 20 itens. A pontuação de cada resposta é expressa pela extensão SDC `ordinalValue`, e os códigos dos itens estão em `Atento60IvcfItemCS`. Os itens de `q03` a `q20` são respostas Sim/Não (Não = 0 ponto).

| LinkId | Dimensão | Pergunta | Pontuação (Sim) | Regra de grupo |
|---|---|---|---|---|
| `q01` | Idade | Qual é a sua idade? | 60–74 anos = 0 · 75–84 = 1 · ≥ 85 = 3 | — |
| `q02` | Autopercepção | Comparando com pessoas de sua idade, como você diria que é sua saúde? | Excelente/muito boa/boa = 0 · Regular/ruim = 1 | — |
| `q03` | AVD Instrumental | Por causa da saúde, deixou de fazer compras? | 4 | **Teto de 4 pontos** no grupo q03–q05 |
| `q04` | AVD Instrumental | Deixou de controlar seu dinheiro, gastos ou contas? | 4 | |
| `q05` | AVD Instrumental | Deixou de realizar pequenos trabalhos domésticos? | 4 | |
| `q06` | AVD Básica | Por causa da saúde, deixou de tomar banho sozinho? | 6 | — |
| `q07` | Cognição | Algum familiar ou amigo falou que você está ficando esquecido? | 1 | — |
| `q08` | Cognição | Este esquecimento está piorando nos últimos meses? | 1 | — |
| `q09` | Cognição | Este esquecimento está impedindo a realização de alguma atividade do cotidiano? | 2 | — |
| `q10` | Humor | No último mês, ficou com desânimo, tristeza ou desesperança? | 2 | — |
| `q11` | Humor | No último mês, perdeu o interesse ou prazer em atividades antes prazerosas? | 2 | — |
| `q12` | Mobilidade — membros superiores | Você é incapaz de elevar os braços acima do nível do ombro? | 1 | — |
| `q13` | Mobilidade — membros superiores | Você é incapaz de manusear ou segurar pequenos objetos? | 1 | — |
| `q14` | Mobilidade — sarcopenia | Tem perda de peso não intencional, IMC < 22, panturrilha < 31 cm ou marcha de 4 m > 5 s? | 2 | Teto de 2 pontos |
| `q15` | Marcha | Tem dificuldade para caminhar capaz de impedir alguma atividade do cotidiano? | 2 | — |
| `q16` | Quedas | Teve duas ou mais quedas no último ano? | 2 | — |
| `q17` | Continência | Perde urina ou fezes, sem querer, em algum momento? | 2 | — |
| `q18` | Comunicação — visão | Tem problemas de visão capazes de impedir alguma atividade do cotidiano? | 2 | — |
| `q19` | Comunicação — audição | Tem problemas de audição capazes de impedir alguma atividade do cotidiano? | 2 | — |
| `q20` | Comorbidades múltiplas | Tem 5+ doenças crônicas, usa 5+ medicamentos/dia ou foi internado nos últimos 6 meses? | 4 | Teto de 4 pontos |
| `ivcf-score` | Escore total | Calculado pelas regras de decisão | 0 a 40 | 0–6 robusto · 7–14 risco · ≥ 15 frágil |

### 5.2.2 Sinais Vitais IoT do ATENTO 60+ (`Atento60ObservationIotVital`)

| Elemento | Código LOINC | Unidade UCUM | Uso na lógica de decisão |
|---|---|---|---|
| **Pressão arterial sistólica / diastólica** | `8480-6` / `8462-4` | `mm[Hg]` | Gatilho `GA-AT-03` fora da referência crítica |
| **Frequência cardíaca** | `8867-4` | `/min` | Gatilho `GA-AT-03` fora da referência crítica |
| **Saturação de oxigênio (SpO2)** | `59408-5` | `%` | Gatilho `GA-AT-03` fora da referência crítica |
| **Peso corporal** | `29463-7` | `kg` | Gatilho `GA-AT-04` (perda não intencional) |
| **Altura** | `8302-2` | `cm` | Cálculo do IMC |
| **Índice de massa corporal** | `39156-5` | `kg/m2` | Gatilho `GA-AT-05` (IMC < 22) |

> Os limiares críticos de PA, FC e SpO2 não estão definidos no protocolo L1 e ficam a cargo da equipe clínica (ver [Lógica de Decisão](l2-decision-logic.html), seção 6.5).

---

## 5.3 🫀 CardioRemoto — Dicionário de Triagem, IoT e Exames Laboratoriais

### 5.3.1 Triagem Clínica (`QuestionnaireCardioTriage`)

| LinkId | Variável | Uso na lógica de decisão |
|---|---|---|
| `g1-tabagismo` | Status de tabagismo | Fator de risco registrado |
| `g1-atividade` | Nível de atividade física | Fator de risco registrado |
| `g1-estatina` | Uso regular de estatina | Contexto terapêutico |
| `g1-antihipertensivo` | Uso regular de anti-hipertensivo | Contexto terapêutico |
| `g1-evento-cv` | Histórico de evento cardiovascular prévio | Evento nos últimos 12 meses → estrato Vermelho (`DT-CR-03`) |
| `g2-dor-toracica` | Dor ou aperto no peito com irradiação recente | Alerta Vermelho (`AL-CR-04`) |
| `g2-deficit-neuro` | Fraqueza súbita em um lado do corpo, desvio de rima ou fala arrastada | Alerta Vermelho (`AL-CR-04`) |
| `g2-dispneia-aguda` | Falta de ar intensa súbita ou em repouso | Alerta Vermelho (`AL-CR-04`) |
| `g2-sintomas-hipo` | Sudorese fria, tremores, tontura severa ou confusão mental | Sintomas associados à glicemia (`AL-CR-02`) |

### 5.3.2 Sinais Vitais IoT e Exames Laboratoriais

| Parâmetro | Código LOINC | Unidade UCUM | Meta (estratificação) | Alertas |
|---|---|---|---|---|
| **PA sistólica / diastólica** | `8480-6` / `8462-4` | `mm[Hg]` | < 140/90 mmHg | Vermelho: ≥ 180/120 ou < 90/60 · Amarelo: 140–179 / 90–119 |
| **Frequência cardíaca** | `8867-4` | `/min` | — | Vermelho: > 100 ou < 50 bpm |
| **Glicemia capilar** | `14743-9` | `mg/dL` | — | Vermelho: ≥ 250 com sintomas ou < 70 · Amarelo: > 300 sem sintomas |
| **Glicemia de jejum** | `1558-6` | `mg/dL` | — | — |
| **HbA1c** | `4548-4` | `%` | < 7,0% | Amarelo: ≥ 7,0% |
| **LDL-colesterol** | `13457-7` | `mg/dL` | < 130 mg/dL | Amarelo: ≥ 190 mg/dL |
| **HDL-colesterol** | `2085-9` | `mg/dL` | — | — |
| **Triglicerídeos** | `2571-8` | `mg/dL` | — | Laranja: > 1000 mg/dL |
| **Creatinina sérica** | `2160-0` | `mg/dL` | — | — |
| **TFG (CKD-EPI)** | `33914-3` | `mL/min/{1.73_m2}` | — | — |
| **Microalbumina/creatinina urinária** | `14958-3` | `mg/g` | — | — |
| **Peso corporal** | `29463-7` | `kg` | — | Laranja: perda involuntária ≥ 5% |
| **IMC** | `39156-5` | `kg/m2` | — | — |
| **Circunferência da cintura** | `8280-0` | `cm` | — | — |

Os parâmetros da estratificação são PA, HbA1c e LDL; o estrato depende de quantos estão fora da meta e da presença de evento cardiovascular recente (ver `DT-CR-01` a `DT-CR-03`).

---

## 5.4 🏡 FamilIAr_Ativa — Dicionário do ESAS, da Zarit e dos Alertas

### 5.4.1 ESAS — 6 Domínios (`FamiliarAtivaEsasQuestionnaire`)

Cada domínio é um inteiro de 0 (ausente) a 10 (pior possível). O sistema calcula a soma e grava um timestamp imutável.

| LinkId | Domínio | Código LOINC |
|---|---|---|
| `dor` | Dor | `38208-5` |
| `dispneia` | Falta de ar (dispneia) | `89443-6` |
| `ansiedade` | Ansiedade | `89444-4` |
| `cansaco` | Cansaço (fadiga) | `89445-1` |
| `apetite` | Falta de apetite | `89446-9` |
| `bem-estar` | Mal-estar (bem-estar geral) | `89447-7` |
| — | **Soma ESAS** (`FamiliarAtivaObservationEsasScore`) | 0 a 60; nível de risco em `FamiliarAtivaEsasRiskCS`: baixo (0–30), moderado (31–50), alto (51–70) |

> As faixas vêm do DAK de origem e vão até 70, mas o máximo aritmético com 6 domínios é 60 (pendência na seção 6.5 da Lógica de Decisão).

### 5.4.2 Escala de Sobrecarga do Cuidador de Zarit (`FamiliarAtivaZaritQuestionnaire`)

| LinkId | Conteúdo | Pontuação |
|---|---|---|
| `z01` a `z22` | 22 itens da Zarit Burden Interview (ZBI-22). O texto oficial dos itens é licenciado e não é reproduzido neste guia. | 0 a 4 por item |
| — | **Pontuação total** (`FamiliarAtivaObservationZaritScore`, código `FamiliarAtivaObsCodeCS#zarit-total-score`) | 0 a 88; classificação em `FamiliarAtivaZaritClassCS`: leve (0–20), moderada (21–40), severa (41–88) |

### 5.4.3 Alertas Clínicos (`FamiliarAtivaFlagClinicalAlert`)

| Elemento | Valores | Significado |
|---|---|---|
| `Flag.code` | `FamiliarAtivaAlertTypeCS`: `esas-alto`, `zarit-severa`, `adesao-baixa` | Regras RA-01, RA-02 e RA-03 |
| `Flag.status` | `active` (Aberto) · `inactive` (Resolvido) | Um alerta só é resolvido com anotação clínica |
| `Flag.period.start` | Data e hora | Momento de criação do alerta |

A predição por IA com XAI (RF-PS06) complementa as regras; o protocolo L1 não define variáveis nem limiares de probabilidade para ela.

---

## 5.5 🌾 AgroSUS — Dicionário da Anamnese Ocupacional e da Vigilância Biológica

### 5.5.1 Anamnese Ocupacional (`agrosus-anamnese`)

A anamnese é aplicada pelo ACS e organizada em 18 seções. As seções usadas pela lógica de decisão estão destacadas.

| Seção | LinkId | Conteúdo | Uso na lógica de decisão |
|---|---|---|---|
| 1 | `identificacao-instrumento` | Identificação do instrumento | — |
| 2 | `dados-pessoais` | Dados pessoais do participante | Contraindicações ao manuseio (6.4.5) |
| 3 | `caracterizacao-propriedade` | Caracterização da propriedade rural | — |
| 4 | `assistencia-responsabilidade-tecnica` | Assistência técnica e responsabilidade técnica | — |
| 5 | `capacitacao-trabalhador` | Capacitação do trabalhador | — |
| **6** | `defensivos-conformidade` | Defensivos utilizados e conformidade legal | **`GA-AG-02`** (categoria toxicológica 1 ou 2) |
| 7 | `rastreabilidade-aplicacoes` | Rastreabilidade das aplicações | — |
| 8 | `frequencia-forma-exposicao` | Frequência e forma de exposição | — |
| **9** | `equipamentos-protecao-individual` | Equipamentos de Proteção Individual | **`GA-AG-02`** (EPI adequado) |
| 10 | `armazenamento-defensivos` | Armazenamento dos defensivos | — |
| 11 | `destinacao-embalagens-vazias` | Destinação das embalagens vazias | — |
| 12 | `exposicao-familiar-ambiental` | Exposição familiar e ambiental | — |
| **13** | `condicoes-saude-sintomas` | Condições de saúde e sintomas | **`GA-AG-01`** (sintoma agudo) |
| **14** | `historico-intoxicacao-vigilancia` | Histórico de intoxicação e vigilância em saúde (inclui `caso-notificado-sinan`) | **`GA-AG-03`** (intoxicação prévia) |
| 15 | `indicadores-boas-praticas` | Indicadores de boas práticas agrícolas | — |
| 16 | `vigilancia-sinais-alerta` | Vigilância de sinais de alerta | — |
| 17 | `observacoes-acs` | Observações do ACS | — |
| 18 | `encerramento-assistencial` | Encerramento | — |

### 5.5.2 Vigilância Biológica da Colinesterase (NR-7)

| Exame | Código LOINC | Unidade | Normal | Precaução | Alterado (excede o IBMP) |
|---|---|---|---|---|---|
| **Colinesterase plasmática** | `2099-0` | `U/L` | Inibição < 20% | 20% a 50% | **> 50%** |
| **Colinesterase de sangue total / eritrocitária** | a definir no L3 | `U/L` | Inibição < 20% | 20% a 25% | **> 25%** |

* **% de inibição** = (atividade basal − atividade obtida) ÷ atividade basal × 100.
* O valor basal é obtido no exame admissional (`AgroSUSSolicitacaoExame` + `AgroSUSResultadoLaboratorial`), antes do manuseio de organofosforados/carbamatos.
* Um resultado alterado gera afastamento de 30 dias, `AgroSUSPlanoAcompanhamento` e retestagem em 30 dias.
