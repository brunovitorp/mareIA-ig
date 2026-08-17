# 3. Cenários de Uso Clínicos e Operacionais (DAK L2)

Os **Cenários de Uso da Plataforma mareIA** descrevem detalhadamente as interações ponta a ponta entre os usuários do SUS (cidadãos, cuidadores, agentes de saúde e médicos), as aplicações móveis e web, e os serviços de interoperabilidade e decisão computável em FHIR R4.

---

## 3.1 🧓 ATENTO 60+ — Cenários Clínicos na Atenção Primária

### Cenário SC-ATENTO-01: Visita Domiciliar e Aplicação do IVCF-20 (Offline-First)
* **Atores:** Agente Comunitário de Saúde (ACS Dona Maria), Pessoa Idosa (Sr. José, 78 anos).
* **Pré-condições:** O ACS possui tablet com o aplicativo móvel mareIA autenticado; o Sr. José está cadastrado no território da UBS mas reside em área rural sem cobertura de sinal de celular.
* **Fluxo Principal Passo a Passo:**
  1. O ACS visita a residência do Sr. José e abre o questionário `Questionnaire/atento60-ivcf20` no aplicativo.
  2. O ACS lê as 20 perguntas do IVCF-20 e registra as respostas diretamente na tela tátil.
  3. O Sr. José pontua em idade (78 anos = 1 pt), autopercepção regular (1 pt), compras (4 pts), controle de dinheiro (4 pts - teto AVD-I aplicado = 4 pts), e polifarmácia (2 pts).
  4. O aplicativo móvel calcula localmente o escore total preliminar: **8 pontos (Em Risco de Fragilização)**.
  5. O ACS afere a Pressão Arterial com esfigmomanômetro Bluetooth (PA: 135/85 mmHg) e Saturação (SpO2: 96%).
  6. O aplicativo gera um identificador único `offlineSyncId` (UUID v4) e armazena os recursos localmente em banco criptografado.
  7. Ao retornar à UBS com conexão Wi-Fi, o aplicativo sincroniza automaticamente o `QuestionnaireResponse` e os recursos `Observation` com o Servidor FHIR mareIA.
* **Fluxos Alternativos e Exceções:**
  * *Exceção 1 (Recusa ou Inaptidão):* Caso o idoso apresente declínio cognitivo agudo sem cuidador presente, o ACS suspende o questionário e agenda visita conjunta com o enfermeiro da ESF.
* **Pós-condições:** Recurso `QuestionnaireResponse` criado com status `completed`; `ObservationIvcfScore` gerado com valor `8` e status `final`; plano de cuidado trimestral programado.

### Cenário SC-ATENTO-02: Detecção de Queda Aguda e Disparo de Evento Sentinela
* **Atores:** Sr. Antônio (82 anos), Filha/Cuidadora, Enfermeira da ESF (Enfª Camila).
* **Pré-condições:** O Sr. Antônio era classificado como "Robusto" (escore 4). Na última semana, sofreu uma queda no banheiro com escoriações.
* **Fluxo Principal:**
  1. Durante a reavaliação de rotina, a cuidadora relata o evento de queda recente (`q16 = Sim`).
  2. O motor de regras clínico (`Atento60Ivcf20Logic`) avalia a resposta e dispara imediatamente o gatilho de alerta `GA-AT-01`.
  3. O escore do Sr. Antônio é recalculado para 16 pontos (**Idoso Frágil**), devido ao medo de cair e limitação de marcha associada.
  4. O sistema gera um recurso `FlagClinicalAlert` com severidade `high` e notifica o painel da Enfª Camila na UBS.
  5. A Enfª Camila abre o prontuário no painel web, analisa o histórico e programa uma **Avaliação Geriátrica Ampla (AGA)** com fisioterapeuta do eMulti em até 7 dias.
* **Pós-condições:** Status funcional atualizado para `fragil`; periodicidade ajustada para mensal; `Flag` ativo até a conclusão da visita da equipe multiprofissional.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-atento60.svg" alt="Diagrama de Sequência ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.2 🫀 CardioRemoto — Cenários de Risco Cardiovascular e Telessaúde

### Cenário SC-CARDIO-01: Triagem Inicial, Pareamento IoT e Estabelecimento da Linha de Base
* **Atores:** Paciente com DM2/HAS (Dona Francisca, 58 anos), Técnico de Telessaúde do HULW.
* **Pré-condições:** Dona Francisca foi encaminhada pela Atenção Básica ao Ambulatório de Telessaúde da Endocrinologia do HULW.
* **Fluxo Principal:**
  1. No acolhimento do HULW, a paciente assina o Termo de Consentimento (TCLE digital), gerando o recurso `Consent`.
  2. O técnico realiza a triagem inicial (`Questionnaire/CardioTriage`) coletando dados antropométricos (Peso, Altura, IMC) e histórico clínico.
  3. O técnico pareia os dispositivos IoT homologados ANVISA (esfigmomanômetro e glicosímetro Bluetooth) ao celular da paciente.
  4. São integrados os exames laboratoriais basais do laboratório do HULW: HbA1c = 8.2%, LDL = 138 mg/dL, Creatinina = 1.1 mg/dL.
  5. O motor de inferência `CardioLogic` classifica a paciente no estrato 🟡 **Amarelo (Moderado)** e agenda o telemonitoramento a cada 30 dias.
* **Pós-condições:** Recursos `PatientCardio`, `ObservationCardioVital`, `ObservationCardioLab` e `ObservationCardioRisk` sincronizados com o AGHUX (EBSERH).

### Cenário SC-CARDIO-02: Crise Hipertensiva Domiciliar e Alerta Vermelho de Emergência
* **Atores:** Dona Francisca, Médica Endocrinologista de Plantão no HULW (Dra. Valéria).
* **Pré-condições:** Dona Francisca realiza sua aferição de rotina matinal em sua residência.
* **Fluxo Principal:**
  1. A paciente coloca a braçadeira do esfigmomanômetro Bluetooth e inicia a medição.
  2. O dispositivo registra **PA: 195/118 mmHg** e Frequência Cardíaca de 112 bpm, transmitindo os dados via Bluetooth para o app mareIA.
  3. O aplicativo envia imediatamente o recurso `Observation` para o servidor FHIR.
  4. O motor `CardioLogic` identifica violação de limiar crítico de emergência (PAS ≥ 180 mmHg ou PAD ≥ 110 mmHg) e gera um **Alerta Vermelho (Nível 1)**.
  5. O painel web da Dra. Valéria no HULW emite alerta sonoro e visual de tela cheia.
  6. A Dra. Valéria inicia uma telechamada prioritária com Dona Francisca em menos de 15 minutos, investiga sintomas de lesão de órgão-alvo (ausência de dor precordial e déficit neurológico) e orienta medicação de resgate oral com encaminhamento preventivo à UPA se persistir.
  7. A médica registra a conduta na plataforma mareIA, que gera o laudo estruturado e sincroniza com o prontuário AGHUX.
* **Pós-condições:** `ObservationCardioRisk` atualizado com intervenção documentada; notificação registrada no log de auditoria.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-cardio.svg" alt="Diagrama de Sequência CardioRemoto" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.3 🏡 FamilIAr_Ativa — Cenários em Cuidados Paliativos Domiciliares

### Cenário SC-FAMILIAR-01: Monitoramento Domiciliar com Escalas ESAS e Zarit
* **Atores:** Paciente em Cuidados Paliativos (Sr. Carlos, 67 anos), Filha e Cuidadora Principal (Juliana, 38 anos).
* **Pré-condições:** Sr. Carlos possui neoplasia pulmonar avançada e está em acompanhamento domiciliar pelo programa CUIDATIVA / UFPel.
* **Fluxo Principal:**
  1. Diariamente às 18h, Juliana abre o aplicativo FamilIAr_Ativa para preencher a Escala de Sintomas de Edmonton (ESAS).
  2. Juliana registra os escores de 0 a 10 para cada um dos 10 sintomas: Dor = 3/10, Dispneia = 2/10, Náusea = 1/10, Cansaço = 4/10, etc. (Escore Total = 18/70 - **Baixo Risco**).
  3. Semanalmente aos domingos, Juliana responde também ao questionário de Sobrecarga do Cuidador de Zarit (Escore = 16/88 - **Sobrecarga Leve**).
  4. O aplicativo envia os questionários respondidos para a base do CUIDATIVA.
* **Pós-condições:** `ObservationEsasScore` e `ObservationZaritScore` registrados; curva longitudinal de bem-estar estabilizada.

### Cenário SC-FAMILIAR-02: Predição por IA (XAI) de Crise Álgica e Exaustão do Cuidador
* **Atores:** Juliana, Sr. Carlos, Equipe Interdisciplinar do CUIDATIVA / UFPel (Médico Paliativista e Psicólogo).
* **Pré-condições:** Nos últimos 3 dias, o Sr. Carlos apresentou piora progressiva da dor (de 3/10 para 8/10), e Juliana relata insônia e choro frequente (Zarit saltou para 48/88 - **Sobrecarga Severa**).
* **Fluxo Principal:**
  1. Ao enviar as respostas, o motor de regras determinísticas dispara a regra `RA-01` (Dor ≥ 7) e a regra `RA-02` (Zarit ≥ 41).
  2. Simultaneamente, o modelo preditivo de aprendizado de máquina analisa a série temporal dos últimos 14 dias e prevê probabilidade de 92% de descompensação nas próximas 24 horas.
  3. O módulo de explicabilidade (XAI) identifica que as variáveis de maior peso foram a aceleração da dor (`SHAP +0.41`) e o esgotamento do cuidador (`SHAP +0.33`).
  4. O sistema gera um `FlagClinicalAlert` crítico com os dados de XAI e notifica o médico e o psicólogo do CUIDATIVA.
  5. O médico faz contato telefônico imediato para reajuste da dose de morfina de resgate, e o psicólogo agenda visita domiciliar de acolhimento para o dia seguinte.
* **Pós-condições:** Visita domiciliar realizada; plano terapêutico reajustado; acompanhamento de enfermagem intensificado para 2× ao dia.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-familiarativa.svg" alt="Diagrama de Sequência FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.4 🌾 AgroSUS — Cenários de Vigilância em Saúde do Trabalhador Rural

### Cenário SC-AGROSUS-01: Anamnese Ocupacional em Campo pelo ACS Rural
* **Atores:** Trabalhador Rural (Sr. Sebastião, 45 anos, produtor de hortaliças), ACS Rural (Marcos).
* **Pré-condições:** Marcos realiza visitas periódicas aos pequenos produtores do cinturão verde de Ferraz de Vasconcelos/SP.
* **Fluxo Principal:**
  1. O ACS Marcos visita a propriedade do Sr. Sebastião e aplica a `Questionnaire/AgroSUSAnamnese` em seu aplicativo móvel.
  2. O Sr. Sebastião relata que pulveriza agrotóxicos organofosforados semanalmente com pulverizador costal manual e que utiliza apenas máscara simples de tecido (sem filtro químico) e botas comuns.
  3. Marcos registra a ausência de EPIs adequados (respirador PFF2 com carvão ativado, macacão hidrorrepelente e luvas nitrílicas) e a prática inadequada de lavar as roupas de pulverização junto com as roupas dos familiares.
  4. O sistema calcula um **Índice de Risco de Exposição Elevado** e agenda automaticamente na UBS a coleta de sangue para o **Exame Basal de Colinesterase Plasmática e Eritrocitária**.
* **Pós-condições:** Recursos `AgroSUSVisitaACS` e `QuestionnaireResponse` sincronizados com a UBS; encaminhamento gerado no sistema.

### Cenário SC-AGROSUS-02: Detecção de Depressão Enzimática (NR-7), Afastamento e Notificação SINAN
* **Atores:** Sr. Sebastião, Médica da UBS / Saúde da Família (Dra. Helena), Equipe da VISAT Municipal.
* **Pré-condições:** O Sr. Sebastião realizou o exame basal há 6 meses (Colinesterase Eritrocitária = 4.500 U/L). Hoje colheu o exame periódico semestral da NR-7.
* **Fluxo Principal:**
  1. O laboratório municipal de análises clínicas insere o laudo no sistema: **Colinesterase Eritrocitária = 2.650 U/L (Queda de 41.1% em relação ao basal individual)**.
  2. O motor `AgroSUSIntoxicacaoLogic` detecta que a queda ultrapassou o limiar de alerta da NR-7 (queda ≥ 30% e < 50%) e dispara a regra `DT-AG-02`.
  3. O sistema gera um alerta prioritário no prontuário da UBS e notifica a Dra. Helena.
  4. A Dra. Helena convoca o Sr. Sebastião para consulta médica imediata, constata queixas de cefaleia e visão turva pós-aplicação e determina o **afastamento temporário de 30 dias** das atividades de manipulação e pulverização de agrotóxicos.
  5. A médica emite o plano de acompanhamento (`AgroSUSPlanoAcompanhamento`) e preenche a Ficha de Notificação Compulsória de Intoxicação Exógena, que é transmitida automaticamente ao **SINAN (Sistema de Informação de Agravos de Notificação)**.
  6. A equipe da Vigilância em Saúde do Trabalhador (VISAT) agenda inspeção sanitária orientativa na propriedade rural.
* **Pós-condições:** Notificação SINAN registrada; exame confirmatório agendado para 15 dias; paciente em monitoramento clínico semanal até normalização da atividade enzimática.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-agrosus.svg" alt="Diagrama de Sequência AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>
