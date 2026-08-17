# 6. Lógica de Suporte à Decisão Clínica (DAK L2 — Tabelas DMN)

A Lógica de Decisão da **Plataforma mareIA** formaliza o raciocínio clínico e as condutas assistenciais por meio de **Tabelas de Decisão DMN (Decision Model and Notation)** e bibliotecas computáveis FHIR R4 (`Library` em CQL e `PlanDefinition`).

---

## 6.1 🧓 ATENTO 60+ — Suporte à Decisão na Atenção Primária

### 6.1.1 Algoritmo de Cálculo do Escore IVCF-20 (com Tetos de Grupo)

O cálculo do escore total do IVCF-20 (`Library/Atento60Ivcf20Logic`) aplica tetos de pontuação em grupos de itens específicos para evitar sobreponderação de um único domínio funcional:

| Domínio | Itens do Questionário | Fórmula de Pontuação Parcial | Teto Máximo do Grupo |
|---|---|---|---|
| **Idade** | `q01` | Se 60–74 anos = 0; Se 75–84 anos = 1; Se ≥ 85 anos = 3 | 3 pontos |
| **Autopercepção** | `q02` | Se Boa/Excelente = 0; Se Regular/Ruim = 1 | 1 ponto |
| **AVD Instrumental (AVD-I)** | `q03`, `q04`, `q05` | $\min(4, \text{pontos}(q03) + \text{pontos}(q04) + \text{pontos}(q05))$ onde cada resposta "Sim" vale 4 pts | **4 pontos** |
| **AVD Básica (AVD-B)** | `q06` | Se Não = 0; Se Sim = 6 | 6 pontos |
| **Cognição** | `q07`, `q08`, `q09` | $\text{pontos}(q07) + \text{pontos}(q08) + \text{pontos}(q09)$ (1 + 1 + 2) | 4 pontos |
| **Humor** | `q10`, `q11` | $\text{pontos}(q10) + \text{pontos}(q11)$ (1 + 1) | 2 pontos |
| **Mobilidade Superior** | `q12`, `q13` | $\text{pontos}(q12) + \text{pontos}(q13)$ (1 + 1) | 2 pontos |
| **Mobilidade / Quedas** | `q14`, `q15`, `q16` | $\min(2, \text{pontos}(q14) + \text{pontos}(q15) + \text{pontos}(q16))$ onde cada "Sim" vale 2 pts | **2 pontos** |
| **Comunicação** | `q17`, `q18` | $\text{pontos}(q17) + \text{pontos}(q18)$ (1 + 1) | 2 pontos |
| **Comorbidades / Internação** | `q19`, `q20` | $\min(4, \text{pontos}(q19) + \text{pontos}(q20))$ (Polifarmácia = 2 pts, Internação = 4 pts) | **4 pontos** |
| **ESCORE TOTAL IVCF-20** | `q01` a `q20` | **Soma dos escores parciais com aplicação dos tetos** | **0 a 40 pontos** |

### 6.1.2 Tabela de Decisão DMN — Estratificação Clínico-Funcional

| Regra ID | Escore Total IVCF-20 | Estrato de Risco | Status Clínico | Periodicidade Padrão | Plano de Cuidado Recomendado |
|---|---|---|---|---|---|
| `DT-AT-01` | **0 a 6 pontos** | `robusto` | Idoso Robusto | **Anual** (12 meses) | Ações de promoção do envelhecimento ativo e vacinação na UBS. |
| `DT-AT-02` | **7 a 14 pontos** | `risco-fragilizacao` | Em Risco de Fragilização | **Trimestral** (3 meses) | Elaboração de Projeto Terapêutico Singular (PTS), reforço nutricional e oficinas de equilíbrio. |
| `DT-AT-03` | **≥ 15 pontos** | `fragil` | Idoso Frágil | **Mensal** (30 dias) | Avaliação Geriátrica Ampla (AGA), visita domiciliar prioritária multiprofissional e telemonitoramento ativo. |

### 6.1.3 Tabela de Gatilhos de Alerta Automático (Eventos Sentinela)

Independentemente da faixa de risco do escore, os seguintes gatilhos disparam alertas imediatos (`FlagClinicalAlert`):

| Gatilho ID | Condição Clínica Detectada | Severidade | Ação no Sistema |
|---|---|---|---|
| `GA-AT-01` | Ocorrência de **Queda** recente (`q16 = Sim` ou registro avulso) | `high` | Notificar equipe de enfermagem da ESF; Agendar avaliação de marcha e risco ambiental domiciliar em até 7 dias. |
| `GA-AT-02` | **Internação hospitalar** nos últimos 6 meses (`q20 = Sim`) | `medium` | Agendar visita de pós-alta em até 14 dias para reconciliação medicamentosa. |
| `GA-AT-03` | **Pressão Arterial Crítica** (PAS ≥ 180 mmHg ou PAD ≥ 110 mmHg) | `critical` | Disparo de alerta sonoro e visual no painel da UBS; Contato médico imediato. |
| `GA-AT-04` | **Saturação de Oxigênio (SpO2) < 92%** ou FC < 50 / > 120 bpm | `critical` | Encaminhamento imediato ao acolhimento com classificação de risco da UBS/UPA. |
| `GA-AT-05` | **Perda ponderal não intencional ≥ 4.5 kg** ou IMC < 22 kg/m² | `high` | Encaminhamento prioritário à Nutrição e investigação de fragilidade avançada. |
| `GA-AT-06` | Piora aguda na **cognição ou humor** (`q08 = Sim` e `q10 = Sim`) | `medium` | Agendar avaliação clínica na UBS para investigação de declínio funcional. |

---

## 6.2 🫀 CardioRemoto — Suporte à Decisão Cardiovascular e Telessaúde

### 6.2.1 Tabela de Decisão DMN — Estratificação em 3 Estratos Clínicos

| Regra ID | Pressão Arterial (mmHg) | Glicemia Capilar (mg/dL) | Hemoglobina Glicada (HbA1c) | Colesterol LDL | Creatinina / TFG | Estrato Consolidado | Periodicidade |
|---|---|---|---|---|---|---|---|
| `DT-CR-01` | PAS < 140 **E** PAD < 90 | Jejum < 130 **E** Pós-prandial < 180 | < 7.0% (Idoso frágil: < 8.0%) | Na meta individual | TFG ≥ 60 mL/min | 🟢 **Verde (Controlado)** | **90 dias** |
| `DT-CR-02` | PAS 140–179 **OU** PAD 90–109 | Jejum 131–250 **OU** Pós-prandial 181–299 | 7.0% a 9.0% | Desvio moderado da meta | TFG 30–59 (DRC 3) | 🟡 **Amarelo (Moderado)** | **30 dias** |
| `DT-CR-03` | **PAS ≥ 180 OU PAD ≥ 110** | **Jejum > 250 OU Pós-prandial > 300** | **≥ 9.0%** | LDL ≥ 160 mg/dL | **TFG < 30 mL/min** | 🔴 **Vermelho (Grave)** | **30 dias (Prioritário)** |

### 6.2.2 Matriz de Protocolo de Alertas em 4 Níveis

| Nível de Alerta | Critérios Clínicos de Ativação | Canal de Notificação | Tempo Máximo de Resposta | Conduta Obrigatória |
|---|---|---|---|---|
| **Nível 1: Emergência (Vermelho)** | • PAS ≥ 180 ou PAD ≥ 120 mmHg<br>• Glicemia < 54 mg/dL (Hipoglicemia grave) ou > 350 mg/dL com sintomas<br>• Dor precordial típica / sintomas anginosos | Notificação Push + SMS + Alerta de Tela Cheia no painel médico do HULW | **Imediato (< 1 hora)** | Teleconsulta de emergência com endocrinologista/cardiologista ou acionamento do SAMU 192. |
| **Nível 2: Alerta Clínico (Laranja)** | • PAS 160–179 ou PAD 100–109 mmHg em 2 aferições seguidas<br>• Glicemia de jejum persistentemente > 200 mg/dL<br>• HbA1c > 9.0% em exame recente | Alerta prioritário na caixa de entrada do profissional | **Em até 24 a 48 horas** | Contato telefônico da enfermagem, revisão de adesão medicamentosa e antecipação de consulta. |
| **Nível 3: Atenção (Amarelo)** | • Desvios leves e isolados de PA ou glicemia<br>• Ganho ponderal rápido (> 2 kg em 48h em insuficiência cardíaca)<br>• Atraso de 15 dias no envio de parâmetros | Alerta no painel de rotina | **Em até 7 dias** | Mensagem automática educativa e teleorientação nutricional. |
| **Nível 4: Informativo (Verde)** | • Parâmetros dentro das metas terapêuticas estabelecidas | Registro em log longitudinal | Rotina da próxima consulta | Feedback positivo automático enviado ao paciente pelo aplicativo. |

---

## 6.3 🏡 FamilIAr_Ativa — Lógica Híbrida em Cuidados Paliativos

### 6.3.1 Regras Clínicas Determinísticas de Alerta (RA-01 a RA-05)

| Regra ID | Expressão da Condição (CQL) | Gatilho Clínico | Prioridade | Resposta Automatizada |
|---|---|---|---|---|
| `RA-01` | `ObservationEsasSymptom(Dor).value >= 7 OR ObservationEsasSymptom(Dispneia).value >= 7` | Dor intensa refratária ou crise de falta de ar | `critical` | Dispara `FlagClinicalAlert`; Notifica médico paliativista de plantão; Orienta dose de resgate prescrita. |
| `RA-02` | `ObservationZaritScore.value >= 41` | Sobrecarga Severa / Esgotamento do Cuidador | `high` | Aciona equipe de Psicologia e Serviço Social do CUIDATIVA; Reorganiza plano de revezamento de cuidados. |
| `RA-03` | `TaxaAdesao(7_dias) < 0.80` | Queda de adesão ao preenchimento do diário domiciliar | `medium` | Mensagem de apoio para checar se houve agravamento do quadro clínico ou sobrecarga técnica. |
| `RA-04` | `Count(AlertasAbertos > 24h) >= 1` | Alerta clínico sem intervenção registrada | `high` | Escalonamento automático para o Gestor do Serviço de Atenção Domiciliar. |
| `RA-05` | `ObservationEsasScore(Total).value >= 51` | Sofrimento global multidimensional agudo | `high` | Visita domiciliar multiprofissional extraordinária em até 24 horas. |

### 6.3.2 Lógica Híbrida: Integração do Modelo Preditivo de IA com XAI

```
Se ModeloXAI.ProbabilidadeDescompensacao > 0.70 E ModeloXAI.Confianca >= 0.80:
    1. Gerar FlagClinicalAlert (Origem: IA Explicável)
    2. Anexar os 3 Atributos SHAP de maior peso (Explicabilidade Auditável)
    3. Apresentar recomendação de conduta clínica com justificativa baseada em evidências
    4. Solicitar validação e assinatura do profissional médico responsável (Human-in-the-Loop)
```

---

## 6.4 🌾 AgroSUS — Vigilância Biológica e Intoxicações por Defensivos

### 6.4.1 Tabela de Decisão DMN — Vigilância da Colinesterase (NR-7)

| Regra ID | Queda na Colinesterase Eritrocitária (AChE) | Queda na Colinesterase Plasmática (BChE) | Sintomas Agudos Relatados | Classificação Ocupacional | Conduta Médica e Sanitária |
|---|---|---|---|---|---|
| `DT-AG-01` | **< 30%** em relação ao basal | **< 50%** em relação ao basal | Ausentes | **Exposição Normal / Sob Controle** | Manter monitoramento periódico semestral (NR-7); Reforçar boas práticas de uso e higienização de EPIs. |
| `DT-AG-02` | **30% a 49%** em relação ao basal | **50% a 69%** em relação ao basal | Ausentes ou inespecíficos (cefaleia leve) | **Sobre-exposição / Risco Iminente** | • Revisão imediata dos procedimentos de pulverização e EPIs;<br>• Reagendamento de exame confirmatório em **15 a 30 dias** na UBS;<br>• Notificação preventiva no prontuário. |
| `DT-AG-03` | **≥ 50%** em relação ao basal | **≥ 70%** em relação ao basal | Presentes ou Ausentes | **Intoxicação Ocupacional Grave** | • **Afastamento temporário imediato** de qualquer atividade com defensivos;<br>• Consulta médica urgente na UBS / Hospital;<br>• Emissão de **Notificação Compulsória no SINAN**;<br>• Acionamento da Vigilância em Saúde do Trabalhador (VISAT);<br>• Retestagem semanal até recuperação ≥ 80% do basal. |
| `DT-AG-04` | Qualquer nível de dosagem | Qualquer nível de dosagem | **Sintomas Agudos Típicos** (miose, salivação, cólica, fasciculação) | **Intoxicação Aguda por Inibidores** | • **Encaminhamento de emergência (SAMU / UPA)**;<br>• Protocolo de antídotos (Atropina / Pralidoxima);<br>• Notificação SINAN imediata. |
