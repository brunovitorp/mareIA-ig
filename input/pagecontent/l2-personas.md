# 2. Personas Genéricas

As personas representam os atores-chave envolvidos no ecossistema do **CardioRemoto** (UFPB / HULW / mareIA):

---

### Personas Clínicas e Assistenciais

#### 1. Paciente com DM e/ou HAS (`patient-cardio`)
* **Papel:** Pessoa adulta (≥ 18 anos) ou idosa com diagnóstico de Hipertensão Arterial Sistêmica e/ou Diabetes Mellitus acompanhada no Ambulatório de Telessaúde.
* **Ações:** Realiza aferições domiciliares ou em visitas agendadas, recebe orientações de autocuidado, participa de teleconsultas e recebe lembretes de visitas/exames.
* **Dispositivos:** Smartphone com aplicativo mareIA, balança, glicosímetro e esfigmomanômetro Bluetooth.

#### 2. Agente de Saúde / Técnico de Coleta (`health-agent`)
* **Papel:** Profissional responsável pelo acolhimento, cadastro inicial, coleta antropométrica/vital e sincronização de dados no ponto de atendimento.
* **Ações:** Executa o login seguro (RF001), cadastra novos pacientes (RF002), registra visitas e medições IoT (RF005), visualiza histórico e gráficos (RF006) e gerencia a sincronização offline (RF007).

#### 3. Médica Endocrinologista / Cardiologista de Telessaúde (`physician-specialist`)
* **Papel:** Médica especialista responsável pela condução clínica, teleconsultas, prescrição e avaliação dos alertas no HULW.
* **Ações:** Acompanha o dashboard clínico, avalia alertas em tempo real (Vermelho, Laranja, Amarelo), ajusta a conduta farmacológica e define o plano de cuidado individualizado.

#### 4. Nutricionista (`nutritionist`)
* **Papel:** Profissional da equipe multiprofissional de apoio ao manejo metabólico.
* **Ações:** Recebe encaminhamentos para pacientes em alerta amarelo/laranja (dislipidemia grave com triglicerídeos > 1000 mg/dL, perda de peso não intencional ≥ 5% ou obesidade/descontrole glicêmico).

#### 5. Gestor de Telessaúde e Pesquisador UFPB (`manager-researcher`)
* **Papel:** Responsável pelo monitoramento dos indicadores de programa, conformidade com a LGPD e governança dos dados.
* **Ações:** Acompanha taxas de controle pressórico, controle glicêmico, tempo de resposta a alertas e completude de registros.
