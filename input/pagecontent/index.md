# Plataforma mareIA — SMART Guidelines IG

**Guia de Implementação FHIR R4 Integrado (WHO SMART Guidelines L3)** para o telemonitoramento clínico e suporte à decisão assistencial no âmbito do **SUS Digital** e da **Rede de Colaboração em Saúde Digital (RNP 2025)**.

---

### Visão Geral da Plataforma mareIA

A **Plataforma mareIA** é uma solução aberta, interoperável e baseada em padrões para telemonitoramento ativo de populações prioritárias, integrando dispositivos IoT médicos certificados pela ANVISA, questionários padronizados (HL7 SDC), motores de regras clínicas computáveis (CPG/CQL) e interoperabilidade com prontuários eletrônicos (AGHUX/EBSERH e RNDS).

Este Guia de Implementação unifica as **4 Linhas de Cuidado (Pathways)** desenvolvidas pelas universidades e centros parceiros da rede:

```
                                  ┌────────────────────────────────┐
                                  │      Plataforma mareIA         │
                                  │   Guia Integrado de Saúde      │
                                  └───────────────┬────────────────┘
                  ┌───────────────────────────────┼───────────────────────────────┐
                  ▼                               ▼                               ▼                               ▼
       ┌──────────────────────┐        ┌──────────────────────┐        ┌──────────────────────┐        ┌──────────────────────┐
       │ 🫀 CardioRemoto      │        │ 🧓 ATENTO 60+        │        │ 🏡 FamilIAr_Ativa    │        │ 🌾 AgroSUS           │
       │    (DM / HAS / CV)   │        │   (Pessoa Idosa APS) │        │ (Cuidados Paliativos)│        │ (Trabalhador Rural)  │
       ├──────────────────────┤        ├──────────────────────┤        ├──────────────────────┤        ├──────────────────────┤
       │ • HULW / UFPB        │        │ • UFPE / UFPB        │        │ • UFPel / CUIDATIVA  │        │ • FATEC Ferraz       │
       │ • IoT PA/Glicemia/FC │        │ • IVCF-20 (Fragilid.)│        │ • ESAS / Zarit / XAI │        │ • Colinesterase/NR-7 │
       │ • Risco 3 níveis     │        │ • Risco Quedas/Sarc. │        │ • Sobrecarga Cuid.   │        │ • Alertas Exposição  │
       │ • Periodicidade 90/30│        │ • Teleintervenção APS│        │ • Apoio Domiciliar   │        │ • Periodicidade Sem. │
       └──────────────────────┘        └──────────────────────┘        └──────────────────────┘        └──────────────────────┘
```

---

### As 4 Linhas de Cuidado da Plataforma

| Linha de Cuidado | Instituição | Foco Assistencial & População | Instrumentos Principais | Página do Pathway |
|---|---|---|---|---|
| 🫀 **CardioRemoto** | UFPB / HULW (PB) | DM2, HAS e Risco Cardiovascular Aterosclerótico | IoT ANVISA (PA, FC, Glicemia) + Exames Labs (HbA1c, Lipídios) | [Ver CardioRemoto](pathway-cardio.html) |
| 🧓 **ATENTO 60+** | UFPE / UFPB (PE/PB) | Pessoa Idosa na APS / Estratégia Saúde da Família | IVCF-20 (Índice de Vulnerabilidade Clínico-Funcional) + Sarcopenia | [Ver ATENTO 60+](pathway-atento.html) |
| 🏡 **FamilIAr_Ativa** | UFPel / CUIDATIVA (RS) | Cuidados Paliativos Domiciliares e Apoio ao Cuidador | Escala ESAS (Sintomas) + Zarit (Sobrecarga) + Predição IA (XAI) | [Ver FamilIAr_Ativa](pathway-familiar.html) |
| 🌾 **AgroSUS** | FATEC Ferraz (SP) | Saúde do Trabalhador Rural e Intoxicação por Defensivos | Anamnese Ocupacional + Vigilância da Colinesterase (NR-7) | [Ver AgroSUS](pathway-agrosus.html) |

---

### Camadas SMART Guidelines da OMS

| Camada | O que é | Onde está documentado neste IG |
|---|---|---|
| **L1** | **Narrativa Clínica:** Protocolos clínicos, evidências e diretrizes das comissões médicas. | `sources/` e páginas de Visão Geral de cada Pathway |
| **L2** | **DAK (Digital Adaptation Kit):** 9 componentes estruturados humano-legíveis. | Menu **Componentes DAK (L2)** acima |
| **L3** | **Artefatos FHIR R4:** Perfis, Questionários, PlanDefinitions, Measures e CodeSystems. | Menu **Artefatos Computáveis (L3)** acima |
| **L4** | **Serviços Executáveis:** APIs REST FHIR, conectores IoT e integração com AGHUX. | Mapeados no `CapabilityStatement` |
| **L5** | **Saúde Dinâmica & IA:** Modelos de aprendizado contínuo e explicabilidade (XAI). | Especificados na lógica do FamilIAr_Ativa e CardioRemoto |

---

### Componentes Canônicos do DAK (L2)

* [1. Intervenções e Recomendações de Saúde](l2-interventions.html)
* [2. Personas Genéricas](l2-personas.html)
* [3. Cenários de Uso](l2-user-scenarios.html)
* [4. Processos de Negócio e Workflows (BPMN)](l2-business-process.html)
* [5. Elementos de Dados (Dicionário de Dados)](l2-data-dictionary.html)
* [6. Lógica de Suporte à Decisão](l2-decision-logic.html)
* [7. Indicadores de Programa (Measures)](l2-indicators.html)
* [8. Requisitos Funcionais e Não-Funcionais](l2-requirements.html)
* [9. Cenários e Casos de Teste](l2-test-scenarios.html)
