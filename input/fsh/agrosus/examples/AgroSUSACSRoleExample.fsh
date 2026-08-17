Instance: agrosus-acs-role-exemplo
InstanceOf: AgroSUSACSRole
Usage: #example
Title: "Vínculo profissional do ACS AgroSUS"
Description: "Exemplo sintético do vínculo de um Agente Comunitário de Saúde com uma Unidade Básica de Saúde."

* active = true

* period.start = "2025-01-01"

* practitioner = Reference(agrosus-acs-exemplo)
* practitioner.display = "Maria Clara Oliveira"

* organization = Reference(agrosus-ubs-exemplo)
* organization.display = "UBS Jardim Esperança — Exemplo AgroSUS"

* code = $BRCBO#515105 "Agente comunitário de saúde"