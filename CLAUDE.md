# CLAUDE.md — Convenções do repositório mareIA (WHO SMART Guidelines Master IG)

Este repositório é o **Guia de Implementação FHIR R4 Integrado** da **Plataforma mareIA**, consolidando as 4 linhas de cuidado no SUS sob a metodologia **WHO SMART Guidelines**:
1. **CardioRemoto** (DM/HAS e Risco Cardiovascular — UFPB/HULW)
2. **ATENTO 60+** (Telemonitoramento da Pessoa Idosa — UFPE/UFPB)
3. **FamilIAr_Ativa** (Cuidados Paliativos Domiciliares — UFPel/CUIDATIVA)
4. **AgroSUS** (Saúde do Trabalhador Rural — FATEC Ferraz)

---

## 1. Primer SMART Guidelines (L1 → L5)

- **L1 — Narrativa:** Protocolos clínicos e fontes-verdade em `sources/` e páginas de pathway.
- **L2 — DAK (Digital Adaptation Kit):** 9 componentes estruturados em `l2/` e `input/pagecontent/l2-*.md`.
- **L3 — IG FHIR:** Artefatos computáveis em `input/fsh/**`, compilados pelo SUSHI para `fsh-generated/`.
- **L4 — Executável:** Serviços REST FHIR, conectores IoT e integração com AGHUX/EBSERH.
- **L5 — Dinâmico:** Aprendizado contínuo, predição e inteligência artificial explicável (XAI).

---

## 2. Estrutura Modular de Arquivos FSH

```
input/fsh/
├── aliases.fsh         → Aliases globais (LOINC, SCT, UCUM, SDC, CPG)
├── core/               → Perfis compartilhados SUS (PatientMareIABase, PractitionerMareIABase, BRRacaCor)
├── cardio/             → Perfis vitais/labs/risco, Questionário de triagem, PlanDefinition, Measures Cardio
├── atento60/           → Perfis idoso/fragilidade, Questionário IVCF-20, PlanDefinition, Measures ATENTO
├── familiarativa/      → Perfis paliativos/cuidador, Questionários ESAS/Zarit, PlanDefinition, Measures
└── agrosus/            → Perfis rural/toxicologia, Anamnese ocupacional, Colinesterase, Measures
```

---

## 3. Disciplina de Documentação

- `docs/prd/` — PRD da plataforma e critérios de aceite.
- `docs/adr/` — Architecture Decision Records (ADR-0001 a ADR-0008).
- `docs/ecosystem/` — Blueprint e matriz de interoperabilidade dos 4 pathways.
- `docs/cookbooks/` — Receitas de build, extração e deploy unificado.
- `portal/` — Landing page institucional do Hub mareIA.

---

## 4. Build e Validação

```bash
sushi .                 # FSH → JSON em fsh-generated/ (DEVE DAR 0 ERROS)
_genonce.bat            # Executa o IG Publisher da HL7 e gera o site em output/
```
