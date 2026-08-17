// Fonte L1: NR-7 (itens 7.4.1, 7.4.2.1); NR-31 item 31.8. L2: 7-indicators.csv.
// Indicadores de processo/resultado como Measure (proporção). Expressões em text/fhirpath são
// descritivas nesta fase (CQL previsto para L4).

Instance: AgroSUSMeasureCoberturaBasal
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = true
* name = "AgroSUSMeasureCoberturaBasal"
* title = "Cobertura do exame basal de colinesterase (AgroSUS)"
* description = "Proporção de trabalhadores que manuseiam organofosforados/carbamatos com valor basal de colinesterase registrado na admissão, conforme exigido pela NR-7 item 7.4.1."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#denominator
* group[=].population[=].description = "Trabalhadores cadastrados que manuseiam organofosforados/carbamatos"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-manuseiam-organofosforados"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].description = "Trabalhadores com valor basal de colinesterase registrado na admissão"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-com-valor-basal-registrado"

Instance: AgroSUSMeasureAdesaoPeriodicidade
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = true
* name = "AgroSUSMeasureAdesaoPeriodicidade"
* title = "Adesão à periodicidade semestral do monitoramento biológico (AgroSUS)"
* description = "Proporção de trabalhadores elegíveis com exame de colinesterase realizado dentro dos últimos 6 meses, conforme a periodicidade mínima da NR-7 item 7.4.2.1."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#denominator
* group[=].population[=].description = "Trabalhadores elegíveis ao monitoramento biológico"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-elegiveis-monitoramento"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].description = "Trabalhadores com exame de colinesterase nos últimos 6 meses"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-exame-ultimos-6-meses"

Instance: AgroSUSMeasureAlteradosComConduta
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = true
* name = "AgroSUSMeasureAlteradosComConduta"
* title = "Proporção de resultados alterados de colinesterase com conduta registrada (AgroSUS)"
* description = "Proporção de resultados de colinesterase acima do Índice Biológico Máximo Permitido (IBMP) com afastamento ou conduta clínica registrada, conforme a Nota Informativa nº 16/2019, Anexo III item 3."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#denominator
* group[=].population[=].description = "Resultados de colinesterase classificados como Alterado"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "resultados-colinesterase-alterados"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].description = "Resultados alterados com conduta registrada (CarePlan ou Provenance)"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "resultados-alterados-com-conduta-registrada"

Instance: AgroSUSMeasureCoberturaEPI
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = true
* name = "AgroSUSMeasureCoberturaEPI"
* title = "Cobertura de uso adequado de EPI (AgroSUS)"
* description = "Proporção de trabalhadores que manuseiam defensivos de categoria toxicológica 1 ou 2 com uso adequado de Equipamento de Proteção Individual registrado na anamnese, conforme a NR-31 item 31.8."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#denominator
* group[=].population[=].description = "Trabalhadores que manuseiam defensivos categoria toxicológica 1 ou 2"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-categoria-1-2"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].description = "Trabalhadores com uso de EPI adequado registrado"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-epi-adequado"

Instance: AgroSUSMeasureCoberturaAnamnese
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = true
* name = "AgroSUSMeasureCoberturaAnamnese"
* title = "Cobertura da anamnese ocupacional AgroSUS"
* description = "Proporção de trabalhadores cadastrados com QuestionnaireResponse da anamnese AgroSUS registrada, medindo a implantação do instrumento de triagem ocupacional pelo ACS."
* scoring = $measure-scoring#proportion
* group[+].population[+].code = $measure-population#denominator
* group[=].population[=].description = "Trabalhadores cadastrados no AgroSUS"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-cadastrados"
* group[=].population[+].code = $measure-population#numerator
* group[=].population[=].description = "Trabalhadores com anamnese AgroSUS registrada"
* group[=].population[=].criteria.language = #text/fhirpath
* group[=].population[=].criteria.expression = "trabalhadores-com-anamnese-registrada"
