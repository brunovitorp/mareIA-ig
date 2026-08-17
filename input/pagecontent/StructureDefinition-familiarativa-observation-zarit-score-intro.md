**Uso.** Registra o **resultado de uma avaliação da Escala Zarit (ZBI-22)**: pontuação total
0–88 (`valueInteger`) e classificação (`interpretation`): Leve (0–20), Moderada (21–40) ou
Severa (41–88). Produzido após a resposta ao `Questionnaire/familiarativa-zarit` (BP-02).

**Escopo.** Uma observação por avaliação periódica (padrão mensal; semanal se Severa na última
avaliação). O dado mede a **sobrecarga do cuidador**, não do paciente — mas como
`Observation.subject` no FHIR R4 base só aceita `Patient | Group | Device | Location`
(`RelatedPerson` não é um tipo permitido), o cuidador avaliado é referenciado em `focus`, e
`subject` aponta ao paciente em cuidados paliativos relacionado (ver nota de modelagem abaixo).
Fora de escopo: as respostas item a item, que vivem no `QuestionnaireResponse` (itens do ZBI-22
sob licença — ver **ADR-0005**).

**Identificadores.** `code` fixo `familiarativa-obs-code#zarit-total-score`; `subject` (1..1) →
`FamiliarAtivaPatientPalliative`; `focus` (1..1) → `FamiliarAtivaRelatedPersonCaregiver`
(cuidador cuja sobrecarga está sendo medida); `effective[x]` e `valueInteger` *must-support*.
`interpretation` ligado (*required*) ao ValueSet `familiarativa-zarit-class-vs`
(`leve` · `moderada` · `severa`) — classificação Severa dispara RA-02.

> **Nota de modelagem.** Uma tentativa inicial usou `subject` = cuidador diretamente, mas o SUSHI
> rejeita essa referência por violar a lista de tipos permitidos em `Observation.subject` no R4.
> `focus` foi desenhado no FHIR justamente para "quando o foco da observação não é o `subject`" —
> uso adequado aqui, já que o `subject` formal (paciente) e o foco real da medição (cuidador) são
> pessoas diferentes.

**Extensões.** **Sem extensões próprias.** A classificação usa o elemento padrão
`Observation.interpretation`, evitando componente/extensão adicionais.

*Fonte L1: DAK FamilIAr_Ativa, §5.2 e §6.2.*
