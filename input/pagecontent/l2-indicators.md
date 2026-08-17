# 7. Indicadores de Programa (Measures)

Os indicadores da **Plataforma mareIA** são definidos para avaliar o impacto assistencial, a cobertura populacional e os desfechos em saúde no SUS, formalizados como recursos `Measure` do FHIR R4.

---

## 7.1 Matriz de Indicadores por Pathway

| Pathway | Código Measure | Nome do Indicador | Numerador / Denominador | Meta SUS |
|---|---|---|---|---|
| 🫀 **Cardio** | `MeasureCardioHba1cControlada` | Proporção de pacientes com HbA1c controlada | Pacientes com DM2 e HbA1c < 7.0% / Total de diabéticos monitorados | ≥ 70% |
| 🫀 **Cardio** | `MeasureCardioPAControlada` | Proporção de pacientes com PA controlada | Pacientes com HAS e PA < 140/90 mmHg / Total de hipertensos | ≥ 75% |
| 🧓 **ATENTO** | `MeasureAtento60CoberturaIVCF` | Cobertura de rastreamento de fragilidade | Idosos com IVCF-20 preenchido no ano / Total de idosos cadastrados | ≥ 80% |
| 🧓 **ATENTO** | `MeasureAtento60PlanoCuidadoFragil`| Adesão ao PTS em idosos frágeis | Idosos frágeis com plano de cuidado ativo / Total de frágeis | ≥ 90% |
| 🏡 **FamilIAr** | `MeasureFamiliarAtivaControleDor` | Taxa de alívio rápido de dor intensa | Episódios de dor ≥7 controlados em 24h / Total de crises de dor | ≥ 85% |
| 🏡 **FamilIAr** | `MeasureFamiliarAtivaSobrecargaCuidador`| Proporção de cuidadores em sobrecarga severa | Cuidadores com Zarit ≥ 17 / Total de cuidadores acompanhados | < 20% |
| 🌾 **AgroSUS** | `AgroSUSMeasureAdesaoPeriodicidade`| Adesão ao monitoramento de colinesterase | Trabalhadores com colinesterase nos últimos 6m / Total elegíveis | ≥ 80% |
| 🌾 **AgroSUS** | `AgroSUSMeasureCoberturaAnamnese`| Cobertura da anamnese ocupacional | Trabalhadores com anamnese aplicada / Total de produtores | ≥ 85% |
