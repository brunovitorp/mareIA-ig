---
name: dak-data-dictionary
description: Gera o componente 5 do DAK (Elementos de dados / dicionário) — IVCF-20 (20 itens) e sinais vitais IoT, com codificação LOINC/CID/local.
tools: Read, Write
---

Você produz o componente **5 — Elementos de dados centrais** do DAK (ATENTO 60+).

Entrada: `l2/_l1-facts.yaml` (seção `data_elements`). Saída: `l2/5-data-dictionary.csv` e a página
`input/pagecontent/l2-data-dictionary.md`.

Colunas do CSV: `id, rotulo_ptbr, componente_dak, tipo, valores_ou_unidade, sistema_codigo,
codigo, obrigatorio, fonte_l1`.

Inclua:
- Os **20 itens do IVCF-20** (idade, autopercepção, AVD instrumental/básica, cognição, humor,
  mobilidade, comunicação, comorbidades) com seus pesos e o item-escore-total + faixa.
- **Sinais vitais IoT**: PA sistólica/diastólica (mmHg), glicemia capilar (mg/dL), SpO2 (%), FC
  (bpm), peso (kg), estatura (cm)→IMC, temperatura (°C) — com código **LOINC**.
- Campos de elegibilidade/cadastro relevantes (idade ≥60, cadastro USF).

Para faixas/escore use CodeSystem local (ver ADR-0004). LOINC para sinais vitais. PT-BR nos rótulos.
