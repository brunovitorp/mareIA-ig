# ADR-0007 — Migração para fhir2.base.template

- **Status:** Aceito (2026-06-22)
- **Supersede:** a escolha de template de [ADR-0002](0002-stack-fhir-sushi.md) (`fhir.base.template`).

## Contexto
O IG Publisher passou a emitir o aviso:
> "This content depends on fhir.base.template which is no longer considered secure to use"
referente à [notificação de segurança 2026-03](https://www.fhir.org/guides/security-notices/2026-03-npm-dependencies.html).
A nota recomenda fortemente migrar para o novo template multilíngue **`fhir2.base.template`**,
e avisa que o IG Publisher passará a **recusar** IGs com o template antigo.

## Decisão
Trocar em `ig.ini`:
```
template = fhir2.base.template#current
```
(de `fhir.base.template#current`).

## Consequências
- (+) Remove o aviso de segurança; alinha com o template suportado e multilíngue (útil ao PT-BR).
- (+) Build validado: SUSHI 0 erros; IG Publisher **0 erros, 0 links quebrados** (9 warnings benignos).
- (~) Sem mudança nos artefatos FSH; apenas o template de apresentação muda.
- A migração futura para o template **SMART da WHO** (mencionada na ADR-0002) continua possível.
