# Plataforma mareIA — SMART Guidelines IG (Guia Integrado de Telemonitoramento)

**Implementation Guide Integrado (FHIR R4)** da **Plataforma mareIA** — Guia unificado de telemonitoramento clínico e suporte à decisão assistencial no âmbito do **SUS Digital** e do **Programa RNP Redes de Colaboração em Saúde Digital 2025**.

Este repositório consolida a adaptação digital de **4 Linhas de Cuidado (Pathways)** seguindo a metodologia **WHO SMART Guidelines** (L1 Narrativa → L2 DAK → L3 FHIR Computável):

---

## 🗂️ Os 4 Pathways Integrados

| Linha de Cuidado | Instituição Parceira | Foco Assistencial | Instrumentos Clínicos |
|---|---|---|---|
| 🫀 **CardioRemoto** | **UFPB / HULW** (João Pessoa/PB) | Diabetes Mellitus (DM) e Hipertensão Arterial (HAS) | IoT ANVISA (PA, FC, Glicemia) + Labs (HbA1c, Lipídios) |
| 🧓 **ATENTO 60+** | **UFPE / UFPB** (Recife/PB) | Telemonitoramento da Pessoa Idosa na APS | Questionário IVCF-20 (Fragilidade) + Quedas/Sarcopenia |
| 🏡 **FamilIAr_Ativa** | **UFPel / CUIDATIVA** (Pelotas/RS) | Cuidados Paliativos Domiciliares e Cuidadores | Escala ESAS (Sintomas) + Zarit (Sobrecarga) + IA/XAI |
| 🌾 **AgroSUS** | **FATEC Ferraz** (Ferraz/SP) | Saúde do Trabalhador Rural | Anamnese Ocupacional + Colinesterase (NR-7) |

---

## 📐 Camadas SMART Guidelines da OMS

| Camada | O que é | Onde está no repositório |
|---|---|---|
| **L1** | **Narrativa:** Protocolos clínicos e diretrizes médicas | `sources/` + páginas `pathway-*.md` |
| **L2** | **DAK:** 9 componentes estruturados (Intervenções a Testes) | `l2/` + `input/pagecontent/l2-*.md` |
| **L3** | **FHIR Computável:** Perfis, Questionários, PlanDefinitions | `input/fsh/**` compilados para `fsh-generated/` |
| **L4** | **Serviços Executáveis:** APIs REST FHIR e Integração AGHUX | Especificado nos `CapabilityStatements` |
| **L5** | **Saúde Dinâmica & IA:** Modelos preditivos explicáveis (XAI)| Lógica do FamilIAr_Ativa e CardioRemoto |

---

## 📂 Estrutura do Repositório

```
input/fsh/
├── core/             → Perfis base do SUS (PatientMareIABase, PractitionerMareIABase, BRRacaCor)
├── cardio/           → Artefatos do CardioRemoto (DM/HAS, HULW/UFPB)
├── atento60/         → Artefatos do ATENTO 60+ (Idoso, IVCF-20, UFPE/UFPB)
├── familiarativa/    → Artefatos do FamilIAr_Ativa (Paliativos, ESAS/Zarit, UFPel)
└── agrosus/          → Artefatos do AgroSUS (Trabalhador Rural, Colinesterase, FATEC)

input/pagecontent/    → Narrativas e páginas publicadas no site do IG
portal/               → Landing Page e Hub de Diretrizes Digitais mareIA
docs/                 → Arquitetura, PRDs, ADRs e Cookbooks de deploy
```

---

## 🛠️ Build e Validação

```bash
# 1. Compilar FSH → recursos FHIR JSON (SUSHI)
sushi .

# 2. Gerar o site completo do IG (requer Java 11+)
_genonce.bat       # Windows
./_genonce.sh      # Linux/macOS
```

Saída em `output/index.html`.

---

## 📜 Licença

CC-BY-SA-4.0 (conteúdo) / Apache-2.0 (código e especificações computáveis).
