Profile: AgroSUSACS
Parent: PractitionerMareIABase
Id: agrosus-acs
Title: "Agente Comunitário de Saúde AgroSUS"
Description: "Perfil do Agente Comunitário de Saúde ou Técnico em Agente Comunitário de Saúde responsável pela aplicação da anamnese AgroSUS."

* active 1..1 MS
* active ^short = "Indica se o cadastro do profissional está ativo"

* identifier[cns] 1..1 MS
* identifier[cns] ^short = "CNS do profissional responsável pela aplicação"

* identifier[cpf] MS
* identifier[cpf] ^short = "CPF do profissional responsável pela aplicação"

* name 1..* MS
* name ^short = "Nome completo do profissional"

* telecom MS
* telecom ^short = "Meio de contato profissional"
