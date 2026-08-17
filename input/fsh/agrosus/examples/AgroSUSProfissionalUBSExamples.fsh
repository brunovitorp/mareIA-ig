// Médico da Estratégia de Saúde da Família

Instance: agrosus-profissional-medico-exemplo
InstanceOf: AgroSUSProfissionalUBS
Usage: #example
Title: "Exemplo de Médico da UBS AgroSUS"
Description: "Médico fictício da Estratégia de Saúde da Família."

* language = #pt-BR
* active = true

* identifier[cns].use = #official
* identifier[cns].type = http://terminology.hl7.org/CodeSystem/v2-0203#HC
* identifier[cns].type.text = "Cartão Nacional de Saúde"
* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns].value = "200000000000003"

* name[0].use = #official
* name[0].text = "Eduardo Henrique Almeida"
* name[0].given[0] = "Eduardo"
* name[0].given[1] = "Henrique"
* name[0].family = "Almeida"


Instance: agrosus-profissional-medico-role-exemplo
InstanceOf: AgroSUSProfissionalUBSRole
Usage: #example
Title: "Exemplo de Vínculo do Médico com a UBS"
Description: "Vínculo fictício do médico da Estratégia de Saúde da Família com a UBS."

* active = true
* period.start = "2025-01-01"

* practitioner = Reference(agrosus-profissional-medico-exemplo)
* practitioner.display = "Eduardo Henrique Almeida"

* organization = Reference(agrosus-ubs-exemplo)
* organization.display = "UBS Jardim Esperança — Exemplo AgroSUS"

* code = $BRCBO#225142 "Médico da estratégia de saúde da família"


// Enfermeira

Instance: agrosus-profissional-enfermeiro-exemplo
InstanceOf: AgroSUSProfissionalUBS
Usage: #example
Title: "Exemplo de Enfermeira da UBS AgroSUS"
Description: "Enfermeira fictícia responsável pelo acompanhamento dos trabalhadores rurais."

* language = #pt-BR
* active = true

* identifier[cns].use = #official
* identifier[cns].type = http://terminology.hl7.org/CodeSystem/v2-0203#HC
* identifier[cns].type.text = "Cartão Nacional de Saúde"
* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns].value = "700000000000005"

* name[0].use = #official
* name[0].text = "Juliana Martins Costa"
* name[0].given[0] = "Juliana"
* name[0].given[1] = "Martins"
* name[0].family = "Costa"


Instance: agrosus-profissional-enfermeiro-role-exemplo
InstanceOf: AgroSUSProfissionalUBSRole
Usage: #example
Title: "Exemplo de Vínculo da Enfermeira com a UBS"
Description: "Vínculo fictício da enfermeira com a UBS responsável pelo acompanhamento AgroSUS."

* active = true
* period.start = "2025-01-01"

* practitioner = Reference(agrosus-profissional-enfermeiro-exemplo)
* practitioner.display = "Juliana Martins Costa"

* organization = Reference(agrosus-ubs-exemplo)
* organization.display = "UBS Jardim Esperança — Exemplo AgroSUS"

* code = $BRCBO#223505 "Enfermeiro"


// Técnico de enfermagem

Instance: agrosus-profissional-tecnico-enfermagem-exemplo
InstanceOf: AgroSUSProfissionalUBS
Usage: #example
Title: "Exemplo de Técnico de Enfermagem da UBS AgroSUS"
Description: "Técnico de enfermagem fictício da equipe assistencial da UBS."

* language = #pt-BR
* active = true

* identifier[cns].use = #official
* identifier[cns].type = http://terminology.hl7.org/CodeSystem/v2-0203#HC
* identifier[cns].type.text = "Cartão Nacional de Saúde"
* identifier[cns].system = "https://saude.gov.br/fhir/sid/cns"
* identifier[cns].value = "800000000000001"

* name[0].use = #official
* name[0].text = "Rafael dos Santos Lima"
* name[0].given[0] = "Rafael"
* name[0].given[1] = "dos Santos"
* name[0].family = "Lima"


Instance: agrosus-profissional-tecnico-enfermagem-role-exemplo
InstanceOf: AgroSUSProfissionalUBSRole
Usage: #example
Title: "Exemplo de Vínculo do Técnico de Enfermagem"
Description: "Vínculo fictício do técnico de enfermagem com a UBS."

* active = true
* period.start = "2025-01-01"

* practitioner = Reference(agrosus-profissional-tecnico-enfermagem-exemplo)
* practitioner.display = "Rafael dos Santos Lima"

* organization = Reference(agrosus-ubs-exemplo)
* organization.display = "UBS Jardim Esperança — Exemplo AgroSUS"

* code = $BRCBO#322205 "Técnico de enfermagem"