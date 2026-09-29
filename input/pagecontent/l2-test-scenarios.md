# 9. Cenários e Casos de Teste (DAK L2 — Test Scenarios)

Os **Casos de Teste da Plataforma mareIA** formam a bateria de validação funcional, lógica e semântica dos motores de decisão FHIR R4, dos formulários estruturados (HL7 SDC) e dos fluxos de telecuidado.

Cada caso cita a regra da [Lógica de Suporte à Decisão](l2-decision-logic.html) que exercita. Sempre que possível, os casos testam os **valores de limite** das faixas (o último valor de uma faixa e o primeiro da seguinte). A seção 9.6 mostra a matriz de cobertura regra → cenário → teste.

---

## 9.1 Casos de Teste do ATENTO 60+ (Pessoa Idosa)

### Estratificação pelo IVCF-20

| ID | Entrada (`QuestionnaireResponse`) | Resultado esperado | Regra |
|---|---|---|---|
| `TC-ATENTO-01` | `q01` 76 anos (1) · `q02` regular (1) · `q03`, `q04`, `q05` = Sim (soma bruta 12) · demais = Não | Teto AVD-I aplicado → escore **6** · `robusto` · coleta a cada **1 mês** | `DT-AT-01` |
| `TC-ATENTO-02` | `q01` 60–74 anos (0) · `q02` regular (1) · `q06` = Sim (6) · demais = Não | Escore **7** (limite inferior) · `risco-fragilizacao` · a cada **2 meses** | `DT-AT-02` |
| `TC-ATENTO-03` | `q01` ≥ 85 anos (3) · `q03` = Sim (4) · `q06` = Sim (6) · `q07` = Sim (1) · demais = Não | Escore **14** (limite superior) · `risco-fragilizacao` | `DT-AT-02` |
| `TC-ATENTO-04` | Mesmas respostas do TC-ATENTO-03 + `q08` = Sim (1) e `q09` = Sim (2) | Escore **17** · `fragil` · a cada **3 meses** | `DT-AT-03` |
| `TC-ATENTO-05` | `q01` 60–74 anos (0) · `q02` regular (1) · `q06` = Sim (6) · `q03` = Sim (4) · `q16` = Sim (2) · `q18` = Sim (2) · demais = Não | Escore **15** (limite inferior) · `fragil` | `DT-AT-03` |
| `TC-ATENTO-06` | Todas as respostas no valor máximo (`q01` ≥ 85 anos, `q02` regular e todos os demais = Sim) | Escore **40** (máximo, com teto AVD-I) · `fragil` | `DT-AT-03` |

### Gatilhos de alerta (independentes da faixa)

| ID | Entrada | Resultado esperado | Regra |
|---|---|---|---|
| `TC-ATENTO-07` | `q16` = Sim; demais = Não; idade 60–74 (escore 2, `robusto`) | Alerta de **queda** gerado apesar da faixa `robusto` | `GA-AT-01` |
| `TC-ATENTO-08` | `q20` = Sim com internação registrada há 2 meses | Alerta de **internação recente** | `GA-AT-02` |
| `TC-ATENTO-09` | `q20` = Sim apenas por uso de 5+ medicamentos (sem internação) | `q20` soma 4 pontos; **nenhum** alerta de internação | `GA-AT-02` (negativo) |
| `TC-ATENTO-10` | `Atento60ObservationIotVital` de SpO2 1 ponto abaixo da referência crítica configurada · outra leitura igual à referência | Primeira leitura gera alerta de **sinal vital crítico**; a segunda não gera | `GA-AT-03` |
| `TC-ATENTO-11` | Peso IoT 72 kg → 68 kg em 3 meses, sem intenção de emagrecer | Alerta de **perda de peso não intencional** | `GA-AT-04` |
| `TC-ATENTO-12` | Peso 68 kg e altura 1,77 m (IMC 21,7) · peso 69 kg e altura 1,77 m (IMC 22,0) | Primeiro caso gera alerta de **IMC < 22**; o segundo não gera | `GA-AT-05` |
| `TC-ATENTO-13` | `q10` = Sim | Alerta de **humor alterado** | `GA-AT-06` |
| `TC-ATENTO-14` | `q02` boa → regular em visitas consecutivas · regular → regular | Primeiro caso gera alerta de **autopercepção piorando**; o segundo não gera | `GA-AT-07` |

---

## 9.2 Casos de Teste do CardioRemoto (DM / HAS)

### Estratificação de risco

| ID | Entrada | Resultado esperado | Regra |
|---|---|---|---|
| `TC-CARDIO-01` | PA 124/78 · HbA1c 6,4% · LDL 96 · sem evento CV | `verde` · reavaliação em **90 dias** · `sem-disparo` | `DT-CR-01`, `AL-CR-09` |
| `TC-CARDIO-02` | PA **140**/85 · HbA1c 6,9% · LDL 120 · sem evento CV | PAS no limite conta como fora da meta → 1 parâmetro fora → `amarelo` · **30 dias** | `DT-CR-02` |
| `TC-CARDIO-03` | PA 145/92 · HbA1c 7,4% · LDL 110 · sem evento CV | 2 parâmetros fora → `amarelo` (limite superior da faixa) | `DT-CR-02` |
| `TC-CARDIO-04` | PA 155/96 · HbA1c 8,8% · LDL 165 · sem evento CV | 3 parâmetros fora → `vermelho` · **30 dias** | `DT-CR-03` |
| `TC-CARDIO-05` | PA 120/75 · HbA1c 6,2% · LDL 90 · IAM há 4 meses | Evento CV < 12 meses → `vermelho` | `DT-CR-03` |
| `TC-CARDIO-06` | Mesmos parâmetros do TC-CARDIO-05, mas IAM há 14 meses | `verde` | `DT-CR-01` |

### Alertas clínicos

| ID | Entrada | Resultado esperado | Regra |
|---|---|---|---|
| `TC-CARDIO-07` | PA 192/122 mmHg (`ObservationCardioVital`, componentes `8480-6` e `8462-4`) | Alerta `vermelho` imediato; paciente no topo da lista de prioridades | `AL-CR-01` |
| `TC-CARDIO-08` | PA 85/55 mmHg | Alerta `vermelho` (hipotensão) | `AL-CR-01` |
| `TC-CARDIO-09` | Glicemia capilar 62 mg/dL · outra leitura de 70 mg/dL | Primeira leitura gera `vermelho` (hipoglicemia); 70 mg/dL não gera | `AL-CR-02` |
| `TC-CARDIO-10` | Glicemia 260 mg/dL **com** sintomas · 260 mg/dL **sem** sintomas | Com sintomas gera `vermelho`; sem sintomas não gera alerta de glicemia | `AL-CR-02` |
| `TC-CARDIO-11` | FC 105 bpm · FC 48 bpm · FC 75 bpm | 105 e 48 geram `vermelho`; 75 não gera | `AL-CR-03` |
| `TC-CARDIO-12` | Relato de dor torácica típica na triagem de sintomas | Alerta `vermelho` com orientação de encaminhamento à emergência | `AL-CR-04` |
| `TC-CARDIO-13` | Triglicerídeos 1150 mg/dL · 1000 mg/dL | 1150 gera `laranja`; 1000 (limite) não gera | `AL-CR-05` |
| `TC-CARDIO-14` | Peso 80 kg → 75,5 kg (−5,6%), perda involuntária | Alerta `laranja` | `AL-CR-06` |
| `TC-CARDIO-15` | PA 150/95 mmHg | Alerta `amarelo` (PA fora da meta, não crítica) | `AL-CR-07` |
| `TC-CARDIO-16` | LDL 210 mg/dL · HbA1c 7,0% · glicemia 320 mg/dL sem sintomas (cada um isolado) | Cada entrada gera alerta `amarelo` | `AL-CR-08` |

---

## 9.3 Casos de Teste do FamilIAr_Ativa (Cuidados Paliativos)

### Nível de risco ESAS (6 domínios, 0–10 cada)

| ID | Entrada (`QuestionnaireResponse` ESAS) | Resultado esperado | Regra |
|---|---|---|---|
| `TC-FAMILIAR-01` | Soma **30** · soma **31** | 30 → `baixo`, sem alerta; 31 → `moderado`, registro para tendência | `DT-FA-01`, `DT-FA-02` |
| `TC-FAMILIAR-02` | Soma **50** · soma **51** | 50 → `moderado`, **sem** RA-01; 51 → `alto`, RA-01 + RA-05 | `DT-FA-02`, `DT-FA-03` |
| `TC-FAMILIAR-03` | Dor 8 · dispneia 7 · ansiedade 9 · cansaço 10 · apetite 9 · mal-estar 9 (soma **52**) | `alto` · `FamiliarAtivaFlagClinicalAlert` `esas-alto` com status `active` · notificação ao profissional · mensagem ao cuidador · ESAS 2×/dia | `DT-FA-03`, `RA-01`, `RA-05` |

### Sobrecarga do cuidador (Zarit, 22 itens 0–4)

| ID | Entrada (`QuestionnaireResponse` Zarit) | Resultado esperado | Regra |
|---|---|---|---|
| `TC-FAMILIAR-04` | Pontuação **20** · **21** | 20 → Leve; 21 → Moderada | `DT-FA-04`, `DT-FA-05` |
| `TC-FAMILIAR-05` | Pontuação **40** · **41** | 40 → Moderada, sem alerta; 41 → Severa, alerta `zarit-severa` | `DT-FA-05`, `DT-FA-06`, `RA-02` |
| `TC-FAMILIAR-06` | Pontuação **64** | Severa · alerta `zarit-severa` · notificação ao profissional · Zarit semanal | `DT-FA-06`, `RA-02` |

### Adesão, alertas abertos e IA

| ID | Entrada | Resultado esperado | Regra |
|---|---|---|---|
| `TC-FAMILIAR-07` | Janela esperada diária; 3 dias sem registro de ESAS | Alerta `adesao-baixa` no painel do Gestor | `RA-03` |
| `TC-FAMILIAR-08` | 5 registros em 7 dias (71%) · 6 registros em 7 dias (86%) | 71% gera notificação de adesão imediata; 86% segue o ciclo semanal | `RA-03` |
| `TC-FAMILIAR-09` | Alerta `esas-alto` com status `active` e sem anotação clínica | Alerta destacado como "requer atenção" no painel; depois da anotação, status `inactive` e sai do destaque | `RA-04` |
| `TC-FAMILIAR-10` | Predição da IA indicando piora | Predição exibida ao profissional com os fatores de maior peso; **nenhuma** conduta ou mudança de agendamento é criada sem validação do profissional | 6.3.5 (XAI) |

---

## 9.4 Casos de Teste do AgroSUS (Saúde do Trabalhador Rural)

### Classificação da colinesterase (basal plasmática 8200 U/L)

| ID | Entrada (`AgroSUSResultadoLaboratorial`) | Resultado esperado | Regra |
|---|---|---|---|
| `TC-AGROSUS-01` | Plasmática 7000 U/L (inibição 14,63%) | **Normal** · rotina semestral mantida | `DT-AG-01` |
| `TC-AGROSUS-02` | Plasmática 5000 U/L (inibição 39,02%) | **Precaução** · alerta `atencao` · reforço de EPI · **sem** afastamento | `DT-AG-02`, `GA-AG-04` |
| `TC-AGROSUS-03` | Plasmática 3400 U/L (inibição 58,54%) | **Alterado** · alerta `critica` · afastamento de 30 dias · `AgroSUSPlanoAcompanhamento` · retestagem em 30 dias | `DT-AG-03`, `GA-AG-04` |
| `TC-AGROSUS-04` | Plasmática 4100 U/L (50,0%) · 4000 U/L (51,2%) | 50% → Precaução (não excede o IBMP); 51,2% → Alterado | `DT-AG-02`, `DT-AG-03` |
| `TC-AGROSUS-05` | Sangue total/eritrocitária com inibição de 25% · 26% | 25% → Precaução; 26% → Alterado | `DT-AG-02`, `DT-AG-03` |
| `TC-AGROSUS-06` | Trabalhador que manuseia organofosforado sem valor basal registrado | Exame basal solicitado (`AgroSUSSolicitacaoExame`) e afastamento de 30 dias até obter o basal | 6.4.1 |

### Gatilhos independentes, contraindicação e periodicidade

| ID | Entrada | Resultado esperado | Regra |
|---|---|---|---|
| `TC-AGROSUS-07` | Anamnese (Seção 13) com miose, sudorese e cólica após aplicação de organofosforado | Alerta `critica`, independente do resultado de colinesterase | `GA-AG-01` |
| `TC-AGROSUS-08` | Produto de categoria toxicológica 1 sem EPI adequado · produto de categoria 3 sem EPI | Categoria 1 gera alerta `critica`; categoria 3 **não** gera este gatilho | `GA-AG-02` |
| `TC-AGROSUS-09` | Anamnese (Seção 14) com intoxicação aguda prévia | Alerta de acompanhamento prioritário | `GA-AG-03` |
| `TC-AGROSUS-10` | Dois gatilhos presentes na mesma visita (GA-AG-01 e GA-AG-02) | Dois alertas separados; **nenhum** escore ou soma é calculado (ADR-0002) | 6.4 |
| `TC-AGROSUS-11` | Trabalhadora gestante cadastrada como aplicadora de organofosforado | Contraindicação ao manuseio sinalizada ao profissional da UBS | 6.4.5 |
| `TC-AGROSUS-12` | Último exame há 6 meses e 1 dia · retorno de afastamento de 45 dias | Exame semestral indicado como devido; exame adicional de retorno solicitado | 6.4.3 |

---

## 9.5 Casos de Teste Técnicos de Interoperabilidade e Build

| Teste Técnico | Escopo | Critério de Aceite |
|---|---|---|
| `TC-TECH-01` | **SUSHI FSH Compiler** | 100% dos arquivos FSH compilados para JSON em `fsh-generated/` com **0 Errors e 0 Warnings**. |
| `TC-TECH-02` | **HL7 IG Publisher** | Geração estática completa em `output/` sem links quebrados e sem violações de conformance FHIR R4. |
| `TC-TECH-03` | **Validação de Schemas SUS** | Validação sintática rigorosa de extensões nacionais (`BRRacaCor`), CNS e CPF nos perfis base. |
| `TC-TECH-04` | **Resiliência Offline (UUID v4)** | Capacidade de ingestão e reconciliação idempotente de recursos gerados sem conexão à internet. |

---

## 9.6 Matriz de Cobertura

| Regra | Cenário de uso | Casos de teste |
|---|---|---|
| `DT-AT-01` | — | TC-ATENTO-01 |
| `DT-AT-02` | SC-ATENTO-01 | TC-ATENTO-02, 03 |
| `DT-AT-03` | SC-ATENTO-02 | TC-ATENTO-04, 05, 06 |
| `GA-AT-01` | SC-ATENTO-02 | TC-ATENTO-07 |
| `GA-AT-02` | SC-ATENTO-02 | TC-ATENTO-08, 09 |
| `GA-AT-03` | SC-ATENTO-03 | TC-ATENTO-10 |
| `GA-AT-04` | SC-ATENTO-03 | TC-ATENTO-11 |
| `GA-AT-05` | SC-ATENTO-03 | TC-ATENTO-12 |
| `GA-AT-06` | SC-ATENTO-02 | TC-ATENTO-13 |
| `GA-AT-07` | SC-ATENTO-03 | TC-ATENTO-14 |
| `DT-CR-01` | — | TC-CARDIO-01, 06 |
| `DT-CR-02` | SC-CARDIO-01 | TC-CARDIO-02, 03 |
| `DT-CR-03` | SC-CARDIO-03 | TC-CARDIO-04, 05 |
| `AL-CR-01` | SC-CARDIO-02 | TC-CARDIO-07, 08 |
| `AL-CR-02` | SC-CARDIO-03 | TC-CARDIO-09, 10 |
| `AL-CR-03` | SC-CARDIO-02 | TC-CARDIO-11 |
| `AL-CR-04` | — | TC-CARDIO-12 |
| `AL-CR-05` | SC-CARDIO-03 | TC-CARDIO-13 |
| `AL-CR-06` | — | TC-CARDIO-14 |
| `AL-CR-07` | SC-CARDIO-01 | TC-CARDIO-15 |
| `AL-CR-08` | SC-CARDIO-01 | TC-CARDIO-16 |
| `AL-CR-09` | — | TC-CARDIO-01 |
| `DT-FA-01` / `02` / `03` | SC-FAMILIAR-01, 02 | TC-FAMILIAR-01, 02, 03 |
| `DT-FA-04` / `05` / `06` | SC-FAMILIAR-01, 02 | TC-FAMILIAR-04, 05, 06 |
| `RA-01` | SC-FAMILIAR-02 | TC-FAMILIAR-02, 03 |
| `RA-02` | SC-FAMILIAR-02 | TC-FAMILIAR-05, 06 |
| `RA-03` | SC-FAMILIAR-03 | TC-FAMILIAR-07, 08 |
| `RA-04` | SC-FAMILIAR-03 | TC-FAMILIAR-09 |
| `RA-05` | SC-FAMILIAR-02 | TC-FAMILIAR-02, 03 |
| IA / XAI (6.3.5) | SC-FAMILIAR-02 | TC-FAMILIAR-10 |
| `DT-AG-01` | SC-AGROSUS-02 | TC-AGROSUS-01 |
| `DT-AG-02` | SC-AGROSUS-02 | TC-AGROSUS-02, 04, 05 |
| `DT-AG-03` | SC-AGROSUS-03 | TC-AGROSUS-03, 04, 05 |
| Valor basal (6.4.1) | SC-AGROSUS-01 | TC-AGROSUS-06 |
| Periodicidade (6.4.3) | SC-AGROSUS-02 | TC-AGROSUS-12 |
| `GA-AG-01` | — | TC-AGROSUS-07 |
| `GA-AG-02` | SC-AGROSUS-01 | TC-AGROSUS-08 |
| `GA-AG-03` | — | TC-AGROSUS-09 |
| `GA-AG-04` | SC-AGROSUS-02, 03 | TC-AGROSUS-02, 03 |
| Sem escore composto (ADR-0002) | SC-AGROSUS-01 | TC-AGROSUS-10 |
| Contraindicação (6.4.5) | — | TC-AGROSUS-11 |
