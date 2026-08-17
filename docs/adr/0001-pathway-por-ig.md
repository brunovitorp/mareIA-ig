# ADR-0001 — Um IG por pathway (sem linha de cuidado geral)

- **Status:** Aceito (2026-06-22)
- **Decisores:** Italo (PO) + Claude

## Contexto
O protocolo mareIA (L1) descreve um fluxo clínico geral aplicável a 4 cenários (ATENTO 60+,
CardioRemoto, FamilIAr_Ativa, AgroSUS). No WHO SMART Guidelines, a unidade de publicação é a
**linha de cuidado (pathway)**, normalmente um IG por diretriz/condição.

## Decisão
Cada pathway da mareIA será um **IG/repositório independente**. Este repositório (`mareIA-ig`)
cobre **exclusivamente o ATENTO 60+**. Não haverá um IG de "fluxo geral"; o fluxo comum às
macrofases é incorporado dentro de cada pathway. Os demais cenários serão repos próprios,
reutilizando este como template.

## Consequências
- (+) Aderência ao padrão WHO; publicação e versionamento independentes por pathway.
- (+) Este repo serve de template para os próximos.
- (−) Conteúdo comum (ex.: macrofases, requisitos LGPD) será duplicado/templatizado entre repos.
- Mitigação: extrair, no futuro, um IG-base/pacote compartilhado mareIA caso a duplicação pese.
