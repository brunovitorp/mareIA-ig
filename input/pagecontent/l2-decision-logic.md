# 6. Lógica de Suporte à Decisão Clínica

A lógica de decisão da Plataforma **mareIA** é formalizada em tabelas de decisão DMN e orquestrada no FHIR R4 através de recursos `PlanDefinition` e bibliotecas `Library` (CQL).

---

## 6.1 🫀 Regras de Decisão do CardioRemoto

### Estratificação de Risco Cardiovascular:
| Condição Clínica | Classificação | Cor / Status | Periodicidade |
|---|---|---|---|
| PA < 140/90 mmHg E Glicemia < 140 mg/dL E HbA1c < 7.0% | Controlado | 🟢 **Verde** | 90 dias |
| PA 140–179/90–109 mmHg OU Glicemia 140–249 mg/dL OU HbA1c 7.0–8.9% | Moderado | 🟡 **Amarelo** | 30 dias |
| PA ≥ 180/110 mmHg OU Glicemia ≥ 250 mg/dL (ou < 70) OU HbA1c ≥ 9.0% | Grave | 🔴 **Vermelho** | 30 dias |

### Sistema de Alertas:
- **Vermelho (Imediato):** PA ≥ 180/120 mmHg, Hipoglicemia severa (< 54 mg/dL), ou suspeita de evento cardiovascular agudo. Conduta: Contato médico imediato / SAMU 192.
- **Laranja (Semanal/Quinzenal):** Descontrole persistente de PA em 3 aferições consecutivas ou HbA1c > 8.5%.
- **Amarelo (Quinzenal/Trimestral):** Atraso de mais de 15 dias na realização da consulta ou renovação de exames.

---

## 6.2 🧓 Regras de Decisão do ATENTO 60+ (IVCF-20)

| Escore IVCF-20 | Estratificação Funcional | Conduta Recomendada | Periodicidade |
|---|---|---|---|
| **0 a 6 pontos** | **Idoso Robusto** | Ações de promoção da saúde e envelhecimento ativo na UBS | Anual |
| **7 a 14 pontos**| **Em Risco de Fragilização** | Intervenção preventiva multiprofissional e reavaliação periódica | Trimestral |
| **≥ 15 pontos**  | **Idoso Frágil** | Avaliação Geriátrica Ampla (AGA), visita domiciliar e telecuidado ativo | Mensal |

---

## 6.3 🏡 Regras de Decisão do FamilIAr_Ativa (Paliativos)

| Gatilho Clínico | Nível de Alerta | Ação Automatizada |
|---|---|---|
| Dor ESAS ≥ 7/10 OU Dispneia ≥ 7/10 | 🔴 **Crítico** | Notificação imediata para médico e enfermeiro de cuidados paliativos |
| Piora ≥ 3 pontos em qualquer sintoma em 48h | 🟡 **Moderado** | Sugestão de contato telefônico e reavaliação de posologia analgésica |
| Escore Zarit ≥ 17 pontos (Sobrecarga Severa) | 🟠 **Alerta Cuidador** | Acionamento de equipe de apoio psicológico e serviço social |

---

## 6.4 🌾 Regras de Decisão do AgroSUS (Toxicologia Ocupacional)

| Indicador Biológico (Colinesterase) | Classificação | Conduta Clínica / Ocupacional |
|---|---|---|
| Queda < 15% em relação ao basal | Normal / Sem restrição | Manutenção das atividades e reforço no uso correto de EPIs |
| Queda de 15% a 30% em relação ao basal | Atenção / Vigilância | Redução da jornada de pulverização e retestagem em 30 dias |
| Queda > 30% em relação ao basal OU Sintomas Agudos | **Intoxicação Provável** | **Afastamento temporário imediato da exposição**, solicitação de retestagem em 15 dias, avaliação médica na UBS e emissão de CAT/SINAN |
