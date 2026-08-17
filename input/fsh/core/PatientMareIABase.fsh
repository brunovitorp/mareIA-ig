Profile: PatientMareIABase
Parent: Patient
Id: mareia-patient-base
Title: "Paciente Base da Plataforma mareIA"
Description: "Perfil base de Paciente SUS compartilhado entre todas as linhas de cuidado da Plataforma mareIA (CardioRemoto, ATENTO 60+, FamilIAr_Ativa e AgroSUS), garantindo conformidade com a RNDS e suporte a identificadores nacionais e funcionamento offline-first."

* identifier 0..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slicing para identificadores do SUS (CNS, CPF, Local)"

* identifier contains
    cns 0..1 MS and
    cpf 0..1 MS and
    offlineSyncId 0..1 MS

* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns].value 1..1 MS
* identifier[cns] ^short = "Cartão Nacional de Saúde (CNS)"

* identifier[cpf].system = "https://receita.fazenda.gov.br/fhir/sid/cpf"
* identifier[cpf].value 1..1 MS
* identifier[cpf] ^short = "Cadastro de Pessoas Físicas (CPF)"

* identifier[offlineSyncId].system = "https://mareia.saude.gov.br/fhir/sid/offline-id"
* identifier[offlineSyncId].value 1..1 MS
* identifier[offlineSyncId] ^short = "Identificador temporário de sincronização offline-first"

* name 1..* MS
* name.text 0..1 MS
* name.family 0..1 MS
* name.given 0..* MS
* gender 1..1 MS
* birthDate 1..1 MS
