# 4. Processos de Negócio e Workflows (BPMN)

A Plataforma **mareIA** padroniza a esteira de atendimento em **7 Macrofases Operacionais (M1 a M7)**, parametrizadas para as especificidades clínicas de cada linha de cuidado.

---

## 4.1 As 7 Macrofases Universais da Plataforma mareIA

```
 ┌───────────────┐     ┌───────────────┐     ┌───────────────┐     ┌───────────────┐
 │ M1. Entrada & │ ──> │ M2. Triagem & │ ──> │ M3. Análise   │ ──> │ M4. Ciclo de  │
 │ Elegibilidade │     │ Coleta IoT/Q. │     │ de Risco Auto.│     │ Monitoramento │
 └───────────────┘     └───────────────┘     └───────────────┘     └───────────────┘
                                                                           │
 ┌───────────────┐     ┌───────────────┐     ┌───────────────┐             │
 │ M7. Integração│ <── │ M6. Condutas &│ <── │ M5. Sistema   │ <───────────┘
 │ AGHUX / RNDS  │     │ Intervenções  │     │ de Alertas    │
 └───────────────┘     └───────────────┘     └───────────────┘
```

---

## 4.2 Parametrização dos Processos por Pathway

| Macrofase | 🫀 CardioRemoto | 🧓 ATENTO 60+ | 🏡 FamilIAr_Ativa | 🌾 AgroSUS |
|---|---|---|---|---|
| **M1. Entrada & Elegibilidade** | Paciente adulto/idoso com DM/HAS no HULW | Pessoa idosa (>= 60 anos) cadastrada na ESF | Paciente em cuidados paliativos domiciliares | Trabalhador rural com exposição a defensivos |
| **M2. Triagem e Coleta** | Dispositivos IoT (PA, FC, Glicemia) + Antropometria | Aplicação do questionário multidimensional IVCF-20 | Questionários ESAS (sintomas) e Zarit (cuidador) | Anamnese Ocupacional + Exame Basal Colinesterase |
| **M3. Análise de Risco** | Estratificação em 3 níveis (Verde, Amarelo, Vermelho) pela contagem de parâmetros fora da meta e evento CV recente | Classificação em Robusto (0-6), Risco (7-14) ou Frágil (>=15) | Nível de risco pela soma ESAS (Baixo, Moderado, Alto) e sobrecarga Zarit (Leve, Moderada, Severa) | % de inibição da colinesterase: Normal, Precaução ou Alterado (acima do IBMP) |
| **M4. Ciclo de Monitoramento**| 90 dias (Verde) / 30 dias (Amarelo/Vermelho) | 1 mês (Robusto), 2 meses (Risco) ou 3 meses (Frágil) — em revisão | ESAS diário (2×/dia se risco Alto); Zarit mensal (semanal se Severa) | No mínimo semestral (NR-7), com gatilhos adicionais |
| **M5. Sistema de Alertas** | 4 níveis de alerta (Vermelho Imediato a Sem disparo) | Queda, internação, sinal vital crítico, perda de peso, IMC < 22, humor e autopercepção | Regras RA-01 a RA-05 (ESAS alto, Zarit severa, adesão baixa, alerta aberto, mensagem bidirecional) | Colinesterase alterada/em precaução, sintoma agudo, produto cat. 1–2 sem EPI, intoxicação prévia |
| **M6. Condutas e Ações** | Teleconsulta com endocrinologista/nutricionista | Avaliação Geriátrica Ampla (AGA) e Projeto Terapêutico | Ajuste de sintomas, apoio ao cuidador e visita domiciliar | Afastamento de 30 dias, avaliação clínica e retestagem em 30 dias |
| **M7. Integração SUS/Hospital**| Interoperabilidade FHIR com AGHUX (EBSERH) | Exportação de dados para prontuário da APS (e-SUS) | Registro em prontuário de atenção domiciliar | Notificação de vigilância em saúde do trabalhador |

---

## 4.3 Diagramas de Processo Clínico por Linha de Cuidado

### 🫀 CardioRemoto — Fluxo Clínico e Telessaúde
<div style="text-align: center; margin: 20px 0;">
  <img src="process-cardio.svg" alt="Fluxo Clínico CardioRemoto" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 🧓 ATENTO 60+ — Macrofases da Pessoa Idosa
<div style="text-align: center; margin: 20px 0;">
  <img src="process-atento60.svg" alt="Fluxo Clínico ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 🏡 FamilIAr_Ativa — Cuidados Paliativos Domiciliares & XAI
<div style="text-align: center; margin: 20px 0;">
  <img src="process-familiarativa.svg" alt="Fluxo Clínico FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 🌾 AgroSUS — Vigilância Ocupacional e Toxicologia Rural
<div style="text-align: center; margin: 20px 0;">
  <img src="process-agrosus.svg" alt="Fluxo Clínico AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>
