Profile: PractitionerMareIABase
Parent: Practitioner
Id: mareia-practitioner-base
Title: "Profissional de Saúde Base da Plataforma mareIA"
Description: "Perfil base para profissionais de saúde e agentes comunitários de saúde (ACS) atuantes nos programas de telemonitoramento mareIA."

* identifier 0..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains
    cns 0..1 MS and
    cpf 0..1 MS and
    conselho 0..1 MS and
    identificadorMedico 0..1 MS and
    identificadorEnfermeiro 0..1 MS

* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns] ^short = "CNS do Profissional"

* identifier[cpf].system = "https://receita.fazenda.gov.br/fhir/sid/cpf"
* identifier[cpf] ^short = "CPF do Profissional"

* identifier[conselho].system = "https://saude.gov.br/fhir/sid/conselho-profissional"
* identifier[conselho] ^short = "Registro no Conselho Profissional (CRM, COREN, CRN, etc.)"

* identifier[identificadorMedico].system = "https://saude.gov.br/fhir/sid/crm"
* identifier[identificadorMedico] ^short = "Registro profissional no conselho de medicina (CRM)"

* identifier[identificadorEnfermeiro].system = "https://saude.gov.br/fhir/sid/coren"
* identifier[identificadorEnfermeiro] ^short = "Registro profissional no conselho de enfermagem (COREN)"

* name 1..* MS
* name.text 0..1 MS
* name.family 0..1 MS
* name.given 0..* MS
