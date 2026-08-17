Profile: AgroSUSPatient
Parent: PatientMareIABase
Id: agrosus-patient
Title: "Paciente AgroSUS"
Description: "Perfil do pequeno produtor rural acompanhado pelo módulo AgroSUS no âmbito da Atenção Primária à Saúde, derivado do perfil base da Plataforma mareIA."

* active 1..1 MS
* active ^short = "Situação do cadastro do trabalhador no AgroSUS"

* identifier[cpf] MS
* identifier[cpf] ^short = "CPF do trabalhador rural"

* identifier[cns] MS
* identifier[cns] ^short = "Cartão Nacional de Saúde do trabalhador rural"

* name 1..* MS
* name ^short = "Nome completo do trabalhador rural"

* gender 1..1 MS
* gender ^short = "Sexo administrativo do trabalhador rural"

* birthDate 1..1 MS
* birthDate ^short = "Data de nascimento do trabalhador rural"

* extension contains BRRacaCor named raca 0..1 MS
* extension[raca] ^short = "Raça ou cor autodeclarada"

* telecom MS
* telecom ^short = "Telefone ou outro meio de contato"

* address MS
* address ^short = "Endereço do trabalhador rural"
