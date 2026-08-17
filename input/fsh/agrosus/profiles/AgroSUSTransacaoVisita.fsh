Profile: AgroSUSTransacaoVisita
Parent: Bundle
Id: agrosus-transacao-visita
Title: "Transação da Visita do ACS AgroSUS"
Description: "Bundle transacional e idempotente utilizado pelo aplicativo do ACS para sincronizar o paciente, a visita, a resposta da anamnese e sua proveniência em uma única operação atômica."

* type = #transaction
* identifier 1..1 MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* timestamp 1..1 MS
* total 0..0
* link 0..0

* entry 4..4 MS
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    paciente 1..1 MS and
    visita 1..1 MS and
    anamnese 1..1 MS and
    proveniencia 1..1 MS

* entry.fullUrl 1..1 MS
* entry.resource 1..1 MS
* entry.search 0..0
* entry.request 1..1 MS
* entry.request.method = #PUT
* entry.request.url 1..1 MS
* entry.response 0..0

* entry[paciente].resource only AgroSUSPatient
* entry[visita].resource only AgroSUSVisitaACS
* entry[anamnese].resource only AgroSUSAnamneseResponse
* entry[proveniencia].resource only AgroSUSProvenance

* signature MS
