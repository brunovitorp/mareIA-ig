Instance: agrosus-server-capabilities
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Requisitos de capacidade do servidor AgroSUS"
Description: "Contrato mínimo da API FHIR R4 do AgroSUS para o aplicativo do ACS, o dashboard da UBS e os sistemas laboratoriais."

* url = "https://jefersonrl.github.io/AgroSUS-FHIR/CapabilityStatement/agrosus-server-capabilities"
* version = "0.1.0"
* name = "AgroSUSServerCapabilities"
* title = "Requisitos de capacidade do servidor AgroSUS"
* status = #draft
* experimental = true
* date = "2026-07-20"
* publisher = "Fatec Ferraz de Vasconcelos"
* description = "Define os recursos, interações, pesquisas e transações que devem ser suportados por uma implementação de servidor compatível com o AgroSUS."
* jurisdiction = urn:iso:std:iso:3166#BR "Brazil"
* kind = #requirements
* implementationGuide = "https://jefersonrl.github.io/AgroSUS-FHIR/ImplementationGuide/io.github.jefersonrl.agrosus"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml

* rest[0].mode = #server
* rest[0].documentation = "API FHIR R4 para cadastro e acompanhamento longitudinal do trabalhador rural. O aplicativo do ACS deve enviar a visita por Bundle transaction; o dashboard da UBS consulta os dados pelos parâmetros declarados neste CapabilityStatement."
* rest[0].security.cors = true
* rest[0].security.description = "A implementação deve utilizar TLS, autenticação, autorização por função e registro de auditoria. CORS deve ser limitado às origens autorizadas em produção."
* rest[0].interaction[0].code = #transaction
* rest[0].interaction[0].documentation = "Aceita a transação AgroSUS de sincronização da visita do ACS de forma atômica."

// 0 - Patient
* rest[0].resource[0].type = #Patient
* rest[0].resource[0].profile = Canonical(AgroSUSPatient)
* rest[0].resource[0].interaction[0].code = #create
* rest[0].resource[0].interaction[1].code = #read
* rest[0].resource[0].interaction[2].code = #update
* rest[0].resource[0].interaction[3].code = #search-type
* rest[0].resource[0].versioning = #versioned-update
* rest[0].resource[0].updateCreate = true
* rest[0].resource[0].conditionalCreate = true
* rest[0].resource[0].conditionalUpdate = true
* rest[0].resource[0].referencePolicy[0] = #literal
* rest[0].resource[0].referencePolicy[1] = #local
* rest[0].resource[0].searchParam[0].name = "identifier"
* rest[0].resource[0].searchParam[0].type = #token
* rest[0].resource[0].searchParam[0].documentation = "Localiza o trabalhador por CPF ou CNS usando system|value."
* rest[0].resource[0].searchParam[1].name = "name"
* rest[0].resource[0].searchParam[1].type = #string

// 1 - Practitioner
* rest[0].resource[1].type = #Practitioner
* rest[0].resource[1].supportedProfile[0] = Canonical(AgroSUSACS)
* rest[0].resource[1].supportedProfile[1] = Canonical(AgroSUSProfissionalUBS)
* rest[0].resource[1].interaction[0].code = #read
* rest[0].resource[1].interaction[1].code = #search-type
* rest[0].resource[1].referencePolicy = #literal
* rest[0].resource[1].searchParam[0].name = "identifier"
* rest[0].resource[1].searchParam[0].type = #token
* rest[0].resource[1].searchParam[1].name = "name"
* rest[0].resource[1].searchParam[1].type = #string

// 2 - PractitionerRole
* rest[0].resource[2].type = #PractitionerRole
* rest[0].resource[2].supportedProfile[0] = Canonical(AgroSUSACSRole)
* rest[0].resource[2].supportedProfile[1] = Canonical(AgroSUSProfissionalUBSRole)
* rest[0].resource[2].interaction[0].code = #read
* rest[0].resource[2].interaction[1].code = #search-type
* rest[0].resource[2].referencePolicy = #literal
* rest[0].resource[2].searchParam[0].name = "practitioner"
* rest[0].resource[2].searchParam[0].type = #reference
* rest[0].resource[2].searchParam[1].name = "organization"
* rest[0].resource[2].searchParam[1].type = #reference
* rest[0].resource[2].searchParam[2].name = "role"
* rest[0].resource[2].searchParam[2].type = #token
* rest[0].resource[2].searchParam[3].name = "active"
* rest[0].resource[2].searchParam[3].type = #token

// 3 - Organization
* rest[0].resource[3].type = #Organization
* rest[0].resource[3].supportedProfile[0] = Canonical(AgroSUSUBS)
* rest[0].resource[3].supportedProfile[1] = Canonical(AgroSUSLaboratorio)
* rest[0].resource[3].interaction[0].code = #read
* rest[0].resource[3].interaction[1].code = #search-type
* rest[0].resource[3].referencePolicy = #literal
* rest[0].resource[3].searchParam[0].name = "identifier"
* rest[0].resource[3].searchParam[0].type = #token
* rest[0].resource[3].searchParam[1].name = "name"
* rest[0].resource[3].searchParam[1].type = #string
* rest[0].resource[3].searchParam[2].name = "active"
* rest[0].resource[3].searchParam[2].type = #token

// 4 - Questionnaire
* rest[0].resource[4].type = #Questionnaire
* rest[0].resource[4].interaction[0].code = #read
* rest[0].resource[4].interaction[1].code = #search-type
* rest[0].resource[4].searchParam[0].name = "url"
* rest[0].resource[4].searchParam[0].type = #uri
* rest[0].resource[4].searchParam[1].name = "version"
* rest[0].resource[4].searchParam[1].type = #token
* rest[0].resource[4].searchParam[2].name = "status"
* rest[0].resource[4].searchParam[2].type = #token

// 5 - QuestionnaireResponse
* rest[0].resource[5].type = #QuestionnaireResponse
* rest[0].resource[5].profile = Canonical(AgroSUSAnamneseResponse)
* rest[0].resource[5].interaction[0].code = #create
* rest[0].resource[5].interaction[1].code = #read
* rest[0].resource[5].interaction[2].code = #update
* rest[0].resource[5].interaction[3].code = #search-type
* rest[0].resource[5].versioning = #versioned-update
* rest[0].resource[5].updateCreate = true
* rest[0].resource[5].referencePolicy[0] = #literal
* rest[0].resource[5].referencePolicy[1] = #local
* rest[0].resource[5].searchParam[0].name = "subject"
* rest[0].resource[5].searchParam[0].type = #reference
* rest[0].resource[5].searchParam[1].name = "encounter"
* rest[0].resource[5].searchParam[1].type = #reference
* rest[0].resource[5].searchParam[2].name = "author"
* rest[0].resource[5].searchParam[2].type = #reference
* rest[0].resource[5].searchParam[3].name = "authored"
* rest[0].resource[5].searchParam[3].type = #date
* rest[0].resource[5].searchParam[4].name = "status"
* rest[0].resource[5].searchParam[4].type = #token

// 6 - Encounter
* rest[0].resource[6].type = #Encounter
* rest[0].resource[6].supportedProfile[0] = Canonical(AgroSUSVisitaACS)
* rest[0].resource[6].supportedProfile[1] = Canonical(AgroSUSAtendimentoUBS)
* rest[0].resource[6].interaction[0].code = #create
* rest[0].resource[6].interaction[1].code = #read
* rest[0].resource[6].interaction[2].code = #update
* rest[0].resource[6].interaction[3].code = #search-type
* rest[0].resource[6].versioning = #versioned-update
* rest[0].resource[6].updateCreate = true
* rest[0].resource[6].referencePolicy[0] = #literal
* rest[0].resource[6].referencePolicy[1] = #local
* rest[0].resource[6].searchParam[0].name = "patient"
* rest[0].resource[6].searchParam[0].type = #reference
* rest[0].resource[6].searchParam[1].name = "date"
* rest[0].resource[6].searchParam[1].type = #date
* rest[0].resource[6].searchParam[2].name = "status"
* rest[0].resource[6].searchParam[2].type = #token
* rest[0].resource[6].searchParam[3].name = "participant"
* rest[0].resource[6].searchParam[3].type = #reference

// 7 - ServiceRequest
* rest[0].resource[7].type = #ServiceRequest
* rest[0].resource[7].profile = Canonical(AgroSUSSolicitacaoExame)
* rest[0].resource[7].interaction[0].code = #create
* rest[0].resource[7].interaction[1].code = #read
* rest[0].resource[7].interaction[2].code = #update
* rest[0].resource[7].interaction[3].code = #search-type
* rest[0].resource[7].versioning = #versioned-update
* rest[0].resource[7].referencePolicy = #literal
* rest[0].resource[7].searchParam[0].name = "patient"
* rest[0].resource[7].searchParam[0].type = #reference
* rest[0].resource[7].searchParam[1].name = "authored"
* rest[0].resource[7].searchParam[1].type = #date
* rest[0].resource[7].searchParam[2].name = "requester"
* rest[0].resource[7].searchParam[2].type = #reference
* rest[0].resource[7].searchParam[3].name = "status"
* rest[0].resource[7].searchParam[3].type = #token
* rest[0].resource[7].searchParam[4].name = "code"
* rest[0].resource[7].searchParam[4].type = #token

// 8 - Observation
* rest[0].resource[8].type = #Observation
* rest[0].resource[8].profile = Canonical(AgroSUSResultadoLaboratorial)
* rest[0].resource[8].interaction[0].code = #create
* rest[0].resource[8].interaction[1].code = #read
* rest[0].resource[8].interaction[2].code = #update
* rest[0].resource[8].interaction[3].code = #search-type
* rest[0].resource[8].versioning = #versioned-update
* rest[0].resource[8].referencePolicy = #literal
* rest[0].resource[8].searchParam[0].name = "patient"
* rest[0].resource[8].searchParam[0].type = #reference
* rest[0].resource[8].searchParam[1].name = "date"
* rest[0].resource[8].searchParam[1].type = #date
* rest[0].resource[8].searchParam[2].name = "code"
* rest[0].resource[8].searchParam[2].type = #token
* rest[0].resource[8].searchParam[3].name = "status"
* rest[0].resource[8].searchParam[3].type = #token
* rest[0].resource[8].searchParam[4].name = "based-on"
* rest[0].resource[8].searchParam[4].type = #reference

// 9 - DiagnosticReport
* rest[0].resource[9].type = #DiagnosticReport
* rest[0].resource[9].profile = Canonical(AgroSUSLaudoLaboratorial)
* rest[0].resource[9].interaction[0].code = #create
* rest[0].resource[9].interaction[1].code = #read
* rest[0].resource[9].interaction[2].code = #update
* rest[0].resource[9].interaction[3].code = #search-type
* rest[0].resource[9].versioning = #versioned-update
* rest[0].resource[9].referencePolicy = #literal
* rest[0].resource[9].searchParam[0].name = "patient"
* rest[0].resource[9].searchParam[0].type = #reference
* rest[0].resource[9].searchParam[1].name = "date"
* rest[0].resource[9].searchParam[1].type = #date
* rest[0].resource[9].searchParam[2].name = "code"
* rest[0].resource[9].searchParam[2].type = #token
* rest[0].resource[9].searchParam[3].name = "status"
* rest[0].resource[9].searchParam[3].type = #token
* rest[0].resource[9].searchParam[4].name = "based-on"
* rest[0].resource[9].searchParam[4].type = #reference

// 10 - Condition
* rest[0].resource[10].type = #Condition
* rest[0].resource[10].profile = Canonical(AgroSUSIntoxicacaoPesticida)
* rest[0].resource[10].interaction[0].code = #create
* rest[0].resource[10].interaction[1].code = #read
* rest[0].resource[10].interaction[2].code = #update
* rest[0].resource[10].interaction[3].code = #search-type
* rest[0].resource[10].versioning = #versioned-update
* rest[0].resource[10].referencePolicy = #literal
* rest[0].resource[10].searchParam[0].name = "patient"
* rest[0].resource[10].searchParam[0].type = #reference
* rest[0].resource[10].searchParam[1].name = "clinical-status"
* rest[0].resource[10].searchParam[1].type = #token
* rest[0].resource[10].searchParam[2].name = "verification-status"
* rest[0].resource[10].searchParam[2].type = #token
* rest[0].resource[10].searchParam[3].name = "code"
* rest[0].resource[10].searchParam[3].type = #token
* rest[0].resource[10].searchParam[4].name = "onset-date"
* rest[0].resource[10].searchParam[4].type = #date

// 11 - CarePlan
* rest[0].resource[11].type = #CarePlan
* rest[0].resource[11].profile = Canonical(AgroSUSPlanoAcompanhamento)
* rest[0].resource[11].interaction[0].code = #create
* rest[0].resource[11].interaction[1].code = #read
* rest[0].resource[11].interaction[2].code = #update
* rest[0].resource[11].interaction[3].code = #search-type
* rest[0].resource[11].versioning = #versioned-update
* rest[0].resource[11].referencePolicy = #literal
* rest[0].resource[11].searchParam[0].name = "patient"
* rest[0].resource[11].searchParam[0].type = #reference
* rest[0].resource[11].searchParam[1].name = "status"
* rest[0].resource[11].searchParam[1].type = #token
* rest[0].resource[11].searchParam[2].name = "date"
* rest[0].resource[11].searchParam[2].type = #date
* rest[0].resource[11].searchParam[3].name = "category"
* rest[0].resource[11].searchParam[3].type = #token

// 12 - Provenance
* rest[0].resource[12].type = #Provenance
* rest[0].resource[12].profile = Canonical(AgroSUSProvenance)
* rest[0].resource[12].interaction[0].code = #create
* rest[0].resource[12].interaction[1].code = #read
* rest[0].resource[12].interaction[2].code = #update
* rest[0].resource[12].interaction[3].code = #search-type
* rest[0].resource[12].versioning = #versioned-update
* rest[0].resource[12].updateCreate = true
* rest[0].resource[12].referencePolicy[0] = #literal
* rest[0].resource[12].referencePolicy[1] = #local
* rest[0].resource[12].searchParam[0].name = "target"
* rest[0].resource[12].searchParam[0].type = #reference
* rest[0].resource[12].searchParam[1].name = "agent"
* rest[0].resource[12].searchParam[1].type = #reference
* rest[0].resource[12].searchParam[2].name = "recorded"
* rest[0].resource[12].searchParam[2].type = #date

// 13 - AuditEvent: leitura restrita a auditores autorizados; criação é responsabilidade do servidor.
* rest[0].resource[13].type = #AuditEvent
* rest[0].resource[13].profile = Canonical(AgroSUSAuditEvent)
* rest[0].resource[13].interaction[0].code = #read
* rest[0].resource[13].interaction[1].code = #search-type
* rest[0].resource[13].referencePolicy = #literal
* rest[0].resource[13].searchParam[0].name = "agent"
* rest[0].resource[13].searchParam[0].type = #reference
* rest[0].resource[13].searchParam[1].name = "date"
* rest[0].resource[13].searchParam[1].type = #date
* rest[0].resource[13].searchParam[2].name = "entity"
* rest[0].resource[13].searchParam[2].type = #reference
* rest[0].resource[13].searchParam[3].name = "action"
* rest[0].resource[13].searchParam[3].type = #token
