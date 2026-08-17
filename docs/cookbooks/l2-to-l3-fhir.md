# Cookbook — L2 (DAK) → L3 (FHIR/FSH)

## Mapeamento
| L2 | L3 (FSH em `input/fsh/`) |
|---|---|
| Personas | `instances/` → `ActorDefinition` |
| Processos | `instances/` → `PlanDefinition` (workflow) + diagrama BPMN em `input/images/` |
| Dicionário de dados | `valuesets/`+`codesystems/` (terminologia), `profiles/` (StructureDefinition), `instances/` (`Questionnaire`) |
| Lógica de decisão | `libraries/` (CQL) + `instances/` (`PlanDefinition` com `action`/`condition`) |
| Indicadores | `instances/` → `Measure` |
| Requisitos | `instances/` → `CapabilityStatement` / `Requirements` |

## Passos (`/fhir-generate`)
1. **Terminologia primeiro:** crie CodeSystems/ValueSets locais (faixas de risco, prioridade de
   alerta, itens IVCF-20). Use LOINC/CID-10 quando existir código padrão.
2. **Questionnaire IVCF-20:** 20 itens, tipo `choice`/`boolean`, com extensão de escore
   (`http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-ordinalValue`) por opção e
   `questionnaire-unitValue`; item calculado para o total e a faixa.
3. **Profiles:** `Observation` para escore IVCF-20 e para cada sinal vital IoT (PA, glicemia,
   SpO2/FC, peso, IMC, temperatura), com LOINC; `Patient` perfil idoso (faixa etária ≥60).
4. **Decisão:** `Library` CQL com a função de escore e estratificação; `PlanDefinition` referencia
   a Library e define ações (classificar, alertar, agendar) com `condition`.
5. **Indicadores:** um `Measure` por indicador (population criteria em CQL/expressão).
6. **Validar incrementalmente:** rode `sushi .` após cada grupo; 0 erros antes de seguir.

## Convenções
- Ids: `atento60-<artefato>` (kebab-case). Ver ADR-0003 (idioma) e `CLAUDE.md` §4.
- Cada FSH inicia com comentário `// Fonte L1: <seção/página>` e `// L2: <componente>`.
