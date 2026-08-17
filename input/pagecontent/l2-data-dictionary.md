# 5. Elementos de Dados Centrais (Dicionário de Dados)

O DAK do **CardioRemoto** mapeia os elementos clínicos centrais para terminologias padronizadas de interoperabilidade em saúde (**LOINC**, **CID-10** e **UCUM**).

---

### Tabela de Dados Antropométricos e Sinais Vitais (IoT)

| ID do Elemento | Rótulo (PT-BR) | Tipo | Unidade / Valores | Código Padrão | Obrigatório |
|---|---|---|---|---|---|
| `body_weight` | Peso Corporal | Quantity | kg | LOINC: 29463-7 | Não |
| `body_height` | Altura | Quantity | cm | LOINC: 8302-2 | Não |
| `bmi` | Índice de Massa Corporal (IMC) | Quantity | kg/m² | LOINC: 39156-5 | Não (auto) |
| `waist_circ` | Circunferência da Cintura | Quantity | cm | LOINC: 8280-0 | Não |
| `sbp` | Pressão Arterial Sistólica | Quantity | mmHg | LOINC: 8480-6 | Não |
| `dbp` | Pressão Arterial Diastólica | Quantity | mmHg | LOINC: 8462-4 | Não |
| `heart_rate` | Frequência Cardíaca | Quantity | bpm | LOINC: 8867-4 | Não |
| `capillary_glucose` | Glicemia Capilar | Quantity | mg/dL | LOINC: 14743-9 | Não |

---

### Tabela de Exames Laboratoriais

| ID do Elemento | Rótulo (PT-BR) | Tipo | Unidade | Código Padrão | Obrigatório |
|---|---|---|---|---|---|
| `fasting_glucose` | Glicemia de Jejum | Quantity | mg/dL | LOINC: 1558-6 | Não |
| `hba1c` | Hemoglobina Glicada (HbA1c) | Quantity | % | LOINC: 4548-4 | Não |
| `total_cholesterol` | Colesterol Total | Quantity | mg/dL | LOINC: 2093-3 | Não |
| `hdl_cholesterol` | Colesterol HDL | Quantity | mg/dL | LOINC: 2085-9 | Não |
| `ldl_cholesterol` | Colesterol LDL | Quantity | mg/dL | LOINC: 13457-7 | Não |
| `triglycerides` | Triglicerídeos | Quantity | mg/dL | LOINC: 2571-8 | Não |
| `serum_creatinine` | Creatinina Sérica | Quantity | mg/dL | LOINC: 2160-0 | Não |
| `serum_urea` | Ureia Sérica | Quantity | mg/dL | LOINC: 3094-0 | Não |
| `tsh` | TSH | Quantity | uIU/mL | LOINC: 3016-3 | Não |
| `tgo` | TGO / AST | Quantity | U/L | LOINC: 1920-8 | Não |
| `tgp` | TGP / ALT | Quantity | U/L | LOINC: 1742-6 | Não |
| `cpk` | CPK | Quantity | U/L | LOINC: 2157-6 | Não |
| `egfr_ckd_epi` | Taxa de Filtração Glomerular (CKD-EPI) | Quantity | mL/min/1.73m² | LOINC: 33914-3 | Não (auto) |
| `non_hdl_cholesterol` | Colesterol Não-HDL | Quantity | mg/dL | LOINC: 43396-1 | Não (auto) |

---

### Tabela de Dados Demográficos e Fatores de Risco

| ID do Elemento | Rótulo (PT-BR) | Tipo | Valores Permitidos | Código / Sistema |
|---|---|---|---|---|
| `dx_dm` | Diagnóstico de Diabetes Mellitus | Boolean | true / false | CID-10: E11 |
| `dx_has` | Diagnóstico de Hipertensão Arterial | Boolean | true / false | CID-10: I10 |
| `hx_cv_event` | Histórico de Evento Cardiovascular | Code | nenhum, iam, avc, dap, outro | Local: `cardio-cv-event` |
| `use_statin` | Uso de Estatina | Boolean | true / false | Local |
| `use_antihypertensive` | Uso de Anti-hipertensivo | Boolean | true / false | Local |
| `smoking_status` | Tabagismo | Code | nao-fumante, ex-fumante, fumante | Local: `cardio-smoking-status` |
| `physical_activity` | Atividade Física | Code | nao-praticante, raramente, regularmente, frequentemente | Local: `cardio-activity-level` |
