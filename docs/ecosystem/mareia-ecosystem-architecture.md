# Arquitetura do Ecossistema mareIA — WHO SMART Guidelines

## 1. Visão Geral
A **Plataforma mareIA** é uma infraestrutura aberta de saúde digital voltada ao telemonitoramento inteligente, suporte à decisão clínica e integração hospitalar (AGHUX/EBSERH e SUS Digital), desenvolvida no âmbito do **Programa RNP Redes de Colaboração em Saúde Digital 2025**.

O ecossistema adota integralmente a metodologia **WHO SMART Guidelines**, decompondo o conhecimento de saúde em 5 camadas:
- **L1 (Narrativa):** Protocolos clínicos e diretrizes baseadas em evidências.
- **L2 (DAK — Digital Adaptation Kit):** 9 componentes estruturados e legíveis por humanos.
- **L3 (FHIR R4 / Computável):** Recursos FHIR máquina-legíveis compilados via SUSHI.
- **L4 (Executável):** Serviços clínicos, APIs de integração IoT e motores de inferência/regras.
- **L5 (Dinâmico):** Aprendizado contínuo, predição por IA/XAI e adaptação em tempo real.

---

## 2. Mapa dos 4 Pathways da Plataforma mareIA

```
                                  ┌────────────────────────────────┐
                                  │      Plataforma mareIA         │
                                  │  Portal Central / Hub de IGs   │
                                  │  https://mareia.saude.gov.br/  │
                                  └───────────────┬────────────────┘
                  ┌───────────────────────────────┼───────────────────────────────┐
                  ▼                               ▼                               ▼                               ▼
       ┌──────────────────────┐        ┌──────────────────────┐        ┌──────────────────────┐        ┌──────────────────────┐
       │     CardioRemoto     │        │      ATENTO 60+      │        │   FamilIAr_Ativa     │        │       AgroSUS        │
       │    (DM / HAS / CV)   │        │   (Pessoa Idosa APS) │        │ (Cuidados Paliativos)│        │ (Trabalhador Rural)  │
       ├──────────────────────┤        ├──────────────────────┤        ├──────────────────────┤        ├──────────────────────┤
       │ • HULW / UFPB        │        │ • UFPE / UFPB        │        │ • UFPel / CUIDATIVA  │        │ • FATEC Ferraz       │
       │ • IoT PA/Glicemia/FC │        │ • IVCF-20 (Fragilid.)│        │ • ESAS / Zarit / XAI │        │ • Colinesterase/NR-7 │
       │ • Risco 3 níveis     │        │ • Risco Quedas/Sarc. │        │ • Sobrecarga Cuid.   │        │ • Alertas Exposição  │
       │ • Periodicidade 90/30│        │ • Teleintervenção APS│        │ • Apoio Domiciliar   │        │ • Periodicidade Sem. │
       └──────────────────────┘        └──────────────────────┘        └──────────────────────┘        └──────────────────────┘
```

---

## 3. Matriz Comparativa e Interoperabilidade

| Dimensão | CardioRemoto | ATENTO 60+ | FamilIAr_Ativa | AgroSUS |
|---|---|---|---|---|
| **Público-Alvo** | Adultos/idosos com DM e/ou HAS | Pessoas idosas (>= 60 anos) na APS | Pacientes em cuidados paliativos e cuidadores | Trabalhadores rurais expostos a defensivos |
| **Instrumentos Principais** | IoT ANVISA (PA, FC, Glicemia) + Labs | IVCF-20 (Índice Vulnerabilidade Funcional) | ESAS (Sintomas) + Zarit (Sobrecarga) | Anamnese Ocupacional + Colinesterase (NR-7) |
| **Classificação de Risco** | Verde (Controlado) / Amarelo / Vermelho | Robusto / Em Risco / Frágil | Estável / Alerta Leve / Descompensado | Normal / Atenção / Intoxicação Provável |
| **Gatilhos de Alerta** | 4 níveis (Imediato, Semanal, Quinzenal, Sem disparo) | Alerta de fragilização aguda / risco de queda | Alerta de dor aguda, sofrimento e sobrecarga | Alerta de queda enzimática >30% e sintomas agudos |
| **Periodicidade de Monitoramento** | 90 dias (Verde) / 30 dias (Amarelo/Vermelho) | Trimestral / Semestral conforme IVCF-20 | Semanal / Quinzenal conforme ESAS | Semestral / Quadrimestral conforme NR-7 |
| **ID Canônico FHIR** | `br.gov.mareia.cardio` | `br.gov.mareia.atento60` | `br.gov.mareia.familiarativa` | `br.gov.mareia.agrosus` |
| **URL Canônica** | `https://mareia.saude.gov.br/ig/cardio` | `https://mareia.saude.gov.br/ig/atento60` | `https://mareia.saude.gov.br/ig/familiarativa` | `https://mareia.saude.gov.br/ig/agrosus` |

---

## 4. Camada de Compartilhamento (`mareIA-core`)

Todos os 4 IGs compartilham a conformidade com:
1. **Identificadores Nacionais do SUS:** CNS (Cartão Nacional de Saúde), CPF, CNES (Estabelecimento), CBO (Ocupação).
2. **Padrão de Consentimento e Privacidade (LGPD):** Termo de Consentimento Livre e Esclarecido (TCLE) mapeado no recurso `Consent`.
3. **Resiliência Offline-First:** Metadados de sincronização e identificadores universais idempotentes para uso por Agentes de Saúde sem conexão constante à internet.
4. **Integração com AGHUX (EBSERH):** Padrão de troca via FHIR REST API para exportação de encontros e dados vitais.
