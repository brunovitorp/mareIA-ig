// Fonte L1: DAK §9 (requisitos) e Referências (recursos FHIR: Observation, QuestionnaireResponse,
// Flag, RiskAssessment, ServiceRequest, Communication). L2: 8-requirements.
Instance: FamiliarAtivaCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
* status = #active
* experimental = false
* date = "2026-07-10"
* name = "FamiliarAtivaCapabilityStatement"
* title = "Capacidades FHIR — FamilIAr_Ativa"
* description = "Capacidades esperadas de um sistema que implementa o pathway FamilIAr_Ativa (interoperável com e-SUS APS e RNDS, FHIR R4)."
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest.mode = #server
* rest.documentation = "Servidor FHIR R4 que recebe e disponibiliza os dados do telemonitoramento em cuidados paliativos domiciliares."
* rest.resource[+].type = #Patient
* rest.resource[=].supportedProfile = Canonical(FamiliarAtivaPatientPalliative)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #RelatedPerson
* rest.resource[=].supportedProfile = Canonical(FamiliarAtivaRelatedPersonCaregiver)
* rest.resource[=].documentation = "Cuidador familiar vinculado ao paciente (Cenário B)."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Observation
* rest.resource[=].supportedProfile[+] = Canonical(FamiliarAtivaObservationEsasSymptom)
* rest.resource[=].supportedProfile[+] = Canonical(FamiliarAtivaObservationEsasScore)
* rest.resource[=].supportedProfile[+] = Canonical(FamiliarAtivaObservationZaritScore)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[+].type = #QuestionnaireResponse
* rest.resource[=].documentation = "Respostas do ESAS e da Escala Zarit registradas pelo cuidador/paciente."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[+].type = #Questionnaire
* rest.resource[=].interaction[+].code = #read
* rest.resource[+].type = #Flag
* rest.resource[=].supportedProfile = Canonical(FamiliarAtivaFlagClinicalAlert)
* rest.resource[=].documentation = "Alertas clínicos (ESAS_ALTO, ZARIT_SEVERA, ADESAO_BAIXA); status rastreável (RF-PS02)."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #Communication
* rest.resource[=].documentation = "Chat seguro assíncrono cuidador ↔ profissional (RF-PC03/RF-PS04); canal criptografado, histórico mantido."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].documentation = "Agendamento das coletas (ESAS/Zarit) via occurrence[x], conforme DAK Componente 7."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].interaction[+].code = #update
* rest.resource[+].type = #RiskAssessment
* rest.resource[=].documentation = "Predição de risco por IA com explicabilidade XAI (RF-PS06); nivel_risco em prediction.outcome."
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #create
