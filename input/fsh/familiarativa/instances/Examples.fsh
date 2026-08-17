// Exemplos — ilustram os perfis e os Cenários 1 e 2 do DAK (Componente 3) e os casos de teste
// TC-03 (ESAS Alto) e TC-06 (Zarit Severa). L2: 3-user-scenarios, 9-test-scenarios.

Instance: familiarativa-patient-example
InstanceOf: FamiliarAtivaPatientPalliative
Usage: #example
Title: "Exemplo — Paciente em cuidados paliativos (Maria)"
Description: "Paciente oncológica em cuidados paliativos domiciliares, acompanhada pelo filho João (Cenário 1 do DAK)."
* name.text = "Maria de Exemplo"
* name.family = "de Exemplo"
* name.given = "Maria"
* gender = #female
* birthDate = "1952-05-20"

Instance: familiarativa-caregiver-example
InstanceOf: FamiliarAtivaRelatedPersonCaregiver
Usage: #example
Title: "Exemplo — Cuidador familiar (João)"
Description: "João, cuidador de sua mãe Maria; usuário primário do sistema no Cenário B."
* patient = Reference(familiarativa-patient-example)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#SONC "son"
* name.text = "João de Exemplo"
* name.family = "de Exemplo"
* name.given = "João"

Instance: familiarativa-esas-dor-example
InstanceOf: FamiliarAtivaObservationEsasSymptom
Usage: #example
Title: "Exemplo — Sintoma ESAS: dor nível 8"
Description: "Registro do domínio dor (LOINC 38208-5) com intensidade 8, do Cenário 1 do DAK."
* status = #final
* category = $obs-category#survey
* code = $loinc#38208-5
* subject = Reference(familiarativa-patient-example)
* effectiveDateTime = "2026-07-01T09:00:00Z"
* valueInteger = 8

Instance: familiarativa-esas-score-example
InstanceOf: FamiliarAtivaObservationEsasScore
Usage: #example
Title: "Exemplo — Soma ESAS 52 → risco Alto (Cenário 1 / TC-03)"
Description: "Registro ESAS com soma 52 (dor 8, dispneia 7 e demais domínios) classificado como risco Alto: orientação ao cuidador, alerta e notificação ao profissional (RA-01/RA-05)."
* status = #final
* code = FamiliarAtivaObsCodeCS#esas-total-score
* subject = Reference(familiarativa-patient-example)
* effectiveDateTime = "2026-07-01T09:00:00Z"
* valueInteger = 52
* component[nivelRisco].code = FamiliarAtivaObsCodeCS#esas-nivel-risco
* component[nivelRisco].valueCodeableConcept = FamiliarAtivaEsasRiskCS#alto "Alto"

Instance: familiarativa-zarit-score-example
InstanceOf: FamiliarAtivaObservationZaritScore
Usage: #example
Title: "Exemplo — Zarit 64 → Sobrecarga Severa (Cenário 2 / TC-06)"
Description: "Avaliação Zarit do cuidador João com pontuação 64, classificada como Sobrecarga Severa; notificação ao profissional vinculado (RA-02)."
* status = #final
* category = $obs-category#survey
* code = FamiliarAtivaObsCodeCS#zarit-total-score
* subject = Reference(familiarativa-patient-example)
* focus = Reference(familiarativa-caregiver-example)
* effectiveDateTime = "2026-07-05T10:30:00Z"
* valueInteger = 64
* interpretation = FamiliarAtivaZaritClassCS#severa "Sobrecarga severa"

Instance: familiarativa-flag-esas-alto-example
InstanceOf: FamiliarAtivaFlagClinicalAlert
Usage: #example
Title: "Exemplo — Alerta ESAS_ALTO aberto"
Description: "Alerta gerado pela regra RA-01 (soma ESAS > 50) para a paciente Maria; status Aberto (active) até resolução com anotação clínica (BP-03)."
* status = #active
* code = FamiliarAtivaAlertTypeCS#esas-alto "ESAS_ALTO"
* subject = Reference(familiarativa-patient-example)
* period.start = "2026-07-01T09:00:05Z"
