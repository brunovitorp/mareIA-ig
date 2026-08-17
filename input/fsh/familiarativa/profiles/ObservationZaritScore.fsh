// Fonte L1: DAK §5.2 e §6.2. L2: 5-data-dictionary, 6-decision-logic. Itens do ZBI-22: ver ADR-0005.
Profile: FamiliarAtivaObservationZaritScore
Parent: Observation
Id: familiarativa-observation-zarit-score
Title: "Observação — Pontuação e classificação da Escala Zarit"
Description: "Resultado de uma avaliação da Escala Zarit (ZBI-22): pontuação total 0–88 (valueInteger) e classificação (interpretation): Leve (0–20), Moderada (21–40) ou Severa (41–88). O detalhamento item a item vive no QuestionnaireResponse."
* ^status = #active
* status MS
* category = $obs-category#survey
* code = FamiliarAtivaObsCodeCS#zarit-total-score
* code MS
* subject 1..1 MS
* subject only Reference(FamiliarAtivaPatientPalliative)
* subject ^short = "Paciente em cuidados paliativos relacionado à sobrecarga medida"
* focus 1..1 MS
* focus only Reference(FamiliarAtivaRelatedPersonCaregiver)
* focus ^short = "Cuidador avaliado — sobrecarga medida sobre este cuidador (Observation.focus, pois RelatedPerson não é tipo válido para subject em R4)"
* effective[x] 1..1 MS
* value[x] only integer
* valueInteger MS
* valueInteger ^short = "Pontuação total da Zarit (0–88)"
* interpretation 0..1 MS
* interpretation from FamiliarAtivaZaritClassVS (required)
* interpretation ^short = "Classificação: leve / moderada / severa (DAK §6.2)"
