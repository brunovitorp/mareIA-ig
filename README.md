# mareIA — CardioRemoto · WHO SMART Guidelines IG

Implementation Guide (FHIR R4) da **linha de cuidado CardioRemoto** da Plataforma mareIA —
telemonitoramento de pacientes com **Diabetes Mellitus (DM)** e/ou **Hipertensão Arterial Sistêmica (HAS)**
com fatores de risco cardiovascular aterosclerótico, no âmbito do **Ambulatório de Telessaúde da Endocrinologia do Hospital Universitário Lauro Wanderley (HULW / UFPB)**, João Pessoa/PB.

Este repositório é a **adaptação digital** do *Protocolo Clínico CardioRemoto (UFPB/HULW)* — a
camada **L1 (Narrativa)** do [WHO SMART Guidelines](https://www.who.int/teams/digital-health-and-innovation/smart-guidelines) —
para as camadas **L2 (DAK — Digital Adaptation Kit)** e **L3 (IG FHIR, máquina-legível)**.

> No SMART Guidelines, **cada linha de cuidado (pathway) é um IG separado**. Este repo cobre
> **somente o CardioRemoto**. Os demais cenários da mareIA (ATENTO 60+, FamilIAr_Ativa, AgroSUS)
> possuem repositórios próprios.

## Camadas SMART Guidelines

| Camada | O que é | Onde está |
|---|---|---|
| **L1** | Narrativa (protocolo clínico) | `sources/` (documentos originais + texto extraído) |
| **L2** | DAK — 9 componentes estruturados | `l2/` (fonte) + `input/pagecontent/l2-*.md` (narrativa do IG) |
| **L3** | Artefatos FHIR (FSH) | `input/fsh/**` → compilado para `fsh-generated/` |

## Estrutura

```
sources/      → L1: protocolo (fonte-verdade clínica UFPB/HULW)
l2/           → L2: DAK estruturado (CSV/BPMN/MD/YAML)
input/fsh/    → L3: FHIR Shorthand (profiles, instances, valuesets, libraries)
input/pagecontent/ → narrativa do IG publicado
docs/         → disciplina agentic-dev: PRD, ADRs, cookbooks, Hard-Earned Lessons
.claude/      → camada executável: subagentes (agents/) e skills/
```

## Build

```bash
# 1. Compilar FSH → recursos FHIR JSON
sushi .

# 2. Gerar o site do IG (requer Java 11+; baixa o IG Publisher na 1ª vez)
./_genonce.sh      # Linux/macOS
_genonce.bat       # Windows
```

Saída em `output/index.html` (ou `output/en/index.html`).

## Status

`draft` v0.1.0 — fase WP1 (UFPB/HULW). Programa RNP Redes de Colaboração em Saúde Digital 2025.

## Licença

CC-BY-SA-4.0 (conteúdo).
