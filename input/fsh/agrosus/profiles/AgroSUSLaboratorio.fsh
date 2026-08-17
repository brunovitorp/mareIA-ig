Profile: AgroSUSLaboratorio
Parent: Organization
Id: agrosus-laboratorio
Title: "Laboratório AgroSUS"
Description: "Organização responsável pela realização e emissão de resultados de exames laboratoriais utilizados no AgroSUS."

* active 1..1 MS
* active ^short = "Indica se o laboratório está ativo"

* identifier 0..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains
    cnes 0..1 MS and
    cnpj 0..1 MS

* identifier[cnes].system = "https://saude.gov.br/fhir/sid/cnes"
* identifier[cnes] ^short = "Identificador CNES do laboratório"

* identifier[cnpj].system = "https://receita.fazenda.gov.br/fhir/sid/cnpj"
* identifier[cnpj] ^short = "CNPJ do laboratório, quando aplicável"

* name 1..1 MS
* name ^short = "Nome oficial do laboratório"

* type MS
* type ^short = "Tipo de estabelecimento laboratorial"

* telecom MS
* telecom ^short = "Contato institucional do laboratório"

* address MS
* address ^short = "Endereço do laboratório"
