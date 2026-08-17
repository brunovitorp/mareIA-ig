# 9. Cenários e Casos de Teste (DAK L2 — Test Scenarios)

Os **Casos de Teste da Plataforma mareIA** fornecem a bateria formal de validação funcional, lógica e semântica para garantir que os motores de decisão FHIR R4, os formulários estruturados (HL7 SDC) e os fluxos de telecuidado operem estritamente conforme as diretrizes clínicas do SUS.

---

## 9.1 Casos de Teste Clínicos do ATENTO 60+ (Pessoa Idosa)

### Test Case `TC-ATENTO-01`: Cálculo do Escore IVCF-20 com Aplicação de Tetos
* **Objetivo:** Verificar se o motor CQL aplica corretamente o teto máximo de 4 pontos no grupo de AVD-I (questões `q03`, `q04` e `q05`) e classifica o idoso no estrato correto.
* **Payload de Entrada (`QuestionnaireResponse`):**
  * `q01` (Idade: 76 anos) $\rightarrow$ `1 pt`
  * `q02` (Autopercepção: Regular) $\rightarrow$ `1 pt`
  * `q03` (Deixou de fazer compras: Sim) $\rightarrow$ `4 pts`
  * `q04` (Deixou de controlar dinheiro: Sim) $\rightarrow$ `4 pts`
  * `q05` (Deixou de fazer pequenos trabalhos: Sim) $\rightarrow$ `4 pts` *(Soma bruta AVD-I = 12 pts $\rightarrow$ Teto = 4 pts)*
  * Demais itens (`q06` a `q20`) = `0 pts`.
* **Avaliação Esperada:**
  * Escore Total Computado = $1 + 1 + 4 + 0 = \mathbf{6\text{ pontos}}$.
  * Recurso `ObservationIvcfScore.valueInteger = 6`.
  * Classificação Funcional = `IvcfRiskCS#robusto`.
  * Periodicidade Sugerida = `12 meses (Anual)`.

### Test Case `TC-ATENTO-02`: Disparo de Alerta Crítico por Queda Recente (Evento Sentinela)
* **Objetivo:** Validar o acionamento imediato de alerta de prioridade alta quando o idoso relata histórico de quedas, independentemente de ter escore baixo nas outras perguntas.
* **Payload de Entrada:**
  * `q16` (Teve duas ou mais quedas no último ano) = `Sim` (`2 pts`).
  * Dinamometria = `14 kg` (Critério de Sarcopenia para Mulher: < 16 kg).
* **Avaliação Esperada:**
  * Geração do recurso `FlagClinicalAlert` com status `active` e código de alerta `AlertaQuedaRecente`.
  * Criação de `Task` para a equipe da ESF com prioridade `urgent` e prazo de 7 dias para avaliação ambiental e de marcha.

---

## 9.2 Casos de Teste Clínicos do CardioRemoto (DM / HAS)

### Test Case `TC-CARDIO-01`: Detecção de Emergência Hipertensiva Domiciliar
* **Objetivo:** Validar a regra de alarme imediato (Nível 1 - Vermelho) em aferição por dispositivo IoT Bluetooth ANVISA.
* **Payload de Entrada (`ObservationCardioVital`):**
  * Componente `8480-6` (PAS) = `192 mm[Hg]`
  * Componente `8462-4` (PAD) = `118 mm[Hg]`
  * Componente `8867-4` (FC) = `108 /min`
* **Avaliação Esperada:**
  * Classificação de Risco = `CardioRiskCS#vermelho` (Grave).
  * Disparo de `CommunicationRequest` com canal `SMS / Push` para o médico de plantão.
  * Tempo de resposta auditado no sistema com indicador de acionamento em $< 15\text{ minutos}$.

### Test Case `TC-CARDIO-02`: Estratificação de Acompanhamento Longitudinal (Estrato Verde)
* **Objetivo:** Validar o cálculo de periodicidade de 90 dias para paciente em metas de controle.
* **Payload de Entrada:**
  * Média de PA das últimas 2 semanas = `124/78 mmHg`.
  * Glicemia de Jejum = `104 mg/dL`.
  * `ObservationCardioLab` (HbA1c) = `6.4%`.
  * `ObservationCardioLab` (LDL-c) = `62 mg/dL`.
* **Avaliação Esperada:**
  * Estrato Clínico = `CardioRiskCS#verde` (Controlado).
  * Periodicidade de Monitoramento = `90 dias`.
  * Geração de mensagem educativa de reforço de hábitos saudáveis.

---

## 9.3 Casos de Teste Clínicos do FamilIAr_Ativa (Cuidados Paliativos)

### Test Case `TC-FAMILIAR-01`: Crise de Dor Refratária e Alerta RA-01
* **Objetivo:** Garantir a emissão de alerta imediato quando a escala ESAS atinge limiar de dor intensa.
* **Payload de Entrada (`QuestionnaireResponse` ESAS):**
  * Item `esas-01` (Dor) = `9/10`.
  * Item `esas-06` (Dispneia) = `4/10`.
  * Escore Total ESAS = `42/70`.
* **Avaliação Esperada:**
  * Ativação da regra determinística `RA-01`.
  * Emissão de `FlagClinicalAlert` com severidade `critical`.
  * Notificação na tela da equipe de plantão do CUIDATIVA/UFPel com sugestão de titulação de analgesia de resgate.

### Test Case `TC-FAMILIAR-02`: Sobrecarga Severa do Cuidador e Regra RA-02
* **Objetivo:** Validar a identificação de esgotamento do cuidador familiar pela escala de Zarit.
* **Payload de Entrada (`QuestionnaireResponse` Zarit):**
  * Escore Total Computado = `46/88` (Sobrecarga Severa).
* **Avaliação Esperada:**
  * Ativação da regra `RA-02`.
  * Emissão de ordem de serviço para visita domiciliar de acolhimento psicológico e assistência social em até 48 horas.

---

## 9.4 Casos de Teste Clínicos do AgroSUS (Saúde do Trabalhador Rural)

### Test Case `TC-AGROSUS-01`: Vigilância da Colinesterase com Queda Enzimática > 30% (NR-7)
* **Objetivo:** Validar a comparação automática entre exame periódico e valor basal e o acionamento de protocolo sanitário.
* **Payload de Entrada:**
  * `AgroSUSResultadoLaboratorial` (Basal Pré-exposição): AChE = `4.600 U/L` (100%).
  * `AgroSUSResultadoLaboratorial` (Exame Semestral): AChE = `2.668 U/L` (Queda de 42.0%).
* **Avaliação Esperada:**
  * Ativação da regra `DT-AG-02` (Sobre-exposição / Risco Iminente).
  * Criação de `AgroSUSPlanoAcompanhamento` com agendamento de exame confirmatório em 15 dias.
  * Alerta no prontuário da UBS para inspeção e revisão do uso de EPIs de proteção química.

### Test Case `TC-AGROSUS-02`: Intoxicação Aguda Grave e Notificação SINAN
* **Payload de Entrada:**
  * Trabalhador em atendimento na UBS com relato de miose, sudorese profusa e cólicas abdominais após aplicação de organofosforado.
  * AChE = `1.840 U/L` (Queda de 60.0% vs basal).
* **Avaliação Esperada:**
  * Ativação da regra `DT-AG-03` e `DT-AG-04`.
  * Emissão obrigatória de Ficha de Notificação Compulsória exportada para o padrão do SINAN.
  * Ordem de afastamento temporário imediato da manipulação de agrotóxicos por no mínimo 30 dias.

---

## 9.5 Casos de Teste Técnicos de Interoperabilidade e Build

| Teste Técnico | Escopo | Critério de Aceite |
|---|---|---|
| `TC-TECH-01` | **SUSHI FSH Compiler** | 100% dos arquivos FSH compilados para JSON em `fsh-generated/` com **0 Errors e 0 Warnings**. |
| `TC-TECH-02` | **HL7 IG Publisher** | Geração estática completa em `output/` sem links quebrados e sem violações de conformance FHIR R4. |
| `TC-TECH-03` | **Validação de Schemas SUS** | Validação sintática rigorosa de extensões nacionais (`BRRacaCor`), CNS e CPF nos perfis base. |
| `TC-TECH-04` | **Resiliência Offline (UUID v4)** | Capacidade de ingestão e reconciliação idempotente de recursos gerados sem conexão à internet. |
