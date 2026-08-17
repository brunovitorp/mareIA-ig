// Fonte L1: Metodologia §7.2.3, Requisitos RF007, RNF001, ADR-0005.
Instance: CapabilityStatementCardioRemoto
InstanceOf: CapabilityStatement
Usage: #definition
* status = #active
* experimental = false
* name = "CapabilityStatementCardioRemoto"
* title = "CardioRemoto — Declaração de Capacidades da API (mareIA / AGHUX)"
* description = "Especifica os requisitos e capacidades da API FHIR R4 para interoperabilidade entre a plataforma mareIA e o sistema hospitalar AGHUX (HULW / EBSERH)."
* kind = #requirements
* date = "2026-06-22"
* fhirVersion = #4.0.1
* format[+] = #json
* rest[+]
  * mode = #server
  * documentation = "Servidor FHIR da Plataforma mareIA para recepção de sinais vitais, sincronização offline e dados laboratoriais."
  * resource[+]
    * type = #Patient
    * profile = Canonical(PatientCardio)
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * interaction[+].code = #create
    * interaction[+].code = #update
  * resource[+]
    * type = #Observation
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * interaction[+].code = #create
    * searchParam[+]
      * name = "patient"
      * type = #reference
      * documentation = "Busca por paciente"
    * searchParam[+]
      * name = "code"
      * type = #token
      * documentation = "Busca por código LOINC ou local"
  * resource[+]
    * type = #QuestionnaireResponse
    * interaction[+].code = #create
    * interaction[+].code = #read
