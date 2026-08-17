// Fonte L1: DAK §5.3 (dicionário de alerta) e §6.3 (regras RA-01..RA-05). L2: 5-data-dictionary, 6-decision-logic.
Profile: FamiliarAtivaFlagClinicalAlert
Parent: Flag
Id: familiarativa-flag-clinical-alert
Title: "Alerta clínico (FamilIAr_Ativa)"
Description: "Alerta clínico do módulo FamilIAr_Ativa: ESAS_ALTO (RA-01), ZARIT_SEVERA (RA-02) ou ADESAO_BAIXA (RA-03). Status Aberto=active / Resolvido=inactive; criação em period.start."
* ^status = #active
* status MS
* status ^short = "Aberto (active) | Resolvido (inactive)"
* code MS
* code from FamiliarAtivaAlertTypeVS (required)
* subject 1..1 MS
* subject only Reference(FamiliarAtivaPatientPalliative)
* author MS
* author only Reference(Practitioner)
* author ^short = "Profissional de saúde vinculado (DAK §5.3)"
* period MS
* period.start 1..1 MS
* period.start ^short = "criado_em — criação do alerta (DAK §5.3)"
