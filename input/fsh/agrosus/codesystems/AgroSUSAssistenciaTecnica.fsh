CodeSystem: AgroSUSAssistenciaTecnicaCS
Id: agrosus-assistencia-tecnica
Title: "Assistência Técnica AgroSUS"
Description: "Códigos relacionados à assistência e à responsabilidade técnica na produção rural."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

// Instituições de assistência técnica
* #instituicao-cati "CATI"
* #instituicao-senar "SENAR"
* #instituicao-cooperativa "Cooperativa"
* #instituicao-empresa-privada "Empresa privada"
* #instituicao-consultor-autonomo "Consultor autônomo"
* #instituicao-prefeitura "Prefeitura"
* #instituicao-outra "Outra instituição"

// Formação do responsável técnico
* #formacao-engenheiro-agronomo "Engenheiro agrônomo"
* #formacao-tecnico-agricola "Técnico agrícola"
* #formacao-outro-habilitado "Outro profissional habilitado"


ValueSet: AgroSUSInstituicaoAssistenciaVS
Id: agrosus-instituicao-assistencia
Title: "Instituição de Assistência Técnica"
Description: "Instituições que podem prestar assistência técnica ao produtor rural."
* ^status = #draft
* ^experimental = true

* AgroSUSAssistenciaTecnicaCS#instituicao-cati
* AgroSUSAssistenciaTecnicaCS#instituicao-senar
* AgroSUSAssistenciaTecnicaCS#instituicao-cooperativa
* AgroSUSAssistenciaTecnicaCS#instituicao-empresa-privada
* AgroSUSAssistenciaTecnicaCS#instituicao-consultor-autonomo
* AgroSUSAssistenciaTecnicaCS#instituicao-prefeitura
* AgroSUSAssistenciaTecnicaCS#instituicao-outra


ValueSet: AgroSUSFormacaoResponsavelTecnicoVS
Id: agrosus-formacao-responsavel-tecnico
Title: "Formação do Responsável Técnico"
Description: "Formações profissionais previstas para o responsável técnico da produção."
* ^status = #draft
* ^experimental = true

* AgroSUSAssistenciaTecnicaCS#formacao-engenheiro-agronomo
* AgroSUSAssistenciaTecnicaCS#formacao-tecnico-agricola
* AgroSUSAssistenciaTecnicaCS#formacao-outro-habilitado