// L2: 5-data-dictionary (domínios ESAS). Códigos LOINC conforme DAK §5.1 — REVISAR ADR-0004
// (verificação dos códigos junto à base LOINC/painel ESAS pendente).
ValueSet: FamiliarAtivaEsasLoincVS
Id: familiarativa-esas-loinc-vs
Title: "Domínios ESAS — códigos LOINC (FamilIAr_Ativa)"
Description: "Conjunto de códigos LOINC dos 6 domínios de sintomas do formulário ESAS, conforme o dicionário de dados do DAK (§5.1)."
* ^status = #active
* ^experimental = false
* $loinc#38208-5 "Dor (0–10)"
* $loinc#89443-6 "Dispneia (0–10)"
* $loinc#89444-4 "Ansiedade (0–10)"
* $loinc#89445-1 "Cansaço (0–10)"
* $loinc#89446-9 "Apetite (0–10)"
* $loinc#89447-7 "Bem-estar (0–10)"
