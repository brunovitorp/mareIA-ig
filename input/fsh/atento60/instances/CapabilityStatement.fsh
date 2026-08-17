// Fonte L1: §12 (p.17). L2: 8-requirements. Capacidades FHIR esperadas dos sistemas.
Instance: Atento60CapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* status = #active
* experimental = false
* date = "2026-06-22"
* name = "Atento60CapabilityStatement"
* title = "Capacidades FHIR — ATENTO 60+"
* description = "Capacidades esperadas de um sistema que implementa o pathway ATENTO 60+ (interoperável com a RNDS, FHIR R4)."
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest.mode = #server
* rest.documentation = "Servidor FHIR R4 que recebe e disponibiliza os dados do telemonitoramento."
* rest.resource[+].type = #Patient
* rest.resource[=].supportedProfile = Canonical(Atento60PatientElderly)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Observation
* rest.resource[=].supportedProfile[+] = Canonical(Atento60ObservationIvcfScore)
* rest.resource[=].supportedProfile[+] = Canonical(Atento60ObservationIotVital)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].documentation = "Respostas do IVCF-20 coletadas pelo Agente de Coleta."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[+].type = #Questionnaire
* rest.resource[=].interaction[+].code = #read
* rest.resource[+].type = #CarePlan
* rest.resource[=].documentation = "Plano de cuidado construído pela equipe de gestão do cuidado."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
