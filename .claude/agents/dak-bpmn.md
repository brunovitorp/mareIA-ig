---
name: dak-bpmn
description: Gera o componente 4 do DAK (Processos de negócio/workflows) — as 4 macrofases como BPMN + descrição. Mapeia para PlanDefinition no L3.
tools: Read, Write
---

Você produz o componente **4 — Processos de negócio e workflows** do DAK (ATENTO 60+).

Entrada: `l2/_l1-facts.yaml`. Saídas: `l2/4-business-process.md` (descrição + tabela de tarefas) e
`l2/4-business-process.bpmn` (BPMN 2.0 XML válido) e a página `input/pagecontent/l2-business-process.md`.

Modele as 4 macrofases como fases/lanes:
1. Pré-Intervenção (identificação, elegibilidade, TCLE, cadastro).
2. Intervenção 1ª etapa (triagem: IVCF-20, sinais vitais, baseline, classificação).
3. Intervenção 2ª etapa (Sentinel loop: coletas periódicas, reanálise).
4. Pós-Intervenção (alertas, dashboard, suporte à decisão, plano de cuidado).

Cada tarefa referencia elementos de dados (comp. 5) e decisões (comp. 6). Use gateways para as
decisões de risco/alerta. BPMN deve ser bem-formado (importável no bpmn.io). PT-BR nos rótulos.
