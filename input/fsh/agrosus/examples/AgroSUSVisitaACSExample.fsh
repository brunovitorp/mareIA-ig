Instance: agrosus-visita-acs-exemplo
InstanceOf: AgroSUSVisitaACS
Usage: #example
Title: "Exemplo de Visita do ACS AgroSUS"
Description: "Visita fictícia em campo para aplicação inicial da anamnese AgroSUS."

* language = #pt-BR

* identifier.system = "https://jefersonrl.github.io/AgroSUS-FHIR/sid/visita"
* identifier.value = "VISITA-2026-000001"

* status = #finished

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#FLD "field"

* priority = http://terminology.hl7.org/CodeSystem/v3-ActPriority#R "routine"
* priority.text = "Rotina"

* subject = Reference(agrosus-patient-example)
* subject.display = "Maria Aparecida de Souza"

* participant[0].type[0] = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#PPRF "primary performer"
* participant[0].type[0].text = "Executor principal"
* participant[0].individual = Reference(agrosus-acs-role-exemplo)
* participant[0].individual.display = "Maria Clara Oliveira — ACS da UBS Jardim Esperança"

* period.start = "2026-07-20T09:00:00-03:00"
* period.end = "2026-07-20T10:00:00-03:00"

* reasonCode[0].text = "Aplicação inicial da anamnese ocupacional e ambiental AgroSUS"

* serviceProvider = Reference(agrosus-ubs-exemplo)
* serviceProvider.display = "UBS Jardim Esperança — Exemplo AgroSUS"