# Cookbook — L1 (narrativa) → L2 (DAK)

Receita para converter o protocolo clínico em componentes estruturados do DAK.

## Pré-requisitos
- `sources/_protocolo_extract.txt` (texto extraído do PDF).
- Skill `/l1-extract` e subagentes `dak-*` disponíveis em `.claude/`.

## Passos
1. **Extrair fatos L1** (`/l1-extract`): normalize o protocolo em `l2/_l1-facts.yaml` com seções:
   `recommendations`, `actors`, `data_elements`, `decision_rules`, `indicators`, `requirements`,
   cada item com `source` (página/seção do PDF).
2. **Personas** (`dak-personas` → `l2/2-personas.md`): para cada ator, defina papel, sistema/acesso,
   competências, e o que faz no fluxo. Mapeie 1:1 para `ActorDefinition` no L3.
3. **Cenários de uso** (`l2/3-user-scenarios.md`): narrativas curtas "como <persona>, eu...".
4. **Processos/BPMN** (`dak-bpmn` → `l2/4-business-process.*`): modele as 4 macrofases como pools/
   lanes; cada tarefa referencia dados (comp. 5) e decisões (comp. 6).
5. **Dicionário de dados** (`dak-data-dictionary` → `l2/5-data-dictionary.csv`): uma linha por
   elemento (id, rótulo PT-BR, tipo, valores/unidade, código LOINC/CID/local, obrigatório, fonte).
   Inclua os 20 itens do IVCF-20 e os sinais vitais IoT.
6. **Lógica de decisão** (`dak-decision-logic` → `l2/6-decision-logic.*`): tabelas de decisão
   (entradas → saída). Inclua: cálculo do escore IVCF-20, faixas de risco, gatilhos de alerta,
   periodicidade. Marque pendências com referência a ADR-0004/0005.
7. **Indicadores** (`dak-indicators` → `l2/7-indicators.csv`): id, nome, numerador, denominador,
   tipo (processo/resultado), fonte.
8. **Requisitos** (`dak-requirements` → `l2/8-requirements.md`): RF e RNF com id, prioridade, fonte.
9. **Cenários de teste** (`l2/9-test-scenarios.md`): casos-limite de escore e de alerta.

## Saída
- `l2/*` (fonte estruturada) + `input/pagecontent/l2-*.md` (narrativa publicável do IG).

## Regras
- **Fidelidade > completude:** não acrescente conteúdo clínico ausente em L1.
- **Rastreabilidade:** todo item carrega `source`.
- **Ambiguidade → ADR** (status proposto) + pergunta, nunca suposição silenciosa.
