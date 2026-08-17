# CLAUDE.md — Convenções do repositório mareIA / CardioRemoto

Este repositório é a **adaptação digital** do *Protocolo Clínico CardioRemoto (UFPB/HULW)* para a
metodologia **WHO SMART Guidelines**, cobrindo **um único pathway: CardioRemoto** (pacientes com DM/HAS e risco cardiovascular, HULW/UFPB). Leia este arquivo antes de editar qualquer coisa.

## 1. Primer SMART Guidelines (mínimo necessário)

A OMS organiza diretrizes em 5 camadas de conhecimento (L1–L5). Aqui cobrimos L1→L3:

- **L1 — Narrativa:** o protocolo clínico e requisitos. Fonte-verdade em `sources/`. **Nunca** inventar
  conteúdo clínico que não esteja em L1; lacunas viram pergunta ao usuário/equipe clínica.
- **L2 — DAK (Digital Adaptation Kit):** 9 componentes estruturados, humano-legíveis, em `l2/`.
  São o "contrato" entre clínica e engenharia.
- **L3 — IG FHIR:** artefatos máquina-legíveis (FHIR R4) em `input/fsh/`, compilados por SUSHI.

### Os 9 componentes do DAK (ordem canônica)
1. Intervenções e recomendações de saúde
2. Personas genéricas
3. Cenários de uso
4. Processos de negócio e workflows (BPMN)
5. Elementos de dados centrais (dicionário de dados)
6. Lógica de suporte à decisão (DMN/CQL/Tabelas)
7. Indicadores de programa
8. Requisitos funcionais e não-funcionais
9. Cenários de teste

### Mapeamento L2 → L3 (FHIR)
| Componente L2 | Artefato L3 |
|---|---|
| Personas | Documentadas em L2 / `CapabilityStatement` |
| Processos/workflows | BPMN + `PlanDefinition` |
| Elementos de dados | `Questionnaire`, `StructureDefinition` (profiles), `CodeSystem`/`ValueSet` |
| Lógica de decisão | `Library` (CQL) + `PlanDefinition` |
| Indicadores | `Measure` |
| Requisitos | `CapabilityStatement` + `Requirements` |

## 2. Pipeline agêntico (L1 → L2 → L3)

Produção orientada por skills + subagentes versionados (`.claude/`):

| Etapa | Skill | Subagente(s) | Entrada → Saída |
|---|---|---|---|
| Extrair L1 | `/l1-extract` | `l1-extractor` | `sources/` → `l2/_l1-facts.yaml` |
| Construir DAK | `/dak-build` | `dak-personas`, `dak-user-scenarios`, `dak-bpmn`, `dak-data-dictionary`, `dak-decision-logic`, `dak-indicators`, `dak-requirements` | `_l1-facts.yaml` → `l2/*` + `input/pagecontent/l2-*.md` |
| Gerar FHIR | `/fhir-generate` | `fhir-author` | `l2/*` → `input/fsh/**` |
| Build & validar | `/ig-build` | `ig-validator` | `input/fsh/**` → `fsh-generated/`, `output/` |

**Princípio de rastreabilidade:** todo artefato L2/L3 deve citar a origem em L1
(página/seção do protocolo) num campo `source:` ou comentário.

## 3. Disciplina de documentação (padrão de mercado)

- `docs/prd/` — **PRD**: o que o IG entrega e por quê; critérios de aceite.
- `docs/adr/` — **ADR** (Architecture Decision Records): uma decisão por arquivo.
- `docs/cookbooks/` — receitas passo-a-passo reproduzíveis.
- `docs/hard-earned-lessons.md` — armadilhas e como evitá-las.

## 4. Convenções FHIR/FSH

- `fhirVersion: 4.0.1`. Ids de recurso em `kebab-case` com prefixo do domínio (ex.:
  `Questionnaire/cardio-triage`, `CodeSystem/cardio-risk`).
- **Idioma:** `title`/`description`/`display`/textos em **PT-BR**; nomes técnicos (ids, `name:`)
  em inglês/ASCII (convenção FHIR).
- Vocabulários: **LOINC** para exames/sinais vitais/antropometria, **CID-10** (BR) para diagnósticos.
- Um arquivo FSH por artefato lógico; agrupar por tipo em `input/fsh/<tipo>/`.

## 5. Build

```bash
sushi .                 # FSH → fsh-generated/resources/*.json (deve dar 0 erros)
./_updatePublisher.sh   # baixa o IG Publisher (1ª vez; requer Java 11+)
./_genonce.sh           # gera o site em output/
```
