# Sinais vitais e dispositivos IoT

Os sinais vitais e as medidas antropométricas podem ser coletados por qualquer cenário da plataforma mareIA, digitados pelo profissional ou recebidos de um dispositivo de medição. O registro FHIR é o mesmo nos dois casos; a diferença é que a leitura de um aparelho também identifica o equipamento que a produziu.

## Recursos e ligações

`Patient` ← `Observation` → `DeviceMetric` → `Device`

| Recurso | Perfil | Papel |
|---|---|---|
| Observation | [mareia-observation-vital](StructureDefinition-mareia-observation-vital.html) (base), especializado por [atento60-observation-iot-vital](StructureDefinition-atento60-observation-iot-vital.html) e [atento-cardio-observation-vital](StructureDefinition-atento-cardio-observation-vital.html) | A medição: código LOINC, valor em UCUM, momento da medição e, se veio de aparelho, `device` → DeviceMetric |
| DeviceMetric | [mareia-devicemetric](StructureDefinition-mareia-devicemetric.html) | O que o aparelho mede (LOINC + UCUM), ligado ao Device por `source`. Um por aparelho e tipo de medida |
| Device | [mareia-device](StructureDefinition-mareia-device.html) | O aparelho: número de série, tipo (SNOMED CT), fabricante e modelo. Um por aparelho |

## Sinais vitais ([mareia-vital-loinc-vs](ValueSet-mareia-vital-loinc-vs.html))

| Medida | LOINC | Unidade UCUM |
|---|---|---|
| Pressão sistólica | 8480-6 | `mm[Hg]` |
| Pressão diastólica | 8462-4 | `mm[Hg]` |
| Frequência cardíaca | 8867-4 | `/min` |
| Saturação de O₂ (oximetria de pulso) | 59408-5 | `%` |
| Temperatura corporal | 8310-5 | `Cel` |
| Peso corporal | 29463-7 | `kg` |
| Estatura | 8302-2 | `cm` |
| Circunferência da cintura | 8280-0 | `cm` |
| IMC | 39156-5 | `kg/m2` |
| Glicemia capilar (glicosímetro) | 41653-7 | `mg/dL` |

## Tipos de dispositivo ([mareia-device-type-vs](ValueSet-mareia-device-type-vs.html))

| Aparelho | SNOMED CT |
|---|---|
| Glicosímetro | 337414009 |
| Oxímetro de pulso | 448703006 |
| Esfigmomanômetro | 39690000 |
| Balança | 5042005 |
| Termômetro | 706157006 |
| Estadiômetro | 24311000205101 |
| Fita métrica | 51791000 |

## Regras para quem integra dispositivos

1. **Número de série estável e único** por aparelho, em `Device.identifier` com sistema `https://mareia.nutes.ufpe.br/fhir/sid/device-serial`.
2. **Um Device por aparelho:** criar com criação condicional (`ifNoneExist: identifier=https://mareia.nutes.ufpe.br/fhir/sid/device-serial|<serial>`), para que envios seguintes reaproveitem o registro.
3. **Um DeviceMetric por aparelho e tipo de medida**, identificado por `<serial>-<loinc>` (ex.: `GLI-0001-41653-7`) no sistema `https://mareia.nutes.ufpe.br/fhir/sid/device-metric` e criado com criação condicional (`ifNoneExist: identifier=https://mareia.nutes.ufpe.br/fhir/sid/device-metric|<serial>-<loinc>`). No Bundle `transaction`, o `source` aponta para o `fullUrl` do Device criado na mesma transação.
4. **Horário da medição** em `effectiveDateTime`, com fuso (ex.: `2026-10-05T10:00:00-03:00`), conforme informado pelo aparelho.
5. **Valor já na unidade UCUM da tabela**, com `valueQuantity.system = http://unitsofmeasure.org` e `valueQuantity.code` preenchido (ex.: glicemia em `mg/dL`, não `mmol/L`).
6. Medidas **digitadas** não têm `device`.

## Exemplos

- [Glicosímetro (Device)](Device-mareia-device-glucometer-example.html)
- [Glicemia capilar do glicosímetro (DeviceMetric)](DeviceMetric-mareia-devicemetric-glucose-example.html)
- [Glicemia por glicosímetro — ATENTO 60+](Observation-atento60-iot-glucose-example.html)
- [Glicemia por glicosímetro — CardioRemoto](Observation-cardio-iot-glucose-example.html)
