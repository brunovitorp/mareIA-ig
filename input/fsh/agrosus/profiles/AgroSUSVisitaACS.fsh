Profile: AgroSUSVisitaACS
Parent: Encounter
Id: agrosus-visita-acs
Title: "Visita do ACS AgroSUS"
Description: "Visita ou atendimento em campo no qual o Agente Comunitário de Saúde aplica ou atualiza a anamnese AgroSUS."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único da visita AgroSUS"

* status MS
* status ^short = "Situação atual da visita"

* class MS
* class ^short = "Modalidade em que o atendimento ocorreu"

* type MS
* type ^short = "Tipo específico de atendimento realizado"

* priority MS
* priority ^short = "Caráter ou prioridade do atendimento"

* subject only Reference(AgroSUSPatient)
* subject MS
* subject ^short = "Trabalhador rural atendido"

* participant 1..* MS
* participant ^short = "ACS responsável pela visita"

* participant.type MS

* participant.individual 1..1 MS
* participant.individual only Reference(AgroSUSACSRole)
* participant.individual ^short = "Vínculo profissional do ACS responsável"

* period MS
* period ^short = "Data e horário de início e término da visita"

* reasonCode MS
* reasonCode ^short = "Motivo da visita ou do acompanhamento"

* serviceProvider only Reference(AgroSUSUBS)
* serviceProvider MS
* serviceProvider ^short = "UBS responsável pela visita"
