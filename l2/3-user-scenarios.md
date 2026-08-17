# 3. Cenários de Uso

Os cenários de uso ilustram as principais jornadas de interação dos atores com a plataforma mareIA no âmbito do **CardioRemoto**:

---

### Cenário 1: Cadastro e Triagem Antropométrica/Vital Inicial
* **Ator:** Agente de Saúde / Técnico de Coleta
* **Contexto:** Paciente comparece ao HULW para realização de exames laboratoriais e entrada no programa.
* **Fluxo:**
  1. O agente realiza login seguro no aplicativo mareIA.
  2. Cadastra os dados sociodemográficos, histórico de evento cardiovascular prévio (IAM, AVC, DAP), uso de estatina e anti-hipertensivo, tabagismo e prática de atividade física.
  3. Coleta dados antropométricos (peso, altura, cálculo automático de IMC e circunferência da cintura) e sinais vitais (PA com 2 aferições e glicemia capilar).
  4. O aplicativo salva os dados em banco local (offline-first) e os sincroniza com a nuvem da mareIA / AGHUX.

---

### Cenário 2: Registro de Exames Laboratoriais e Disparo de Alertas
* **Ator:** Equipe de Telessaúde / Integração AGHUX
* **Contexto:** Resultados de exames laboratoriais (HbA1c, Perfil Lipídico, Creatinina, TFG) são liberados pelo laboratório do HULW.
* **Fluxo:**
  1. Os resultados são importados/registrados no prontuário do paciente.
  2. O motor de regras da mareIA reavalia a estratificação: paciente com HbA1c 9.5%, PA 150/95 mmHg e LDL 170 mg/dL é classificado como **Vermelho (Grave)**.
  3. O sistema emite **Alerta Amarelo/Laranja** para a equipe multiprofissional agendar teleconsulta e avaliação nutricional prioritária.

---

### Cenário 3: Detecção de Crise Hipertensiva ou Hipoglicemia Aguda
* **Ator:** Paciente / Agente de Saúde / Médica Especialista
* **Contexto:** Durante uma aferição de rotina, a pressão arterial registrada é de 190/125 mmHg.
* **Fluxo:**
  1. A plataforma reconhece imediatamente o valor como crítico (PA ≥ 180/120 mmHg) e gera um **Alerta Vermelho (Imediato)**.
  2. O aplicativo exibe orientações emergenciais imediatas ao paciente/cuidador.
  3. A médica endocrinologista no HULW recebe notificação prioritária no dashboard e entra em contato via teleconsulta ou orienta encaminhamento à Unidade de Pronto Atendimento (UPA/Emergência).
