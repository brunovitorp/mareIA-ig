# Cookbook — Build & validação do IG

## Gate rápido (sem Java) — SUSHI
```bash
sushi .
```
- Lê `sushi-config.yaml` + `input/fsh/**`.
- Gera `fsh-generated/resources/*.json`.
- **Aceite:** 0 Errors. Warnings revisados.

## Build completo — IG Publisher (requer Java 11+)
```bash
./_updatePublisher.sh   # 1ª vez: baixa input-cache/publisher.jar
./_genonce.sh           # roda SUSHI + IG Publisher
```
- Saída: `output/index.html` e `output/qa.html` (relatório de QA).
- **Aceite:** 0 erros de QA; links e referências resolvidos.

## Diagnóstico
| Sintoma | Causa provável | Ação |
|---|---|---|
| `sushi` acusa código inválido | code com espaço/acentuação | usar code ASCII; display PT-BR |
| Page não encontrada no QA | página listada em `sushi-config` sem arquivo | criar `input/pagecontent/<page>.md` |
| Dependência não baixa | sem rede / versão errada do pacote | revisar `dependencies:` e cache `~/.fhir` |
| `java` ausente | IG Publisher não roda | instalar Temurin/OpenJDK 11+ (ver Hard-Earned Lessons) |

## CI / GitHub Actions
O workflow [`.github/workflows/build-and-publish.yml`](../../.github/workflows/build-and-publish.yml)
compila o IG na imagem oficial **`hl7fhir/ig-publisher-base`** (Java + Ruby/Jekyll + Node + SUSHI) e
publica `output/` no **GitHub Pages**:

- **Gatilho:** push na `main` ou execução manual (`workflow_dispatch`).
- **Job `build`:** `_updatePublisher.sh -y` → `_genonce.sh` → falha se o QA tiver erros →
  `upload-pages-artifact` com `path: output`.
- **Job `deploy`:** `deploy-pages` publica o artefato.

**Pré-requisito (uma vez):** em *Settings → Pages*, definir **Source = GitHub Actions**
(ou via `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`).
Site final: `https://<owner>.github.io/mareIA-ig/`.
