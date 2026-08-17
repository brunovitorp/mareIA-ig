// Fonte L1: Metodologia §9.1, L2: 7-indicators.
Instance: MeasureCardioBpControl
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "MeasureCardioBpControl"
* title = "CardioRemoto — Taxa de Controle Pressórico"
* description = "Proporção de pacientes com diagnóstico de HAS que atingiram a meta de pressão arterial (PA < 140/90 mmHg)."
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#outcome
* library = Canonical(CardioLogic)
* group[+]
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
    * description = "Pacientes com diagnóstico de Hipertensão Arterial Sistêmica cadastrados no programa."
    * criteria.language = #text/cql
    * criteria.expression = "PacientesComHAS"
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
    * description = "Pacientes com HAS ativos no período."
    * criteria.language = #text/cql
    * criteria.expression = "PacientesComHAS"
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
    * description = "Pacientes com PA sistólica < 140 mmHg e diastólica < 90 mmHg na última aferição."
    * criteria.language = #text/cql
    * criteria.expression = "PAControlada"

Instance: MeasureCardioHba1cControl
InstanceOf: Measure
Usage: #definition
* status = #active
* experimental = false
* name = "MeasureCardioHba1cControl"
* title = "CardioRemoto — Taxa de Controle Glicêmico"
* description = "Proporção de pacientes com diagnóstico de DM que atingiram a meta de hemoglobina glicada (HbA1c < 7.0%)."
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#outcome
* library = Canonical(CardioLogic)
* group[+]
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
    * description = "Pacientes com diagnóstico de Diabetes Mellitus cadastrados no programa."
    * criteria.language = #text/cql
    * criteria.expression = "PacientesComDM"
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
    * description = "Pacientes com DM ativos no período com exame nos últimos 6 meses."
    * criteria.language = #text/cql
    * criteria.expression = "PacientesComDM"
  * population[+]
    * code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
    * description = "Pacientes com HbA1c < 7.0% no exame mais recente."
    * criteria.language = #text/cql
    * criteria.expression = "HbA1cControlada"
