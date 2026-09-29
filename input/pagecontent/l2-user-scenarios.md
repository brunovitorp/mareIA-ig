# 3. Cenários de Uso Clínicos e Operacionais (DAK L2)

Os **Cenários de Uso da Plataforma mareIA** descrevem as interações ponta a ponta entre os usuários do SUS (cidadãos, cuidadores, agentes de saúde e profissionais), as aplicações móveis e web e os serviços de interoperabilidade e decisão computável em FHIR R4.

Cada cenário aplica as regras da [Lógica de Suporte à Decisão](l2-decision-logic.html) e indica, entre parênteses, os IDs das regras exercitadas. Todas as pessoas e valores são fictícios.

---

## 3.1 🧓 ATENTO 60+ — Cenários Clínicos na Atenção Primária

### Cenário SC-ATENTO-01: Visita Domiciliar e Aplicação do IVCF-20 (Offline-First)
*Regras: `DT-AT-02`*
* **Atores:** Agente Comunitário de Saúde (ACS Dona Maria), Pessoa Idosa (Sr. José, 78 anos).
* **Pré-condições:** O ACS tem um tablet com o aplicativo mareIA autenticado. O Sr. José está cadastrado no território da UBS, mas mora em área rural sem sinal de celular.
* **Fluxo principal:**
  1. O ACS visita a casa do Sr. José e abre o `Atento60Ivcf20Questionnaire` no aplicativo.
  2. O ACS lê as 20 perguntas e registra as respostas na tela.
  3. Pontuação: idade 78 anos (`q01` = 1), saúde regular (`q02` = 1), deixou de fazer compras (`q03` = 4) e de controlar o dinheiro (`q04` = 4) — o grupo AVD-I tem teto de **4 pontos** — e usa 6 medicamentos por dia (`q20` = 4).
  4. O aplicativo calcula localmente o escore: 1 + 1 + 4 + 4 = **10 pontos → Em risco de fragilização** (`DT-AT-02`).
  5. O ACS afere pressão arterial (135/85 mmHg) e saturação (SpO2 96%) com dispositivos Bluetooth. Os valores estão dentro da referência e não geram alerta.
  6. O aplicativo guarda os recursos em banco local criptografado, com identificador de sincronização offline.
  7. De volta à UBS, com Wi-Fi, o aplicativo sincroniza o `QuestionnaireResponse` e as `Observation` com o servidor FHIR mareIA.
* **Exceção:** se o idoso tiver declínio cognitivo agudo e não houver cuidador presente, o ACS suspende o questionário e agenda visita conjunta com o enfermeiro da ESF.
* **Pós-condições:** `QuestionnaireResponse` com status `completed`; `Atento60ObservationIvcfScore` com valor `10` e faixa `risco-fragilizacao`; próxima coleta programada para **2 meses**.

### Cenário SC-ATENTO-02: Quedas, Internação e Reclassificação para Idoso Frágil
*Regras: `GA-AT-01`, `GA-AT-02`, `GA-AT-06`, `DT-AT-03`*
* **Atores:** Sr. Antônio (82 anos), filha e cuidadora, Enfermeira da ESF (Enfª Camila).
* **Pré-condições:** O Sr. Antônio era classificado como robusto (escore 4: `q01` = 1, `q02` = 1, `q18` = 2). Nos últimos meses ele caiu duas vezes; na segunda queda, ficou 3 dias internado para observação.
* **Fluxo principal:**
  1. Na reavaliação, a cuidadora relata as duas quedas (`q16` = Sim) e a internação (`q20` = Sim).
  2. O motor de regras (`Atento60Ivcf20Logic`) gera o alerta de **queda** (`GA-AT-01`) e o de **internação recente** (`GA-AT-02`).
  3. O Sr. Antônio agora tem dificuldade para caminhar (`q15` = Sim), marcha lenta (`q14` = Sim) e relata desânimo desde a queda (`q10` = Sim), o que gera o alerta de **humor alterado** (`GA-AT-06`).
  4. Novo escore: 1 + 1 + 2 (`q10`) + 2 (`q14`) + 2 (`q15`) + 2 (`q16`) + 2 (`q18`) + 4 (`q20`) = **16 pontos → Idoso frágil** (`DT-AT-03`).
  5. Os alertas aparecem no painel da Enfª Camila, que analisa o histórico e antecipa uma **Avaliação Geriátrica Ampla** com a equipe eMulti.
* **Pós-condições:** faixa atualizada para `fragil`; alertas registrados para a equipe; periodicidade padrão da faixa frágil (3 meses) antecipada pelo alerta.

### Cenário SC-ATENTO-03: Telemonitoramento IoT com Perda de Peso e Saturação Baixa
*Regras: `GA-AT-03`, `GA-AT-04`, `GA-AT-05`, `GA-AT-07`*
* **Atores:** Dona Maria (78 anos), ACS, Médico da UBS.
* **Pré-condições:** Dona Maria (1,77 m) usa balança e oxímetro Bluetooth em casa. Há 3 meses pesava 72 kg e avaliava a própria saúde como boa.
* **Fluxo principal:**
  1. A balança registra **68 kg** (`Atento60ObservationIotVital`): perda de 4 kg sem dieta, o que gera o alerta de **perda de peso não intencional** (`GA-AT-04`).
  2. O IMC calculado é 68 ÷ 1,77² = **21,7 kg/m²**, abaixo de 22, o que gera o alerta de **IMC < 22** (`GA-AT-05`).
  3. No mesmo dia, o oxímetro registra saturação abaixo da referência crítica configurada pela equipe da UBS, o que gera o alerta de **sinal vital crítico** (`GA-AT-03`).
  4. Na visita seguinte, Dona Maria diz que a saúde está "regular" (`q02`), pior que na visita anterior, o que gera o alerta de **autopercepção piorando** (`GA-AT-07`).
  5. O médico da UBS recebe os alertas, antecipa a consulta e encaminha Dona Maria à Nutrição.
* **Pós-condições:** alertas registrados; agendamento antecipado; série de peso e saturação disponível no prontuário.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-atento60.svg" alt="Diagrama de Sequência ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.2 🫀 CardioRemoto — Cenários de Risco Cardiovascular e Telessaúde

### Cenário SC-CARDIO-01: Triagem Inicial, Pareamento IoT e Linha de Base
*Regras: `DT-CR-02`, `AL-CR-07`, `AL-CR-08`*
* **Atores:** Paciente com DM2/HAS (Dona Francisca, 58 anos), Técnico de Telessaúde do HULW.
* **Pré-condições:** Dona Francisca foi encaminhada pela Atenção Básica ao Ambulatório de Telessaúde da Endocrinologia do HULW.
* **Fluxo principal:**
  1. Na teleconsulta de entrada, a paciente aceita o TCLE e é cadastrada no AGHUX e na plataforma mareIA.
  2. O técnico aplica a triagem (`QuestionnaireCardioTriage`) e pareia os dispositivos IoT homologados pela ANVISA (esfigmomanômetro e glicosímetro Bluetooth).
  3. Dados coletados: PA **146/88 mmHg**; HbA1c **8,2%**; LDL **118 mg/dL**; sem evento cardiovascular nos últimos 12 meses.
  4. O `CardioLogic` conta **2 parâmetros fora da meta** (PA e HbA1c) e classifica a paciente como 🟡 **Amarelo (Moderado)** (`DT-CR-02`), com reavaliação a cada **30 dias**.
  5. São gerados alertas Amarelos de PA fora da meta não crítica (`AL-CR-07`) e de HbA1c ≥ 7% (`AL-CR-08`). A equipe agenda teleconsulta para ajuste terapêutico e encaminha a paciente ao nutricionista.
* **Pós-condições:** `PatientCardio`, `ObservationCardioVital`, `ObservationCardioLab` e `ObservationCardioRisk` (`amarelo`) sincronizados com o AGHUX.

### Cenário SC-CARDIO-02: Crise Hipertensiva Domiciliar e Alerta Vermelho
*Regras: `AL-CR-01`, `AL-CR-03`*
* **Atores:** Dona Francisca, Médica Endocrinologista do HULW (Dra. Valéria).
* **Pré-condições:** Dona Francisca faz a aferição de rotina em casa.
* **Fluxo principal:**
  1. O esfigmomanômetro Bluetooth registra **PA 195/122 mmHg** e **FC 112 bpm** e envia os dados ao aplicativo mareIA.
  2. O aplicativo envia a `ObservationCardioVital` ao servidor FHIR.
  3. O `CardioLogic` identifica PA ≥ 180/120 mmHg (`AL-CR-01`) e FC > 100 bpm (`AL-CR-03`) e gera **Alerta Vermelho — Crítico/Imediato**.
  4. O painel da Dra. Valéria mostra a paciente no topo da lista de prioridades.
  5. A Dra. Valéria faz teleconsulta imediata, investiga sinais de lesão de órgão-alvo e, conforme o quadro, orienta conduta ou encaminha à emergência.
  6. A conduta é registrada na plataforma e sincronizada com o prontuário AGHUX.
* **Pós-condições:** alerta Vermelho com conduta documentada; evento registrado no log de auditoria.

### Cenário SC-CARDIO-03: Hipoglicemia, Triglicerídeos Muito Altos e Evento Cardiovascular Recente
*Regras: `AL-CR-02`, `AL-CR-05`, `DT-CR-03`*
* **Atores:** Sr. João Silva (66 anos, DM2), Técnico de Telessaúde, Médica Endocrinologista, Nutricionista.
* **Pré-condições:** O Sr. João teve um IAM há 5 meses. Na última visita, PA 132/84 mmHg, HbA1c 6,8% e LDL 96 mg/dL (todos na meta).
* **Fluxo principal:**
  1. O glicosímetro registra **glicemia capilar de 62 mg/dL**, e o Sr. João relata tremores e sudorese.
  2. O `CardioLogic` identifica glicemia < 70 mg/dL e gera **Alerta Vermelho** (`AL-CR-02`). A equipe orienta a correção imediata da hipoglicemia e revisa a dose do hipoglicemiante.
  3. O exame laboratorial seguinte mostra **triglicerídeos de 1150 mg/dL**, que geram **Alerta Laranja** (`AL-CR-05`) e encaminhamento ao médico e ao nutricionista em até duas semanas.
  4. Mesmo com PA, HbA1c e LDL na meta, o IAM há menos de 12 meses mantém o paciente em 🔴 **Vermelho (Grave)** (`DT-CR-03`), com reavaliação a cada **30 dias**.
* **Pós-condições:** `ObservationCardioRisk` = `vermelho`; alertas Vermelho e Laranja registrados com conduta.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-cardio.svg" alt="Diagrama de Sequência CardioRemoto" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.3 🏡 FamilIAr_Ativa — Cenários em Cuidados Paliativos Domiciliares

### Cenário SC-FAMILIAR-01: Monitoramento Domiciliar de Rotina com ESAS e Zarit
*Regras: `DT-FA-01`, `DT-FA-04`*
* **Atores:** Paciente em cuidados paliativos (Dona Maria, 74 anos), filho e cuidador principal (João).
* **Pré-condições:** Dona Maria tem câncer avançado e é acompanhada em casa pelo programa CUIDATIVA/UFPel. João é o usuário principal do aplicativo.
* **Fluxo principal:**
  1. Todo dia, João abre o aplicativo e preenche o ESAS (`FamiliarAtivaEsasQuestionnaire`) com os 6 domínios: dor 3, dispneia 2, ansiedade 4, cansaço 5, falta de apetite 4 e mal-estar 4.
  2. O sistema calcula **soma ESAS = 22 → risco Baixo** (`DT-FA-01`), mostra a confirmação de envio e não gera alerta.
  3. Uma vez por mês, João responde à Zarit (`FamiliarAtivaZaritQuestionnaire`): **18 pontos → sobrecarga Leve** (`DT-FA-04`).
* **Pós-condições:** `FamiliarAtivaObservationEsasScore` e `FamiliarAtivaObservationZaritScore` registrados; ESAS segue diário e Zarit segue mensal.

### Cenário SC-FAMILIAR-02: Piora dos Sintomas e Sobrecarga Severa do Cuidador
*Regras: `DT-FA-03`, `RA-01`, `RA-05`, `DT-FA-06`, `RA-02`*
* **Atores:** Dona Maria, João, equipe do CUIDATIVA (médico paliativista e psicólogo).
* **Pré-condições:** Nos últimos dias a dor de Dona Maria piorou muito, e João está dormindo pouco.
* **Fluxo principal:**
  1. João registra o ESAS: dor 8, dispneia 7, ansiedade 9, cansaço 10, falta de apetite 9 e mal-estar 9 → **soma 52 → risco Alto** (`DT-FA-03`).
  2. Como a soma é > 50, o sistema cria o alerta **ESAS_ALTO** (`RA-01`, `FamiliarAtivaFlagClinicalAlert` com status `active`), notifica o médico e mostra orientações a João.
  3. Pelo risco Alto, o sistema abre uma **mensagem bidirecional** entre João e o profissional (`RA-05`), e o profissional passa o ESAS para **2× ao dia**.
  4. O profissional pede uma Zarit antecipada: **64 pontos → sobrecarga Severa** (`DT-FA-06`), que gera o alerta **ZARIT_SEVERA** (`RA-02`) e notifica o psicólogo. A Zarit passa a ser **semanal**.
  5. O módulo de predição por IA mostra ao médico a tendência de piora e os fatores de maior peso. O médico valida a informação antes de decidir a conduta.
  6. O médico ajusta a analgesia por telefone, e o psicólogo agenda visita domiciliar. Depois do atendimento, os alertas são resolvidos com anotação clínica e passam a `inactive`.
* **Pós-condições:** alertas ESAS_ALTO e ZARIT_SEVERA resolvidos com anotação; ESAS 2×/dia e Zarit semanal até nova decisão do profissional.

### Cenário SC-FAMILIAR-03: Queda de Adesão e Alerta sem Resolução
*Regras: `RA-03`, `RA-04`*
* **Atores:** João, Gestor do Serviço de Atenção Domiciliar, profissional de referência.
* **Pré-condições:** A janela esperada de registro do ESAS é diária. Há um alerta ESAS_ALTO aberto desde a véspera, ainda sem anotação.
* **Fluxo principal:**
  1. João fica 3 dias sem registrar o ESAS. Como os dias sem registro superam a janela esperada, o sistema cria o alerta **ADESAO_BAIXA** (`RA-03`) no painel do Gestor.
  2. A taxa de adesão dos últimos 7 dias cai abaixo de 80%, e a notificação de adesão é enviada na hora, sem esperar o ciclo semanal.
  3. O alerta ESAS_ALTO continua aberto e aparece destacado como **"requer atenção"** (`RA-04`) no painel, que atualiza em tempo real para alertas abertos.
  4. O Gestor aciona o profissional de referência, que liga para João e descobre que o celular dele quebrou. O profissional registra o atendimento e resolve os alertas.
* **Pós-condições:** alertas ADESAO_BAIXA e ESAS_ALTO resolvidos com anotação; registro diário retomado.

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-familiarativa.svg" alt="Diagrama de Sequência FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.4 🌾 AgroSUS — Cenários de Vigilância em Saúde do Trabalhador Rural

### Cenário SC-AGROSUS-01: Anamnese Ocupacional em Campo pelo ACS Rural
*Regras: `GA-AG-02`*
* **Atores:** Trabalhador rural (Sr. Sebastião, 45 anos, produtor de hortaliças), ACS rural (Marcos).
* **Pré-condições:** Marcos visita os pequenos produtores do cinturão verde de Ferraz de Vasconcelos/SP.
* **Fluxo principal:**
  1. Marcos visita a propriedade e aplica a anamnese ocupacional (`agrosus-anamnese`) no aplicativo.
  2. O Sr. Sebastião conta que pulveriza toda semana um organofosforado de **categoria toxicológica 1**, com pulverizador costal e só uma máscara de tecido e botas comuns (Seções 6 e 9).
  3. Marcos registra a falta de EPI adequado. O sistema gera **alerta crítico** por produto de categoria 1 ou 2 sem EPI (`GA-AG-02`). Esse alerta é independente: não existe escore composto de risco.
  4. Como não há valor basal de colinesterase registrado, o sistema solicita o exame basal na UBS (`AgroSUSSolicitacaoExame`). Pela regra do valor basal, o trabalhador deve ficar afastado do manuseio por 30 dias até obter o valor.
* **Pós-condições:** `AgroSUSVisitaACS` e `AgroSUSAnamneseResponse` sincronizados; alerta crítico no prontuário; exame basal solicitado.

### Cenário SC-AGROSUS-02: Monitoramento Semestral com Resultado em Precaução
*Regras: `DT-AG-01`, `DT-AG-02`, `GA-AG-04`*
* **Atores:** Sr. Sebastião, Enfermeira da UBS, laboratório municipal.
* **Pré-condições:** O basal de colinesterase plasmática do Sr. Sebastião é **8200 U/L**. Ele faz o exame semestral de rotina.
* **Fluxo principal:**
  1. No primeiro exame semestral, o resultado é **7000 U/L** → inibição de **14,6%** → **Normal** (`DT-AG-01`). O monitoramento segue semestral.
  2. No exame seguinte, o resultado é **5000 U/L** → inibição de **39,0%** → **Precaução** (`DT-AG-02`): não atinge o IBMP de 50%.
  3. O sistema gera um alerta de **atenção** (`GA-AG-04`). A enfermeira reforça o uso de EPI e a técnica de aplicação. Não há afastamento automático.
* **Pós-condições:** resultados em `AgroSUSResultadoLaboratorial`; alerta de atenção registrado; próximo exame semestral mantido.

### Cenário SC-AGROSUS-03: Colinesterase Alterada, Afastamento e Retestagem
*Regras: `DT-AG-03`, `GA-AG-04`*
* **Atores:** Sr. Sebastião, Médica da UBS (Dra. Helena).
* **Pré-condições:** Mesmo basal de 8200 U/L; o Sr. Sebastião não relata sintomas.
* **Fluxo principal:**
  1. O laboratório registra **3400 U/L** → inibição de **58,5%** → **Alterado**, acima do IBMP (`DT-AG-03`).
  2. O sistema gera **alerta crítico** (`GA-AG-04`) e notifica a Dra. Helena.
  3. A Dra. Helena determina o **afastamento do contato com agrotóxicos por 30 dias**, faz avaliação clínica e laboratorial e investiga outras causas de queda da enzima antes de concluir que a causa é ocupacional.
  4. A médica registra o `AgroSUSPlanoAcompanhamento` e o sistema solicita a **retestagem em 30 dias**.
* **Pós-condições:** afastamento e plano registrados; retestagem agendada; histórico mantido por no mínimo 40 anos (`AgroSUSProvenance`).

<div style="text-align: center; margin: 24px 0;">
  <img src="scenario-sequence-agrosus.svg" alt="Diagrama de Sequência AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>
