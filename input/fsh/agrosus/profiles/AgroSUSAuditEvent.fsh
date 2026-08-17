Profile: AgroSUSAuditEvent
Parent: AuditEvent
Id: agrosus-audit-event
Title: "Evento de Auditoria AgroSUS"
Description: "Registro de segurança para rastrear consultas, alterações e outras operações realizadas sobre os dados do AgroSUS."

* type MS
* type ^short = "Tipo geral do evento de auditoria"

* subtype 1..* MS
* subtype ^short = "Operação específica executada"

* action 1..1 MS
* action ^short = "Ação realizada: criar, consultar, atualizar, excluir ou executar"

* period MS
* period ^short = "Período em que a operação ocorreu"

* recorded MS
* recorded ^short = "Momento em que o evento foi registrado"

* outcome 1..1 MS
* outcome ^short = "Resultado da operação"

* outcomeDesc MS
* outcomeDesc ^short = "Descrição adicional do resultado"

* purposeOfEvent MS
* purposeOfEvent ^short = "Finalidade assistencial ou administrativa do acesso"

* agent 1..* MS

* agent.type MS
* agent.role MS

* agent.who 1..1 MS
* agent.who only Reference(
    AgroSUSACSRole or
    AgroSUSProfissionalUBSRole or
    AgroSUSLaboratorio or
    AgroSUSUBS
)
* agent.who ^short = "Usuário, organização ou sistema que participou do evento"

* agent.name MS
* agent.name ^short = "Identificação legível do agente"

* agent.requestor MS
* agent.requestor ^short = "Indica se o agente iniciou a operação"

* agent.policy MS
* agent.policy ^short = "Política que autorizou o acesso"

* agent.network MS
* agent.network.address MS
* agent.network.type MS
* agent.network ^short = "Origem de rede da operação, quando disponível"

* agent.purposeOfUse MS
* agent.purposeOfUse ^short = "Finalidade declarada para o uso dos dados"

* source.site 1..1 MS
* source.site ^short = "Sistema ou local lógico que registrou o evento"

* source.observer 1..1 MS
* source.observer only Reference(AgroSUSUBS or AgroSUSLaboratorio)
* source.observer ^short = "Organização responsável pelo registro da auditoria"

* source.type MS

* entity 1..* MS

* entity.what 1..1 MS
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
* entity.what ^short = "Recurso consultado ou afetado pela operação"

* entity.type MS
* entity.role MS
* entity.lifecycle MS
* entity.securityLabel MS
* entity.name MS
* entity.description MS
* entity.query MS
