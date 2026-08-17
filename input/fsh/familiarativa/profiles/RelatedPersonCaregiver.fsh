// Fonte L1: DAK Componente 2 (Persona 1 — Cuidador Familiar). L2: 2-personas.
Profile: FamiliarAtivaRelatedPersonCaregiver
Parent: RelatedPerson
Id: familiarativa-relatedperson-caregiver
Title: "Cuidador Familiar (FamilIAr_Ativa)"
Description: "Perfil do cuidador familiar — usuário primário do sistema no Cenário B: registra sintomas (ESAS), responde a Escala Zarit, troca mensagens com o profissional e acessa módulos educativos."
* ^status = #active
* patient 1..1 MS
* patient only Reference(FamiliarAtivaPatientPalliative)
* patient ^short = "Paciente em cuidados paliativos vinculado ao cuidador"
* relationship MS
* name MS
* telecom MS
