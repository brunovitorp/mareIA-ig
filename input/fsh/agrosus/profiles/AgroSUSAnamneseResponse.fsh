Profile: AgroSUSAnamneseResponse
Parent: QuestionnaireResponse
Id: agrosus-anamnese-response
Title: "Resposta da Anamnese AgroSUS"
Description: "Perfil da resposta ao formulário de anamnese ocupacional e ambiental AgroSUS aplicado pelo Agente Comunitário de Saúde."

* identifier 1..1 MS
* identifier ^short = "Identificador único da aplicação da anamnese"
* identifier.system 1..1
* identifier.value 1..1

* questionnaire 1..1 MS
* questionnaire = Canonical(agrosus-anamnese)

* status 1..1 MS
* status ^short = "Situação de preenchimento da anamnese"

* subject 1..1 MS
* subject only Reference(AgroSUSPatient)
* subject ^short = "Trabalhador rural ao qual a anamnese se refere"

* encounter 0..1 MS
* encounter only Reference(AgroSUSVisitaACS)
* encounter ^short = "Visita do ACS em que a anamnese foi aplicada"

* authored 1..1 MS
* authored ^short = "Data e hora do registro das respostas"

* author 1..1 MS
* author only Reference(AgroSUSACSRole)
* author ^short = "Vínculo profissional do ACS responsável pelo registro"

* source 1..1 MS
* source only Reference(AgroSUSPatient or RelatedPerson)
* source ^short = "Trabalhador ou responsável que forneceu as informações"

* item 1..* MS
* item ^short = "Respostas correspondentes aos itens da anamnese AgroSUS"
