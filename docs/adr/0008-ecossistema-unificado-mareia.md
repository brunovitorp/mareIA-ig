# ADR-0008 — Ecossistema Unificado e Governança da Plataforma mareIA

- **Status:** Aceito (2026-08-17)
- **Decisores:** Equipe de Arquitetura mareIA (UFPB / UFPE / UFPel / FATEC)

## Contexto

A **Plataforma mareIA** (Programa RNP Redes de Colaboração em Saúde Digital 2025) abrange 4 linhas de cuidado distintas operadas por diferentes grupos de pesquisa e instituições:
1. **CardioRemoto** (UFPB / HULW) — DM/HAS e Risco Cardiovascular.
2. **ATENTO 60+** (UFPE / UFPB) — Telemonitoramento da Pessoa Idosa (IVCF-20).
3. **FamilIAr_Ativa** (UFPel / CUIDATIVA) — Cuidados Paliativos Domiciliares (ESAS/Zarit).
4. **AgroSUS** (FATEC Ferraz) — Saúde do Trabalhador Rural (Colinesterase / NR-7).

Havia a necessidade de unificar a governança, a experiência de publicação e as definições transversais (L2 e L3), mantendo a metodologia **WHO SMART Guidelines** e a independência de ciclo de vida de cada linha de cuidado.

## Decisão

Adotar a arquitetura **Hub & Spoke / Multi-Pathway Federado**:

1. **Unidade de Linha de Cuidado (Spokes):** Cada pathway mantém seu repositório e seu Implementation Guide FHIR R4 independente, seguindo a estrutura canônica da OMS (L1 → L2 DAK com 9 componentes → L3 FHIR Shorthand).
2. **Portal Central da Plataforma (Hub):** Criar uma landing page/portal institucional sob `https://mareia.saude.gov.br/ig/` que indexa, apresenta as métricas e fornece acesso direto aos 4 IGs e seus respectivos DAKs.
3. **Padrão Canônico de Nomenclatura e URLs:**
   - Domínio base: `https://mareia.saude.gov.br/ig/`
   - CardioRemoto: `https://mareia.saude.gov.br/ig/cardio` (ID: `br.gov.mareia.cardio`)
   - ATENTO 60+: `https://mareia.saude.gov.br/ig/atento60` (ID: `br.gov.mareia.atento60`)
   - FamilIAr_Ativa: `https://mareia.saude.gov.br/ig/familiarativa` (ID: `br.gov.mareia.familiarativa`)
   - AgroSUS: `https://mareia.saude.gov.br/ig/agrosus` (ID: `br.gov.mareia.agrosus`)
4. **Camada Base Compartilhada (`mareIA-core`):** Perfis comuns de Paciente SUS, Profissional de Saúde, Unidade de Saúde, além de extensões transversais (LGPD, identificador offline e metadados de sincronização) serão compartilhados entre os pathways.
5. **Cross-Navigation:** Todos os IGs conterão links e referências recíprocas no menu e nas páginas de introdução para os demais módulos da Plataforma mareIA.

## Consequências

- (+) **Conformidade Total OMS:** Replica o modelo de sucesso do WHO SMART Guidelines (ex.: `smart-base` + `smart-anc`, `smart-imm`, `smart-fp`).
- (+) **Desacoplamento de Equipes:** Equipes da UFPB, UFPE, UFPel e FATEC podem lançar versões (ex.: `v0.1.0`, `v0.2.0`) sem bloqueios mútuos.
- (+) **Interoperabilidade SUS Digital:** Padrões de identidade (CNS/CPF/IBGE) e conformidade com a RNDS e AGHUX centralizados.
- (+) **Visibilidade Institucional:** Apresentação unificada para a RNP e o Ministério da Saúde em um único portal.
