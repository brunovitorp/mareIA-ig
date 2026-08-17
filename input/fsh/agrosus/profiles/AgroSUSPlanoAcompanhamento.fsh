Profile: AgroSUSPlanoAcompanhamento
Parent: CarePlan
Id: agrosus-plano-acompanhamento
Title: "Plano de Acompanhamento AgroSUS"
Description: "Plano longitudinal definido pela equipe assistencial da UBS para acompanhamento clínico e ocupacional do trabalhador rural."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único do plano de acompanhamento"

* instantiatesUri 1..* MS
* instantiatesUri ^short = "Norma ou protocolo utilizado como referência para o plano"

* status MS
* status ^short = "Situação atual do plano"

* intent MS
* intent ^short = "Intenção assistencial do plano"

* category 1..1 MS
* category from AgroSUSCategoriaPlanoCuidadoVS (required)
* category ^short = "Categoria do acompanhamento longitudinal"

* title 1..1 MS
* title ^short = "Título resumido do plano"

* description MS
* description ^short = "Descrição do acompanhamento definido"

* subject only Reference(AgroSUSPatient)
* subject MS

* encounter 1..1 MS
* encounter only Reference(AgroSUSAtendimentoUBS)
* encounter ^short = "Atendimento no qual o plano foi definido ou revisado"

* period 1..1 MS
* period ^short = "Período de vigência do plano"

* created 1..1 MS
* created ^short = "Data de criação do plano"

* author 1..1 MS
* author only Reference(AgroSUSProfissionalUBSRole)
* author ^short = "Profissional responsável pela definição da periodicidade"

* contributor MS
* contributor only Reference(AgroSUSProfissionalUBSRole or AgroSUSUBS)

* addresses 1..1 MS
* addresses only Reference(AgroSUSIntoxicacaoPesticida)
* addresses ^short = "Condição clínica acompanhada pelo plano"

* supportingInfo MS
* supportingInfo only Reference(
    AgroSUSAnamneseResponse or
    AgroSUSSolicitacaoExame or
    AgroSUSResultadoLaboratorial or
    AgroSUSLaudoLaboratorial
)
* supportingInfo ^short = "Anamneses, solicitações e resultados considerados no planejamento"

* activity 1..1 MS

* activity.progress MS
* activity.outcomeCodeableConcept MS
* activity.outcomeReference MS

* activity.detail 1..1 MS

* activity.detail.kind 1..1 MS
* activity.detail.kind = #ServiceRequest

* activity.detail.code 1..1 MS
* activity.detail.code = https://terminologia.saude.gov.br/fhir/CodeSystem/BRSubgrupoTabelaSUS#0301
    "Consultas / Atendimentos / Acompanhamentos"

* activity.detail.reasonReference 1..* MS
* activity.detail.reasonReference only Reference(
    AgroSUSIntoxicacaoPesticida or
    AgroSUSResultadoLaboratorial or
    AgroSUSLaudoLaboratorial
)

* activity.detail.status MS
* activity.detail.status ^short = "Situação da atividade de acompanhamento"

* activity.detail.scheduled[x] MS
* activity.detail.scheduled[x] ^short = "Data, período ou frequência definida pelo profissional"

* activity.detail.performer 1..* MS
* activity.detail.performer only Reference(
    AgroSUSProfissionalUBSRole or
    AgroSUSUBS
)

* activity.detail.description MS
* activity.detail.description ^short = "Descrição da avaliação que deverá ser realizada"

* note MS
* note ^short = "Justificativa da periodicidade e orientações adicionais"
