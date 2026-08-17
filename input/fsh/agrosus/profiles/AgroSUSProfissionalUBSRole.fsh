Profile: AgroSUSProfissionalUBSRole
Parent: PractitionerRole
Id: agrosus-profissional-ubs-role
Title: "Função do Profissional Assistencial da UBS AgroSUS"
Description: "Vínculo funcional do profissional assistencial com a UBS responsável pelo acompanhamento do trabalhador rural no AgroSUS."

* active 1..1 MS
* active ^short = "Indica se o vínculo profissional está ativo"

* period 1..1 MS
* period ^short = "Período de validade do vínculo com a UBS"

* practitioner 1..1 MS
* practitioner only Reference(AgroSUSProfissionalUBS)
* practitioner ^short = "Profissional assistencial que exerce a função"

* organization 1..1 MS
* organization only Reference(AgroSUSUBS)
* organization ^short = "UBS onde o profissional exerce suas atividades"

* code 1..1 MS
* code from AgroSUSOcupacaoProfissionalUBSVS (required)
* code ^short = "Ocupação do profissional segundo a CBO"

* location MS
* location ^short = "Local onde o profissional exerce suas atividades"

* healthcareService MS
* healthcareService ^short = "Serviço de saúde associado ao vínculo"

* telecom MS
* telecom ^short = "Contato relacionado ao vínculo profissional"
