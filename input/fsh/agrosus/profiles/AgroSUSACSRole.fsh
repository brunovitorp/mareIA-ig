Profile: AgroSUSACSRole
Parent: PractitionerRole
Id: agrosus-acs-role
Title: "Função do ACS no AgroSUS"
Description: "Perfil do vínculo do Agente Comunitário de Saúde ou Técnico em Agente Comunitário de Saúde com a organização responsável pelo atendimento no AgroSUS."

* active 1..1 MS
* active ^short = "Indica se o vínculo profissional está ativo"

* period 1..1 MS
* period ^short = "Período de validade do vínculo do ACS com a organização"

* practitioner 1..1 MS
* practitioner only Reference(AgroSUSACS)
* practitioner ^short = "ACS ou Técnico em ACS que exerce esta função"

* organization 1..1 MS
* organization only Reference(AgroSUSUBS)
* organization ^short = "UBS à qual o ACS está vinculado"

* code 1..1 MS
* code ^short = "Ocupação do ACS segundo a CBO"
* code from AgroSUSOcupacaoACSVS (required)

* location MS
* location ^short = "Local onde o ACS exerce suas atividades"

* healthcareService MS
* healthcareService ^short = "Serviço de saúde associado à atuação do ACS"

* telecom MS
* telecom ^short = "Contato profissional relacionado ao vínculo"
