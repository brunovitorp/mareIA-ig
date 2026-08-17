Profile: AgroSUSResultadoLaboratorial
Parent: Observation
Id: agrosus-resultado-laboratorial
Title: "Resultado Laboratorial AgroSUS"
Description: "Resultado individual de exame ou biomarcador laboratorial utilizado no acompanhamento do trabalhador rural."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único do resultado laboratorial"

* basedOn 1..* MS
* basedOn only Reference(AgroSUSSolicitacaoExame)
* basedOn ^short = "Solicitação que originou o resultado"

* status MS
* status ^short = "Situação do resultado laboratorial"

* category 1..* MS
* category ^short = "Categoria laboratorial da observação"

* code MS
* code from AgroSUSResultadosLaboratoriaisVS (extensible)
* code ^short = "Biomarcador ou analito medido"

* subject 1..1 MS
* subject only Reference(AgroSUSPatient)
* subject ^short = "Trabalhador rural ao qual o resultado pertence"

* effective[x] 1..1 MS
* effective[x] ^short = "Data e hora clinicamente relevante do resultado"

* issued 1..1 MS
* issued ^short = "Data e hora de liberação do resultado"

* performer 1..* MS
* performer only Reference(AgroSUSLaboratorio)
* performer ^short = "Laboratório responsável pelo resultado"

* value[x] MS
* value[x] only Quantity or CodeableConcept or string
* value[x] ^short = "Valor do resultado laboratorial"

* dataAbsentReason MS
* dataAbsentReason ^short = "Motivo da ausência do valor, quando aplicável"

* interpretation MS
* interpretation ^short = "Interpretação laboratorial do resultado"

* referenceRange MS
* referenceRange ^short = "Intervalo de referência informado pelo laboratório"

* specimen MS
* specimen ^short = "Amostra biológica utilizada, quando informada"

* note MS
* note ^short = "Observações do laboratório"
