Profile: AgroSUSLaudoLaboratorial
Parent: DiagnosticReport
Id: agrosus-laudo-laboratorial
Title: "Laudo Laboratorial AgroSUS"
Description: "Laudo que agrupa resultados laboratoriais emitidos para o acompanhamento do trabalhador rural no AgroSUS."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único do laudo laboratorial"

* basedOn 1..* MS
* basedOn only Reference(AgroSUSSolicitacaoExame)
* basedOn ^short = "Solicitação de exame atendida pelo laudo"

* status MS
* status ^short = "Situação atual do laudo"

* category 1..* MS
* category ^short = "Categoria laboratorial do laudo"

* code MS
* code from AgroSUSExamesLaboratoriaisVS (extensible)
* code ^short = "Exame ou painel representado pelo laudo"

* subject 1..1 MS
* subject only Reference(AgroSUSPatient)
* subject ^short = "Trabalhador rural ao qual o laudo pertence"

* effective[x] 1..1 MS
* effective[x] ^short = "Data ou período clinicamente relevante"

* issued 1..1 MS
* issued ^short = "Data e hora de liberação do laudo"

* performer 1..* MS
* performer only Reference(AgroSUSLaboratorio)
* performer ^short = "Laboratório responsável pela emissão"

* resultsInterpreter MS
* resultsInterpreter ^short = "Profissional responsável pela interpretação laboratorial"

* result 1..* MS
* result only Reference(AgroSUSResultadoLaboratorial)
* result ^short = "Resultados individuais incluídos no laudo"

* specimen MS
* specimen ^short = "Amostras biológicas utilizadas, quando informadas"

* conclusion MS
* conclusion ^short = "Conclusão textual emitida pelo laboratório"

* conclusionCode MS
* conclusionCode ^short = "Conclusão codificada, quando disponível"

* presentedForm MS
* presentedForm ^short = "Documento original emitido pelo laboratório"
