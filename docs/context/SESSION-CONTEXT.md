# CONTEXTO GERAL DA SESSÃO — PLATAFORMA mareIA (MASTER IG)

> **Instrução para a IA / Assistente:** Leia este arquivo para recuperar imediatamente todo o contexto do projeto, sua evolução, arquitetura unificada e o estado atual do repositório.

---

## 1. Visão Geral do Projeto
A **Plataforma mareIA** é uma iniciativa aberta no âmbito do **SUS Digital** e do **Programa RNP Redes de Colaboração em Saúde Digital 2025** para telemonitoramento clínico e suporte à decisão assistencial baseado na metodologia **WHO SMART Guidelines** e no padrão **HL7 FHIR R4**.

Originalmente, este repositório continha apenas a linha de cuidado *CardioRemoto* (sob o nome `mareIA-cardio-ig`). Por decisão arquitetural e diretriz do usuário, **todas as 4 linhas de cuidado foram unificadas em um único Master Implementation Guide autônomo e completo**, renomeando o projeto para **`mareIA-ig`**.

---

## 2. Os 4 Pathways Integrados

| Linha de Cuidado | Instituição | Foco & População | Instrumentos Clínicos | Canonical / ID |
|---|---|---|---|---|
| 🫀 **CardioRemoto** | **UFPB / HULW** (João Pessoa/PB) | Diabetes Mellitus (DM2) e Hipertensão (HAS) com risco cardiovascular | IoT ANVISA (PA, FC, Glicemia) + Labs (HbA1c, Lipídios, Creatinina) | `br.gov.mareia.cardio` |
| 🧓 **ATENTO 60+** | **UFPE / UFPB** (Recife/PB) | Telemonitoramento da Pessoa Idosa na APS (ESF) | Escore IVCF-20 (Fragilidade) + Quedas + Sarcopenia | `br.gov.mareia.atento60` |
| 🏡 **FamilIAr_Ativa** | **UFPel / CUIDATIVA** (Pelotas/RS) | Cuidados Paliativos Domiciliares e Apoio ao Cuidador Familiar | Escala ESAS (Sintomas) + Zarit (Sobrecarga) + Predição IA (XAI) | `br.gov.mareia.familiarativa` |
| 🌾 **AgroSUS** | **FATEC Ferraz** (Ferraz de Vasconcelos/SP) | Saúde do Trabalhador Rural e Intoxicações por Defensivos | Anamnese Ocupacional + Vigilância da Colinesterase (NR-7) | `br.gov.mareia.agrosus` |

---

## 3. Estrutura do Repositório

### 3.1 Camada L3 — Recursos Computáveis FHIR R4 (`input/fsh/`)
- `input/fsh/aliases.fsh`: Aliases semânticos globais (LOINC, SCT, UCUM, SDC, CPG).
- `input/fsh/core/`: Perfis base do SUS compartilhados:
  - `PatientMareIABase.fsh` (CNS, CPF, identificador offline UUID).
  - `PractitionerMareIABase.fsh` (CNS, CPF, CRM, COREN, etc.).
  - `BRRacaCor.fsh` (Extensão de raça/cor autodeclarada do SUS/IBGE).
- `input/fsh/cardio/`: Perfis (`PatientCardio`, `ObservationCardio*`), `QuestionnaireCardioTriage`, `PlanDefinitionCardioRemoto`, `Library/CardioLogic`, `Measures`.
- `input/fsh/atento60/`: Perfis (`Atento60PatientElderly`, `ObservationIvcfScore`, `ObservationIotVital`), `QuestionnaireIvcf20` (SDC), `PlanDefinitionAtento60`, `Library/Ivcf20Logic`, `Measures`.
- `input/fsh/familiarativa/`: Perfis (`FamiliarAtivaPatientPalliative`, `RelatedPersonCaregiver`, `ObservationEsas*`, `ObservationZarit*`, `FlagClinicalAlert`), `Questionnaires`, `PlanDefinitionFamiliarAtiva`, `Library`, `Measures`.
- `input/fsh/agrosus/`: Perfis (`AgroSUSPatient`, `AgroSUSACS`, `AgroSUSProfissionalUBS`, `AgroSUSVisitaACS`, `AgroSUSAtendimentoUBS`, `AgroSUSResultadoLaboratorial`, `AgroSUSPlanoAcompanhamento`, `AgroSUSIntoxicacaoPesticida`), `QuestionnaireAgroSUSAnamnese`, `PlanDefinition`, `Library`, `Measures`.

### 3.2 Camada L2 — DAK Consolidado (`input/pagecontent/`)
- `index.md`: Portal de boas-vindas do Master IG Integrado.
- `pathway-cardio.md`, `pathway-atento.md`, `pathway-familiar.md`, `pathway-agrosus.md`: Páginas dedicadas de visão geral de cada linha de cuidado.
- `l2-interventions.md` a `l2-test-scenarios.md`: 9 componentes canônicos do DAK cobrindo todos os 4 domínios.

### 3.3 Governança e Configurações
- `sushi-config.yaml`:
  - `id: br.gov.mareia.ig`
  - `canonical: https://mareia.saude.gov.br/ig`
  - `name: MareIAImplementationGuide`
  - `title: "Plataforma mareIA — SMART Guidelines IG (Guia Integrado de Telemonitoramento)"`
- `ig.ini`: Aponta para `fsh-generated/resources/ImplementationGuide-br.gov.mareia.ig.json`.
- `portal/index.html` e `portal/portal.css`: Hub institucional da plataforma.
- `.github/workflows/build-and-publish.yml`: Pipeline de CI/CD com `hl7fhir/ig-publisher-base:latest`.
- `docs/adr/0008-ecossistema-unificado-mareia.md`: ADR formal da unificação federada.
- `docs/ecosystem/mareia-ecosystem-architecture.md`: Blueprint técnico dos 4 pathways.

---

## 4. Estado da Compilação e Métricas
- **Perfis (StructureDefinitions):** 33
- **Extensões:** 1 (`BRRacaCor`)
- **Conjuntos de Valores (ValueSets):** 45
- **Sistemas de Códigos (CodeSystems):** 30
- **Instâncias:** 87 (incluindo 4 Questionários, 4 PlanDefinitions, 8 Measures)
- **Total de Recursos JSON Exportados:** 196 recursos FHIR R4
- **Resultado do Build SUSHI:** `0 Errors, 0 Warnings` (Clean Build).

---

## 5. Git & Repositório Remoto
- **Remote Origin:** `https://github.com/brunovitorp/mareIA-ig.git`
- **Branch Principal:** `main`
- **Último Commit:** Sincronizado e enviado via `git push origin main`.
- **Nome da pasta local:** `mareIA-cardio-ig` (ou `mareIA-ig` se o usuário renomear no Explorer).

---

## 6. Comandos Úteis
```bash
# Validar e compilar recursos FHIR Shorthand
sushi .

# Gerar site estático com o HL7 IG Publisher (requer Java 11+)
_genonce.bat
```
