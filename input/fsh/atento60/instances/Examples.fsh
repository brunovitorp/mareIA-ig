// Exemplos — ilustram os perfis e o caso de teste TC-04 (idoso frágil). L2: 9-test-scenarios.

Instance: atento60-patient-example
InstanceOf: Atento60PatientElderly
Usage: #example
Title: "Exemplo — Pessoa idosa (Maria)"
Description: "Exemplo de pessoa idosa acompanhada no ATENTO 60+."
* name.text = "Maria de Exemplo"
* name.family = "de Exemplo"
* name.given = "Maria"
* gender = #female
* birthDate = "1948-03-10"

Instance: atento60-ivcf-score-example
InstanceOf: Atento60ObservationIvcfScore
Usage: #example
Title: "Exemplo — Escore IVCF-20 (frágil, TC-04)"
Description: "Resultado IVCF-20 com escore 16 → faixa frágil (alto risco). Ilustra o caso de teste TC-04."
* status = #final
* code = Atento60ObsCodeCS#ivcf-20-score
* subject = Reference(atento60-patient-example)
* effectiveDateTime = "2026-06-15"
* valueInteger = 16
* component[faixa].code = Atento60ObsCodeCS#ivcf-20-faixa
* component[faixa].valueCodeableConcept = Atento60IvcfRiskCS#fragil "Idoso frágil (alto risco)"

Instance: atento60-iot-weight-example
InstanceOf: Atento60ObservationIotVital
Usage: #example
Title: "Exemplo — Peso por IoT (balança digital)"
Description: "Peso corporal coletado por balança digital (IoT)."
* status = #final
* category = $obs-category#vital-signs
* code = $loinc#29463-7
* subject = Reference(atento60-patient-example)
* effectiveDateTime = "2026-06-15"
* valueQuantity = 68 'kg'
* valueQuantity.unit = "kg"
* valueQuantity.system = $ucum
