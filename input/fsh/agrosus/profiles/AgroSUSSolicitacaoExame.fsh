Profile: AgroSUSSolicitacaoExame
Parent: ServiceRequest
Id: agrosus-solicitacao-exame
Title: "Solicitação de Exame AgroSUS"
Description: "Solicitação de exame laboratorial realizada por profissional assistencial da UBS para acompanhamento do trabalhador rural no AgroSUS."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único da solicitação de exame"

* requisition MS
* requisition ^short = "Identificador comum que agrupa exames solicitados conjuntamente"

* status MS
* status ^short = "Situação atual da solicitação"

* intent MS
* intent ^short = "Intenção clínica da solicitação"

* category MS
* category ^short = "Categoria do serviço solicitado"

* priority MS
* priority ^short = "Prioridade assistencial da solicitação"

* code MS
* code from AgroSUSExamesLaboratoriaisVS (extensible)
* code ^short = "Exame ou painel laboratorial solicitado"

* subject only Reference(AgroSUSPatient)
* subject MS
* subject ^short = "Trabalhador rural para o qual o exame foi solicitado"

* encounter MS
* encounter only Reference(AgroSUSAtendimentoUBS)
* encounter ^short = "Atendimento da UBS relacionado à solicitação"

* occurrence[x] MS
* occurrence[x] ^short = "Data ou período previsto para realização do exame"

* authoredOn 1..1 MS
* authoredOn ^short = "Data e hora da solicitação"

* requester 1..1 MS
* requester only Reference(AgroSUSProfissionalUBSRole)
* requester ^short = "Vínculo do profissional da UBS responsável pela solicitação"

* reasonCode MS
* reasonCode ^short = "Justificativa clínica para o exame"

* reasonReference MS
* reasonReference only Reference(
    AgroSUSIntoxicacaoPesticida or
    AgroSUSResultadoLaboratorial or
    AgroSUSLaudoLaboratorial
)
* reasonReference ^short = "Condição, resultado ou laudo que justifica a solicitação"

* supportingInfo MS
* supportingInfo ^short = "Anamnese e outras informações que apoiam a decisão clínica"

* performer MS
* performer only Reference(AgroSUSLaboratorio)
* performer ^short = "Laboratório responsável pela realização, quando definido"

* patientInstruction MS
* patientInstruction ^short = "Orientações fornecidas ao trabalhador"

* note MS
* note ^short = "Observações clínicas relacionadas à solicitação"
