Instance: agrosus-transacao-visita-exemplo
InstanceOf: AgroSUSTransacaoVisita
Usage: #example
Title: "Exemplo de Transação da Visita do ACS"
Description: "Sincronização atômica e idempotente do paciente, visita, anamnese e proveniência registrados pelo aplicativo do ACS."

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/transacao-visita"
* identifier.value = "TRANSACAO-VISITA-2026-000001"
* type = #transaction
* timestamp = "2026-07-20T09:32:00-03:00"

* entry[paciente].fullUrl = "https://fhir.agrosus.example/Patient/agrosus-patient-example"
* entry[paciente].resource = agrosus-patient-example
* entry[paciente].request.method = #PUT
* entry[paciente].request.url = "Patient/agrosus-patient-example"

* entry[visita].fullUrl = "https://fhir.agrosus.example/Encounter/agrosus-visita-acs-exemplo"
* entry[visita].resource = agrosus-visita-acs-exemplo
* entry[visita].request.method = #PUT
* entry[visita].request.url = "Encounter/agrosus-visita-acs-exemplo"

* entry[anamnese].fullUrl = "https://fhir.agrosus.example/QuestionnaireResponse/agrosus-anamnese-response-example"
* entry[anamnese].resource = agrosus-anamnese-response-example
* entry[anamnese].request.method = #PUT
* entry[anamnese].request.url = "QuestionnaireResponse/agrosus-anamnese-response-example"

* entry[proveniencia].fullUrl = "https://fhir.agrosus.example/Provenance/agrosus-provenance-anamnese-exemplo"
* entry[proveniencia].resource = agrosus-provenance-anamnese-exemplo
* entry[proveniencia].request.method = #PUT
* entry[proveniencia].request.url = "Provenance/agrosus-provenance-anamnese-exemplo"
