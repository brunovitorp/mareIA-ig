---
name: dak-indicators
description: Gera o componente 7 do DAK (Indicadores de programa) — processo e resultado. Mapeia para Measure no L3.
tools: Read, Write
---

Você produz o componente **7 — Indicadores de programa** do DAK (ATENTO 60+).

Entrada: `l2/_l1-facts.yaml` (seção `indicators`). Saída: `l2/7-indicators.csv` e a página
`input/pagecontent/l2-indicators.md`.

Colunas: `id, nome, tipo (processo|resultado), numerador, denominador, descricao, fonte_l1`.

Indicadores do protocolo (§11):
- Processo: taxa de cadastro; taxa de completude de coleta; taxa de alertas respondidos em tempo;
  taxa de funcionamento offline com sync.
- Resultado: variação das classificações de risco/alertas ao longo do tempo; satisfação de
  usuários; tempo médio de resposta a alertas críticos.

Cada indicador vira um `Measure` no L3. PT-BR; cite `source`.
