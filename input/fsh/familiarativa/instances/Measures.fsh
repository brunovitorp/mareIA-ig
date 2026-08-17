// Fonte L1: DAK Componente 8 (IND-01..IND-07). L2: 7-indicators. Um Measure por indicador.
// Expressões em text/fhirpath são descritivas nesta fase (CQL previsto para L4).

Instance: FamiliarAtivaMeasureAdesao
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureAdesao"
* title = "IND-01 · Taxa de adesão ao monitoramento (FamilIAr_Ativa)"
* description = "Proporção de pacientes ativos com pelo menos 1 registro ESAS no período. Meta: 80%. Fonte: REGISTRO_SINTOMAS."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Total de pacientes ativos"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "pacientes-ativos"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Pacientes com >=1 registro ESAS no período"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "pacientes-com-registro-esas"

Instance: FamiliarAtivaMeasureRiscoAlto
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureRiscoAlto"
* title = "IND-02 · Proporção de registros com risco Alto (FamilIAr_Ativa)"
* description = "Proporção de registros ESAS classificados como risco Alto no período. Desagregação: por profissional."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Total de registros ESAS no período"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "registros-esas"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Registros com nivel_risco = Alto"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "registros-esas-risco-alto"

Instance: FamiliarAtivaMeasureResolucaoAlertas
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureResolucaoAlertas"
* title = "IND-03 · Taxa de resolução de alertas (FamilIAr_Ativa)"
* description = "Proporção de alertas criados no período que foram resolvidos. Desagregação: por profissional."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Total de alertas criados no período"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "alertas-criados"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Alertas com status = Resolvido"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "alertas-resolvidos"

Instance: FamiliarAtivaMeasureSobrecargaSevera
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureSobrecargaSevera"
* title = "IND-04 · Prevalência de sobrecarga severa do cuidador (FamilIAr_Ativa)"
* description = "Proporção de avaliações Zarit com classificação Severa no período. Desagregação: por unidade."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Total de avaliações Zarit no período"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "avaliacoes-zarit"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Avaliações Zarit com classificação Severa"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "avaliacoes-zarit-severa"

Instance: FamiliarAtivaMeasureTempoResolucao
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureTempoResolucao"
* title = "IND-05 · Tempo médio de resolução de alerta em horas (FamilIAr_Ativa)"
* description = "Média de (resolvido_em − criado_em), em horas, para alertas resolvidos no período. Desagregação: por profissional."
* scoring = $measure-scoring#continuous-variable
* group[+].population[+].code = $measure-pop#measure-population
* group[=].population[=].description = "Alertas resolvidos no período"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "alertas-resolvidos"
* group[=].population[+].code = $measure-pop#measure-observation
* group[=].population[=].description = "Horas entre criação e resolução do alerta"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "horas-criacao-ate-resolucao"

Instance: FamiliarAtivaMeasureEngajamentoEducativo
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureEngajamentoEducativo"
* title = "IND-06 · Taxa de engajamento educativo (FamilIAr_Ativa)"
* description = "Proporção de pacientes ativos com pelo menos 1 acesso a módulo educativo no mês. Fonte: ACESSO_MODULO. Desagregação: por unidade."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-pop#denominator
* group[=].population[=].description = "Total de pacientes ativos"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "pacientes-ativos"
* group[=].population[+].code = $measure-pop#numerator
* group[=].population[=].description = "Pacientes com >=1 acesso a módulo educativo no mês"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "pacientes-com-acesso-educativo"

Instance: FamiliarAtivaMeasureMediaEsas
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "FamiliarAtivaMeasureMediaEsas"
* title = "IND-07 · Pontuação média ESAS por domínio (FamilIAr_Ativa)"
* description = "Média dos escores por sintoma (soma dos escores do domínio ÷ total de registros no período). Desagregação: por diagnóstico."
* scoring = $measure-scoring#continuous-variable
* group[+].population[+].code = $measure-pop#measure-population
* group[=].population[=].description = "Registros ESAS no período"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "registros-esas"
* group[=].population[+].code = $measure-pop#measure-observation
* group[=].population[=].description = "Escore do domínio (0–10) por registro"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "escore-por-dominio"
