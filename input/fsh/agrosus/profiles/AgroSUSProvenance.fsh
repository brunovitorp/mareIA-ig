Profile: AgroSUSProvenance
Parent: Provenance
Id: agrosus-provenance
Title: "Proveniência dos Registros AgroSUS"
Description: "Registro de autoria, criação, atualização e origem dos recursos clínicos e assistenciais do AgroSUS."

* target 1..* MS
* target only Reference(
    AgroSUSPatient or
    AgroSUSVisitaACS or
    AgroSUSAnamneseResponse or
    AgroSUSAtendimentoUBS or
    AgroSUSIntoxicacaoPesticida or
    AgroSUSSolicitacaoExame or
    AgroSUSResultadoLaboratorial or
    AgroSUSLaudoLaboratorial or
    AgroSUSPlanoAcompanhamento
)
* target ^short = "Recursos criados ou atualizados pela atividade registrada"

* occurred[x] 1..1 MS
* occurred[x] ^short = "Momento em que a atividade ocorreu"

* recorded MS
* recorded ^short = "Momento em que a proveniência foi registrada"

* policy MS
* policy ^short = "Política institucional aplicável ao registro"

* reason MS
* reason ^short = "Finalidade da criação ou atualização"

* activity 1..1 MS
* activity ^short = "Operação realizada, como criação ou atualização"

* agent 1..* MS

* agent.type 1..1 MS
* agent.type ^short = "Forma de participação do agente"

* agent.role MS
* agent.role ^short = "Função exercida pelo agente"

* agent.who 1..1 MS
* agent.who only Reference(
    AgroSUSACSRole or
    AgroSUSProfissionalUBSRole or
    AgroSUSLaboratorio or
    AgroSUSUBS
)
* agent.who ^short = "Agente responsável pela atividade"

* agent.onBehalfOf MS
* agent.onBehalfOf only Reference(AgroSUSUBS or AgroSUSLaboratorio)
* agent.onBehalfOf ^short = "Organização representada pelo agente"

* entity MS
* entity.role MS

* entity.what MS
* entity.what only Reference(
    AgroSUSPatient or
    AgroSUSVisitaACS or
    AgroSUSAnamneseResponse or
    AgroSUSAtendimentoUBS or
    AgroSUSIntoxicacaoPesticida or
    AgroSUSSolicitacaoExame or
    AgroSUSResultadoLaboratorial or
    AgroSUSLaudoLaboratorial or
    AgroSUSPlanoAcompanhamento
)
* entity.what ^short = "Recurso utilizado como fonte para a atividade"

* signature MS
* signature ^short = "Assinatura digital, quando implementada"
