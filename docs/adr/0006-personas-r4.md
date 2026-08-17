# ADR-0006 — Representação de personas no L3 (R4 não tem ActorDefinition)

- **Status:** Aceito (2026-06-22)

## Contexto
O mapeamento DAK→FHIR prevê `ActorDefinition` para personas. Porém `ActorDefinition` é um recurso
**FHIR R5**; este IG usa **R4** (ADR-0002, por compatibilidade com a RNDS).

## Decisão
Nesta fase, as personas (componente 2 do DAK) permanecem **documentadas no L2**
(`l2/2-personas.md` / página `l2-personas`). Não serão criados recursos de ator no L3.
O `CapabilityStatement` (kind=requirements) referencia os perfis usados por cada papel.

Quando/se o IG migrar para R5 (ou adotar o template SMART da WHO que define personas via
`ActorDefinition`), criar um `ActorDefinition` por persona, mantendo os ids já reservados
(`patient-elderly`, `chw`, `care-team`, `monitoring-team`, `facility-manager`).

## Consequências
- (+) Evita abuso semântico (ex.: usar `Group` como ator) e mantém o build R4 limpo.
- (−) Atores não aparecem como artefatos navegáveis do IG nesta fase.
