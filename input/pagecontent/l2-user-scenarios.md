# 3. Cenários de Uso

Os cenários de uso descrevem o fluxo operacional real ponta a ponta dos usuários e profissionais no ecossistema **mareIA**.

---

## 3.1 🫀 Cenários do CardioRemoto
- **Cenário CR-1 (Triagem Inicial e Cadastro):** O paciente com DM/HAS é acolhido no HULW, assina o TCLE digital e tem seus dados cadastrais, vitais IoT e exames basais sincronizados.
- **Cenário CR-2 (Detecção de Crise Pressórica / Alerta Vermelho):** Paciente afere PA de 190/115 mmHg em domicílio. O sistema dispara alerta imediato no painel médico do HULW, acionando contato telefônico ou teleconsulta de emergência.
- **Cenário CR-3 (Acompanhamento Longitudinal e Teleconsulta):** Paciente com risco Verde (controlado) realiza reavaliação periódica aos 90 dias, com envio prévio de exames laboratoriais e ajuste terapêutico assíncrono.

<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-cardio.svg" alt="Diagrama de Sequência CardioRemoto" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.2 🧓 Cenários do ATENTO 60+
- **Cenário AT-1 (Aplicação Domiciliar Offline do IVCF-20):** ACS visita idoso em zona sem conectividade, preenche as 20 questões no tablet; o aplicativo calcula o escore (ex: 9 pontos - Risco de Fragilização) e sincroniza com o servidor da UBS ao retornar à base.
- **Cenário AT-2 (Alerta de Fragilização Aguda e Quedas):** Idoso robusto sofre queda com fratura de membro. A reavaliação eleva o escore para 16 pontos (Frágil), gerando solicitação automática de Avaliação Geriátrica Ampla (AGA).

<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-atento60.svg" alt="Diagrama de Sequência ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.3 🏡 Cenários do FamilIAr_Ativa
- **Cenário FA-1 (Registro Semanal de Sintomas pelo Cuidador):** A filha e cuidadora de paciente oncológico em cuidados paliativos registra semanalmente a escala ESAS e Zarit.
- **Cenário FA-2 (Detecção Preditiva de Crise de Dor e Sobrecarga):** O motor de IA detecta curva ascendente de dor (de 3/10 para 8/10 em 48h) associada a esgotamento da cuidadora, emitindo flag de alerta prioritário para a equipe multiprofissional domiciliar.

<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-familiarativa.svg" alt="Diagrama de Sequência FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

---

## 3.4 🌾 Cenários do AgroSUS
- **Cenário AG-1 (Mapeamento de Exposição na Propriedade Rural):** ACS Rural aplica anamnese em agricultor que relata pulverização de organofosforados sem máscara adequada. O sistema agenda exame basal de colinesterase na UBS.
- **Cenário AG-2 (Alerta de Queda Enzimática e Afastamento):** Resultado laboratorial aponta queda de 35% na colinesterase eritrocitária. O sistema aciona o médico da UBS, gera recomendação de afastamento temporário da aplicação e notificação de agravo.

<div style="text-align: center; margin: 20px 0;">
  <img src="scenario-sequence-agrosus.svg" alt="Diagrama de Sequência AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>
