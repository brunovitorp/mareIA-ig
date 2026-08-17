# 5. Elementos de Dados Centrais (Dicionário de Dados)

O Dicionário de Dados do ecossistema **mareIA** estabelece o mapeamento formal entre variáveis clínicas, tipos de dados e terminologias médicas internacionais (**LOINC**, **CID-10**, **SNOMED CT** e **UCUM**).

---

## 5.1 Elementos de Dados Transversais (Core mareIA)

| Campo | Descrição | Tipo FHIR | Sistema / Terminologia |
|---|---|---|---|
| `cns` | Cartão Nacional de Saúde do Cidadão | `Identifier` | `https://saude.gov.br/fhir/sid/cns` |
| `cpf` | Cadastro de Pessoas Físicas | `Identifier` | `https://receita.fazenda.gov.br/fhir/sid/cpf` |
| `nomeCompleto` | Nome civil oficial do paciente | `HumanName.text` | String (ASCII / UTF-8) |
| `dataNascimento`| Data de nascimento | `date` | Formato YYYY-MM-DD |
| `sexo` | Sexo administrativo | `code` | `http://hl7.org/fhir/administrative-gender` |
| `racaCor` | Raça ou cor autodeclarada do SUS | `Extension` | `https://saude.gov.br/fhir/ValueSet/BRRacaCor` |
| `offlineSyncId`| Identificador temporário UUID | `Identifier` | `https://mareia.saude.gov.br/fhir/sid/offline-id` |

---

## 5.2 Elementos Clínicos por Pathway

### 🫀 CardioRemoto (DM / HAS)
- **PA Sistólica:** LOINC `8480-6` (`Systolic blood pressure`, unidade `mm[Hg]`).
- **PA Diastólica:** LOINC `8462-4` (`Diastolic blood pressure`, unidade `mm[Hg]`).
- **Frequência Cardíaca:** LOINC `8867-4` (`Heart rate`, unidade `/min`).
- **Glicemia Capilar:** LOINC `14743-9` (`Glucose [Mass/volume] in Capillary blood`, unidade `mg/dL`).
- **Hemoglobina Glicada:** LOINC `4548-4` (`HbA1c MFr Bld`, unidade `%`).
- **LDL Colesterol:** LOINC `2089-1` (`Cholesterol in LDL [Mass/volume] in Serum or Plasma`, unidade `mg/dL`).
- **Creatinina Sérica:** LOINC `2160-0` (`Creatinine [Mass/volume] in Serum or Plasma`, unidade `mg/dL`).

### 🧓 ATENTO 60+ (Pessoa Idosa)
- **Escore Total IVCF-20:** LOINC `96763-8` / CodeSystem `IvcfItemCS` (Escore total 0–40 pontos).
- **Classificação Clínico-Funcional:** CodeSystem `IvcfRiskCS` (`robusto`, `risco-fragilizacao`, `fragil`).
- **Força de Preensão Palmar (Dinamometria):** LOINC `76251-8` (`Hand grip strength`, unidade `kg`).
- **Velocidade de Marcha (4 metros):** LOINC `96764-6` (`Gait speed`, unidade `m/s`).

### 🏡 FamilIAr_Ativa (Cuidados Paliativos)
- **Escore de Dor (ESAS):** LOINC `72514-3` (`Pain severity - 0-10 verbal numeric rating scale`).
- **Escore de Fadiga (ESAS):** LOINC `54647-3` (`Fatigue severity scale`).
- **Escore de Dispneia (ESAS):** LOINC `72513-5` (`Dyspnea severity scale`).
- **Sobrecarga do Cuidador (Zarit):** CodeSystem `ZaritItemCS` / `ZaritClassCS` (`pequena-nenhuma`, `moderada`, `severa`).

### 🌾 AgroSUS (Trabalhador Rural)
- **Colinesterase Eritrocitária:** LOINC `2099-0` (`Acetylcholinesterase [Enzymatic activity/volume] in Red Blood Cells`, unidade `U/L`).
- **Colinesterase Plasmática:** LOINC `2100-6` (`Cholinesterase [Enzymatic activity/volume] in Serum or Plasma`, unidade `U/L`).
- **Variação Percentual Enzimática:** Quantidade percentual em relação ao exame basal (`%`).
- **Intoxicação por Agrotóxicos:** CID-10 `T60` (`Efeito tóxico de pesticidas`).
