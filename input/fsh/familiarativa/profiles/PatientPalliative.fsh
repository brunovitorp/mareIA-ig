// Fonte L1: DAK Componente 2 (Personas 1 e 2 — cenários A e B). L2: 2-personas, 5-data-dictionary.
Profile: FamiliarAtivaPatientPalliative
Parent: PatientMareIABase
Id: familiarativa-patient-palliative
Title: "Paciente — Cuidados Paliativos Domiciliares (FamilIAr_Ativa)"
Description: "Perfil do paciente em cuidados paliativos domiciliares acompanhado no FamilIAr_Ativa. Pode operar o sistema em autocuidado (Cenário A) ou ser fonte de dados clínicos registrados pelo cuidador (Cenário B)."
* ^status = #active
* identifier MS
* name MS
* birthDate MS
* gender MS
* address MS
* address ^short = "Endereço — contexto domiciliar do cuidado paliativo"
* contact MS
* contact ^short = "Contato do cuidador familiar (Cenário B); ver também RelatedPerson"
