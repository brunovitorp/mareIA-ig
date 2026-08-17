# 9. Cenários e Casos de Teste

Casos de teste estruturados para validação clínica e técnica dos recursos FHIR e fluxos operacionais da Plataforma **mareIA**.

---

## 9.1 Casos de Teste Clínicos por Linha de Cuidado

### 🫀 CT-CARDIO-01 (Validação de Alerta Vermelho de Crise Hipertensiva)
- **Entrada:** `ObservationCardioVital` com PA Sistólica de `195 mmHg` e Diastólica de `120 mmHg`.
- **Comportamento Esperado:** `PlanDefinitionCardioRemoto` gera `CommunicationRequest` de alta prioridade (`AlertPriorityCS#vermelho`), categoriza como risco Grave e notifica o médico assistente.

### 🧓 CT-ATENTO-01 (Cálculo Automatizado do Escore IVCF-20)
- **Entrada:** `QuestionnaireResponse` com 20 respostas totalizando pontuação de 16 pontos.
- **Comportamento Esperado:** `ObservationIvcfScore` gerada com valor `16` e classificação `IvcfRiskCS#fragil`. Acionamento de recomendação de Avaliação Geriátrica Ampla.

### 🏡 CT-FAMILIAR-01 (Detecção de Crise de Dor e Fadiga)
- **Entrada:** `ObservationEsasScore` com escore de Dor = `9/10`.
- **Comportamento Esperado:** Emissão do recurso `FlagClinicalAlert` com status ativo e severidade crítica, acionando a equipe de cuidados paliativos domiciliares.

### 🌾 CT-AGROSUS-01 (Queda de Colinesterase e Afastamento)
- **Entrada:** Exame basal = `8000 U/L`; Novo exame = `4800 U/L` (queda de 40%).
- **Comportamento Esperado:** `AgroSUSEstratificacaoRisco` classifica como `Intoxicação Provável`, gera recomendação de afastamento temporário da exposição e agendamento de retestagem em 15 dias.

---

## 9.2 Casos de Teste Técnicos (Validação de Interoperabilidade)

1. **CT-TECH-01 (SUSHI Build):** O compilador SUSHI deve gerar todos os recursos JSON em `fsh-generated/resources/` com **0 erros**.
2. **CT-TECH-02 (IG Publisher QA):** A ferramenta IG Publisher deve gerar o site estático completo sem erros de esquema FHIR e sem links quebrados.
3. **CT-TECH-03 (Identificadores Nacionais):** Todos os perfis de paciente e profissional devem validar conformidade com identificadores do SUS (CNS/CPF).
