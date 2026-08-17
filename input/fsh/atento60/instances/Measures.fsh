// Fonte L1: §11 (p.15). L2: 7-indicators. Indicadores de processo como Measure (proporção).
// Expressões em text/fhirpath são descritivas nesta fase (CQL previsto para L4).

Instance: Atento60MeasureCadastro
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "Atento60MeasureCadastro"
* title = "Taxa de cadastro (ATENTO 60+)"
* description = "Proporção de elegíveis identificados que foram efetivamente cadastrados na plataforma."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Pessoas idosas elegíveis identificadas"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "elegiveis-identificados"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Elegíveis efetivamente cadastrados"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "elegiveis-cadastrados"

Instance: Atento60MeasureCompletude
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "Atento60MeasureCompletude"
* title = "Taxa de completude de coleta (ATENTO 60+)"
* description = "Proporção de coletas realizadas conforme o protocolo em relação às previstas."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Coletas previstas pelo protocolo"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "coletas-previstas"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Coletas realizadas conforme protocolo"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "coletas-realizadas"

Instance: Atento60MeasureAlertas
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "Atento60MeasureAlertas"
* title = "Taxa de alertas respondidos em tempo (ATENTO 60+)"
* description = "Proporção de alertas críticos e prioritários com resposta documentada em tempo hábil."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Alertas críticos/prioritários gerados"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "alertas-gerados"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Alertas com resposta documentada em tempo"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "alertas-respondidos-tempo"

Instance: Atento60MeasureOffline
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "Atento60MeasureOffline"
* title = "Taxa de funcionamento offline (ATENTO 60+)"
* description = "Proporção de coletas realizadas em modo offline com sincronização bem-sucedida."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Coletas realizadas em modo offline"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "coletas-offline"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Coletas offline sincronizadas com sucesso"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "coletas-offline-sincronizadas"
