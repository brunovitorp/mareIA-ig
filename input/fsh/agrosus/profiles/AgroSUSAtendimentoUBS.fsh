Profile: AgroSUSAtendimentoUBS
Parent: Encounter
Id: agrosus-atendimento-ubs
Title: "Atendimento Clínico da UBS AgroSUS"
Description: "Atendimento realizado na UBS para avaliação, investigação e acompanhamento assistencial do trabalhador rural."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único do atendimento AgroSUS"

* status MS
* class MS

* type 1..* MS
* type ^short = "Tipo de avaliação ou atendimento realizado"

* priority MS

* subject only Reference(AgroSUSPatient)
* subject MS

* participant 1..* MS
* participant.type MS
* participant.period MS
* participant.individual 1..1 MS
* participant.individual only Reference(AgroSUSProfissionalUBSRole)
* participant.individual ^short = "Profissional assistencial responsável pelo atendimento"

* period 1..1 MS
* period ^short = "Período do atendimento"

* reasonCode MS
* reasonReference MS
* reasonReference only Reference(AgroSUSIntoxicacaoPesticida)

* diagnosis MS
* diagnosis.condition only Reference(AgroSUSIntoxicacaoPesticida)
* diagnosis.use MS

* serviceProvider 1..1 MS
* serviceProvider only Reference(AgroSUSUBS)
