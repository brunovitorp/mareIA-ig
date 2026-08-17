Profile: AgroSUSIntoxicacaoPesticida
Parent: Condition
Id: agrosus-intoxicacao-pesticida
Title: "Suspeita ou Confirmação de Intoxicação por Pesticida AgroSUS"
Description: "Condição clínica registrada por profissional assistencial para representar suspeita, confirmação ou descarte de intoxicação por pesticidas."

* identifier 1..1 MS
* identifier.system 1..1
* identifier.value 1..1
* identifier ^short = "Identificador único da condição clínica"

* clinicalStatus 1..1 MS
* clinicalStatus ^short = "Situação clínica atual da condição"

* verificationStatus 1..1 MS
* verificationStatus ^short = "Situação da verificação clínica: provisória, confirmada ou refutada"

* category 1..1 MS
* category ^short = "Categoria da condição clínica"

* severity MS
* severity ^short = "Gravidade avaliada pelo profissional assistencial"

* code 1..1 MS
* code from AgroSUSIntoxicacaoPesticidaVS (required)
* code ^short = "Tipo de efeito tóxico de pesticida segundo a CID-10"

* subject only Reference(AgroSUSPatient)
* subject MS

* encounter MS
* encounter only Reference(AgroSUSAtendimentoUBS)
* encounter ^short = "Atendimento da UBS no qual a condição foi avaliada"

* onset[x] MS
* onset[x] ^short = "Data ou período estimado de início"

* abatement[x] MS
* abatement[x] ^short = "Data ou período de resolução da condição"

* recordedDate 1..1 MS
* recordedDate ^short = "Data em que a condição foi registrada"

* recorder 1..1 MS
* recorder only Reference(AgroSUSProfissionalUBSRole)
* recorder ^short = "Profissional responsável pelo registro"

* asserter 1..1 MS
* asserter only Reference(AgroSUSProfissionalUBSRole)
* asserter ^short = "Profissional que realizou a avaliação clínica"

* evidence 1..* MS
* evidence ^short = "Anamnese, resultado ou laudo utilizado como evidência"

* evidence.detail 1..* MS
* evidence.detail only Reference(
    AgroSUSAnamneseResponse or
    AgroSUSResultadoLaboratorial or
    AgroSUSLaudoLaboratorial
)

* note MS
* note ^short = "Justificativa e observações clínicas"
