# 5. Dicionário de Dados Clínicos e Computáveis (DAK L2)

O **Dicionário de Dados do ecossistema mareIA** padroniza a representação formal de todas as variáveis coletadas em campo, dispositivos biomédicos certificados e laudos laboratoriais, mapeadas para as terminologias médicas canônicas internacionais (**LOINC**, **SNOMED CT**, **CID-10**, **UCUM**) e identificadores do **SUS**.

---

## 5.1 Identificadores e Dados Demográficos Centrais (Core mareIA)

Todos os pathways compartilham a estrutura canônica de identificação do cidadão no SUS:

| Campo | Nome Clínico / Descrição | Tipo FHIR | Sistema / Terminologia | Formato / Valores Permitidos | Obrigatoriedade |
|---|---|---|---|---|---|
| `cns` | Cartão Nacional de Saúde (CNS) | `Identifier` | `https://saude.gov.br/fhir/sid/cns` | 15 dígitos numéricos (iniciados em 1, 2, 7, 8 ou 9) | Obrigatório no SUS |
| `cpf` | Cadastro de Pessoas Físicas (CPF) | `Identifier` | `https://receita.fazenda.gov.br/fhir/sid/cpf` | 11 dígitos numéricos com validação de dígitos verificadores | Obrigatório |
| `offlineSyncId` | Identificador UUID Offline | `Identifier` | `https://mareia.saude.gov.br/fhir/sid/offline-id` | UUID v4 (RFC 4122) para coleta sem conectividade | Obrigatório (ACS) |
| `nomeCompleto` | Nome Civil Completo | `HumanName.text` | String UTF-8 | Texto livre (sem abreviações artificiais) | Obrigatório |
| `nomeSocial` | Nome Social (se aplicável) | `HumanName.text` | String UTF-8 | Conforme autodeclaração do usuário | Opcional |
| `dataNascimento` | Data de Nascimento | `date` | ISO 8601 | `YYYY-MM-DD` | Obrigatório |
| `sexo` | Sexo Administrativo | `code` | `http://hl7.org/fhir/administrative-gender` | `male` \| `female` \| `other` \| `unknown` | Obrigatório |
| `racaCor` | Raça/Cor Autodeclarada SUS | `Extension` | `https://saude.gov.br/fhir/ValueSet/BRRacaCor` | `01` Branca, `02` Preta, `03` Parda, `04` Amarela, `05` Indígena, `99` Sem informação | Obrigatório SUS |
| `municipioIBGE` | Código do Município de Residência | `Address.city` | `https://ibge.gov.br/cidades` | Código IBGE com 7 dígitos (ex: `2507507` João Pessoa) | Obrigatório |
| `telefone` | Telefone / Celular de Contato | `ContactPoint.value` | E.164 | `+55 (DD) 9XXXX-XXXX` | Recomendado |
| `cnes` | Código CNES do Estabelecimento | `Identifier` | `https://saude.gov.br/fhir/sid/cnes` | 7 dígitos numéricos | Obrigatório |

---

## 5.2 🧓 ATENTO 60+ — Dicionário Completo do IVCF-20 e Sinais Vitais

### 5.2.1 Os 20 Itens do Questionário IVCF-20 (`Questionnaire/atento60-ivcf20`)

O **Índice de Vulnerabilidade Clínico-Funcional (IVCF-20)** avalia 8 dimensões multidimensionais da pessoa idosa. Cada item possui pontuação ordinal específica e tetos de pontuação para grupos funcionais:

| LinkId | Dimensão Clínica | Texto da Pergunta | Tipo | Código LOINC / CS | Opções de Resposta e Pontuação Ordinal (`ordinalValue`) | Regra de Grupo / Teto |
|---|---|---|---|---|---|---|
| `q01` | **Idade** | Qual é a sua idade? | `choice` | `IvcfItemCS#idade` | • 60 a 74 anos (`0` pts)<br>• 75 a 84 anos (`1` pt)<br>• ≥ 85 anos (`3` pts) | Pontuação direta |
| `q02` | **Autopercepção** | Comparando com pessoas de sua idade, como você diria que é sua saúde? | `choice` | `IvcfItemCS#saude` | • Excelente, muito boa ou boa (`0` pts)<br>• Regular ou ruim (`1` pt) | Pontuação direta |
| `q03` | **AVD Instrumental** | Por causa da saúde, deixou de fazer compras? | `choice` | `IvcfItemCS#avdi-compras` | • Não (`0` pts)<br>• Sim (`4` pts) | **Grupo AVD-I (q03–q05)**:<br>Teto máximo do grupo = **4 pontos** |
| `q04` | **AVD Instrumental** | Deixou de controlar seu dinheiro, gastos ou contas? | `choice` | `IvcfItemCS#avdi-dinheiro` | • Não (`0` pts)<br>• Sim (`4` pts) |
| `q05` | **AVD Instrumental** | Deixou de realizar pequenos trabalhos domésticos? | `choice` | `IvcfItemCS#avdi-domestico` | • Não (`0` pts)<br>• Sim (`4` pts) |
| `q06` | **AVD Básica** | Por causa da saúde, deixou de tomar banho sozinho? | `choice` | `IvcfItemCS#avdb-banho` | • Não (`0` pts)<br>• Sim (`6` pts) | Pontuação direta (6 pts = dependência funcional básica) |
| `q07` | **Cognição** | Algum familiar ou amigo falou que você está esquecido? | `choice` | `IvcfItemCS#cognicao-amigo` | • Não (`0` pts)<br>• Sim (`1` pt) | **Grupo Cognição (q07–q09)**:<br>Soma direta dos pontos |
| `q08` | **Cognição** | Esse esquecimento está piorando nos últimos meses? | `choice` | `IvcfItemCS#cognicao-piora` | • Não (`0` pts)<br>• Sim (`1` pt) |
| `q09` | **Cognição** | Esse esquecimento impede você de realizar alguma atividade diária? | `choice` | `IvcfItemCS#cognicao-impede` | • Não (`0` pts)<br>• Sim (`2` pts) |
| `q10` | **Humor** | No último mês, sentiu-se triste, desanimado ou sem esperança? | `choice` | `IvcfItemCS#humor-triste` | • Não (`0` pts)<br>• Sim (`1` pt) | **Grupo Humor (q10–q11)**:<br>Soma direta (máx 2 pts) |
| `q11` | **Humor** | No último mês, perdeu o interesse ou prazer por atividades que antes gostava? | `choice` | `IvcfItemCS#humor-interesse` | • Não (`0` pts)<br>• Sim (`1` pt) |
| `q12` | **Alcance / Membros Sup.** | Tem dificuldade para elevar os braços acima do nível dos ombros? | `choice` | `IvcfItemCS#mobilidade-alcance` | • Não (`0` pts)<br>• Sim (`1` pt) | Pontuação direta |
| `q13` | **Preensão Palmar** | Tem dificuldade para manusear ou segurar pequenos objetos? | `choice` | `IvcfItemCS#mobilidade-preensao` | • Não (`0` pts)<br>• Sim (`1` pt) | Pontuação direta |
| `q14` | **Mobilidade / Marcha** | Tem dificuldade para caminhar dentro de casa sem ajuda? | `choice` | `IvcfItemCS#mobilidade-marcha` | • Não (`0` pts)<br>• Sim (`2` pts) | **Grupo Mobilidade (q14–q16)**:<br>Teto máximo do grupo = **2 pontos** |
| `q15` | **Transferência** | Tem dificuldade para levantar de uma cadeira sem apoiar os braços? | `choice` | `IvcfItemCS#mobilidade-levantar` | • Não (`0` pts)<br>• Sim (`2` pts) |
| `q16` | **Quedas** | Teve duas ou mais quedas no último ano? | `choice` | `IvcfItemCS#mobilidade-quedas` | • Não (`0` pts)<br>• Sim (`2` pts) |
| `q17` | **Comunicação / Visão** | Tem dificuldade para enxergar de perto ou de longe mesmo com óculos? | `choice` | `IvcfItemCS#comunicacao-visao` | • Não (`0` pts)<br>• Sim (`1` pt) | Pontuação direta |
| `q18` | **Comunicação / Audição** | Tem dificuldade para ouvir mesmo com aparelho auditivo? | `choice` | `IvcfItemCS#comunicacao-audicao` | • Não (`0` pts)<br>• Sim (`1` pt) | Pontuação direta |
| `q19` | **Comorbidades Múltiplas** | Usa 5 ou mais medicamentos diferentes todos os dias (Polifarmácia)? | `choice` | `IvcfItemCS#comorb-polifarmacia` | • Não (`0` pts)<br>• Sim (`2` pts) | **Grupo Comorbidades (q19–q20)**:<br>Teto máximo do grupo = **4 pontos** |
| `q20` | **Internação Recente** | Esteve internado em hospital nos últimos 6 meses? | `choice` | `IvcfItemCS#comorb-internacao` | • Não (`0` pts)<br>• Sim (`4` pts) |

### 5.2.2 Parâmetros Fisiológicos e Testes Funcionais do ATENTO 60+

| Elemento | Código LOINC | Descrição Semântica | Unidade UCUM | Faixa Normal | Critério de Alerta |
|---|---|---|---|---|---|
| **Escore Total IVCF-20** | `96763-8` | Vulnerability index total score | `{score}` (0–40) | 0 a 6 (Robusto) | ≥ 7 (Risco) / ≥ 15 (Frágil) |
| **Força de Preensão (Dinamometria)** | `76251-8` | Hand grip strength | `kg` | H: ≥ 27 kg / M: ≥ 16 kg | H: < 27 kg / M: < 16 kg (Sarcopenia provável) |
| **Velocidade de Marcha (4m)** | `96764-6` | Gait speed timed 4m | `m/s` | ≥ 0.8 m/s | < 0.8 m/s (Fragilidade / Risco de queda) |
| **Circunferência da Panturrilha** | `96765-3` | Calf circumference | `cm` | ≥ 31 cm | < 31 cm (Depleção de massa muscular) |
| **Saturação de Oxigênio (SpO2)** | `59408-5` | Oxygen saturation in Arterial blood | `%` | 95% a 100% | < 92% (Alerta de hipoxemia) |
| **Índice de Massa Corporal (IMC)** | `39156-5` | Body mass index | `kg/m2` | 22.0 a 27.0 (Idoso) | < 22.0 (Baixo peso) / > 27.0 (Sobrepeso) |

---

## 5.3 🫀 CardioRemoto — Dicionário de Triagem, IoT e Exames Laboratoriais

### 5.3.1 Triagem Clínica e Fatores de Risco (`Questionnaire/CardioTriage`)

| LinkId | Variável | Código LOINC / SCT | Tipo | Valores Permitidos | Impacto no Risco |
|---|---|---|---|---|---|
| `has-diagnostico` | Diagnóstico de HAS | SCT `38341003` | `boolean` | `true` \| `false` | Fator maior de risco CV |
| `dm-diagnostico` | Diagnóstico de DM2 | SCT `44054006` | `boolean` | `true` \| `false` | Fator maior de risco CV |
| `dm-tempo` | Tempo de Diagnóstico DM2 | LOINC `68555-2` | `quantity` | Anos (`a`) | > 10 anos eleva estrato para Alto Risco |
| `uso-insulina` | Uso Contínuo de Insulina | LOINC `67713-8` | `boolean` | `true` \| `false` | Indica complexidade glicêmica |
| `tabagismo` | Status Tabágico | LOINC `72166-2` | `choice` | • Nunca fumou<br>• Ex-fumante<br>• Fumante ativo | Tabagismo ativo duplica risco coronariano |
| `adesao-medicamentosa` | Adesão ao Tratamento (Morisky-4) | LOINC `89555-7` | `choice` | • Alta (0 erros)<br>• Média (1-2 erros)<br>• Baixa (3-4 erros) | Baixa adesão aciona teleconsulta de enfermagem |
| `sintomas-precordiais` | Dor no Peito / Angina | SCT `29857009` | `boolean` | `true` \| `false` | `true` = Alerta Vermelho Imediato |

### 5.3.2 Sinais Vitais IoT e Exames Laboratoriais do CardioRemoto

| Parâmetro | Código LOINC | Descrição | Unidade UCUM | Meta Terapêutica SUS | Estrato Amarelo (Moderado) | Estrato Vermelho (Grave / Emergência) |
|---|---|---|---|---|---|---|
| **PA Sistólica** | `8480-6` | Systolic blood pressure | `mm[Hg]` | < 130 mmHg (com DM) ou < 140 | 140 a 179 mmHg | **≥ 180 mmHg** ou crise aguda |
| **PA Diastólica** | `8462-4` | Diastolic blood pressure | `mm[Hg]` | < 80 mmHg (com DM) ou < 90 | 90 a 109 mmHg | **≥ 110 mmHg** |
| **Glicemia Capilar Jejum** | `14743-9` | Glucose Capillary fasting | `mg/dL` | 70 a 130 mg/dL | 131 a 250 mg/dL | **> 300 mg/dL** ou **< 70 mg/dL** (Hipoglicemia) |
| **Glicemia Pós-Prandial** | `14745-4` | Glucose Capillary 2h post-meal | `mg/dL` | < 180 mg/dL | 181 a 299 mg/dL | **> 300 mg/dL** |
| **Frequência Cardíaca** | `8867-4` | Heart rate | `/min` | 60 a 100 bpm | 50–59 ou 101–120 bpm | **< 50 bpm** (Bradicardia) / **> 120 bpm** |
| **Hemoglobina Glicada (HbA1c)**| `4548-4` | HbA1c MFr Bld | `%` | < 7.0% (Idoso frágil: < 8.0%)| 7.0% a 9.0% | **> 9.0%** (Descontrole glicêmico grave) |
| **Colesterol LDL** | `2089-1` | Cholesterol in LDL | `mg/dL` | < 70 (Alto Risco) / < 50 (Muito Alto) | 100 a 159 mg/dL | **≥ 160 mg/dL** |
| **Colesterol HDL** | `2085-9` | Cholesterol in HDL | `mg/dL` | H: > 40 mg/dL / M: > 50 mg/dL| H: 30–39 / M: 40–49 | **< 30 mg/dL** |
| **Triglicerídeos** | `2571-8` | Triglyceride in Serum | `mg/dL` | < 150 mg/dL (Jejum) | 150 a 499 mg/dL | **≥ 500 mg/dL** (Risco de Pancreatite) |
| **Creatinina Sérica** | `2160-0` | Creatinine in Serum | `mg/dL` | 0.6 a 1.2 mg/dL | 1.3 a 1.9 mg/dL | **≥ 2.0 mg/dL** ou elevação aguda > 50% |
| **Taxa de Filtração Glomerular**| `48642-3` | eGFR CKD-EPI (2021) | `mL/min/{1.73_m2}`| ≥ 60 mL/min/1.73m² | 30 a 59 (DRC Estágio 3) | **< 30 mL/min/1.73m²** (DRC Estágio 4/5) |
| **Relação Albumina/Creatinina**| `14959-1` | Albumin/Creatinine in Urine | `mg/g` | < 30 mg/g (Normoalbuminúria) | 30 a 299 (Microalbuminúria)| **≥ 300 mg/g** (Macroalbuminúria) |

---

## 5.4 🏡 FamilIAr_Ativa — Dicionário de Sintomas ESAS, Sobrecarga Zarit e IA/XAI

### 5.4.1 Escala de Avaliação de Sintomas de Edmonton (ESAS — 0 a 10)

| LinkId | Sintoma Avaliado | Código LOINC | Escala Numérica | Classificação Clínica | Ação do Protocolo |
|---|---|---|---|---|---|
| `esas-01` | **Dor** | `72514-3` | `0` (Sem dor) a `10` (Pior dor possível) | 0–3 Leve · 4–6 Moderada · **7–10 Intensa** | Se ≥ 7: Alerta RA-01 (Ajuste álgico urgente) |
| `esas-02` | **Cansaço / Fadiga** | `54647-3` | `0` (Sem cansaço) a `10` (Pior cansaço) | 0–3 Leve · 4–6 Moderado · **7–10 Severo** | Avaliar anemia, hipoxemia e sobrecarga |
| `esas-03` | **Sonolência** | `72511-9` | `0` (Sem sonolência) a `10` (Pior sonolência) | 0–3 Leve · 4–6 Moderada · **7–10 Excessiva** | Avaliar toxicidade de opioides/sedativos |
| `esas-04` | **Náusea** | `72512-7` | `0` (Sem náusea) a `10` (Pior náusea) | 0–3 Leve · 4–6 Moderada · **7–10 Intratável** | Se ≥ 7: Antiemético parenteral / visita |
| `esas-05` | **Falta de Apetite** | `72510-1` | `0` (Sem falta) a `10` (Pior falta de apetite) | 0–3 Leve · 4–6 Moderada · **7–10 Anorexia** | Orientação nutricional paliativa |
| `esas-06` | **Falta de Ar (Dispneia)**| `72513-5` | `0` (Sem dispneia) a `10` (Pior falta de ar) | 0–3 Leve · 4–6 Moderada · **7–10 Asfixia** | Se ≥ 7: Alerta RA-01 (Morfina/O2 imediato) |
| `esas-07` | **Depressão / Tristeza** | `72509-3` | `0` (Sem tristeza) a `10` (Pior depressão) | 0–3 Leve · 4–6 Moderada · **7–10 Sofrimento** | Acionar Psicologia / Terapia de suporte |
| `esas-08` | **Ansiedade / Nervosismo**| `72508-5` | `0` (Sem ansiedade) a `10` (Pior ansiedade) | 0–3 Leve · 4–6 Moderada · **7–10 Pânico** | Manejo ansiolítico / Acolhimento familiar |
| `esas-09` | **Mal-estar Geral** | `72507-7` | `0` (Melhor possível) a `10` (Pior possível) | 0–3 Bom · 4–6 Regular · **7–10 Sofrimento global** | Indicador composto de qualidade de vida |
| `esas-10` | **Outro Sintoma (Livre)** | `72506-9` | `0` a `10` (ex: constipação, insônia, prurido) | Texto livre + escore 0 a 10 | Especificar etiologia |

### 5.4.2 Escala de Sobrecarga do Cuidador de Zarit (Versão Breve e Completa)

| LinkId | Dimensão de Sobrecarga | Código CS | Tipo | Opções de Resposta | Pontuação |
|---|---|---|---|---|---|
| `zarit-tempo` | Sente que não tem tempo suficiente para si mesmo? | `ZaritItemCS#tempo` | `choice` | • Nunca (`0`) · Raramente (`1`) · Às vezes (`2`) · Frequentemente (`3`) · Quase sempre (`4`) | 0 a 4 |
| `zarit-estresse` | Sente-se estressado por ter que cuidar do paciente e de outras responsabilidades? | `ZaritItemCS#estresse` | `choice` | • Nunca (`0`) · Raramente (`1`) · Às vezes (`2`) · Frequentemente (`3`) · Quase sempre (`4`) | 0 a 4 |
| `zarit-saude` | Sente que sua saúde foi prejudicada por causa do seu papel como cuidador? | `ZaritItemCS#saude` | `choice` | • Nunca (`0`) · Raramente (`1`) · Às vezes (`2`) · Frequentemente (`3`) · Quase sempre (`4`) | 0 a 4 |
| `zarit-esgotamento`| Sente-se exausto ou sem forças para continuar cuidando? | `ZaritItemCS#exaustao` | `choice` | • Nunca (`0`) · Raramente (`1`) · Às vezes (`2`) · Frequentemente (`3`) · Quase sempre (`4`) | 0 a 4 |
| `zarit-score-total`| **Escore Total de Zarit (0 a 88)** | `ZaritItemCS#score-total` | `quantity` | • **0 a 20:** Sobrecarga Leve ou Ausente<br>• **21 a 40:** Sobrecarga Moderada<br>• **41 a 88:** **Sobrecarga Severa / Esgotamento** | Alerta RA-02 se ≥ 41 |

### 5.4.3 Variáveis e Atributos de Inteligência Artificial Explicável (XAI)

| Campo | Descrição Semântica | Tipo FHIR | Valores / Estrutura | Significado Clínico |
|---|---|---|---|---|
| `xai-prob-descompensacao` | Probabilidade Preditiva de Crise nas próximas 48h | `Observation.valueDecimal` | `0.00` a `1.00` (0% a 100%) | Se > 0.70: Dispara Alerta Preditivo |
| `xai-top-features` | 3 Principais Fatores Contribuintes (SHAP Values) | `Observation.component` | Vetor de strings com pesos (ex: `Dor (+0.35)`, `Dispneia (+0.25)`, `Zarit (+0.18)`) | Justifica auditabilidade médica da decisão |
| `xai-confianca-modelo` | Índice de Confiança do Modelo | `Observation.component` | `0.00` a `1.00` | Nível de certeza estatística do algoritmo |

---

## 5.5 🌾 AgroSUS — Dicionário de Anamnese Ocupacional e Vigilância Toxicológica

### 5.5.1 Anamnese Ocupacional Rural (`Questionnaire/AgroSUSAnamnese`)

| LinkId | Variável | Código LOINC / CID | Tipo | Valores Permitidos e Detalhamento |
|---|---|---|---|---|
| `agro-cultura` | Tipo de Cultivo Principal | SCT `308764002` | `choice` | • Hortaliças / Folhosas · Tomate · Café · Fruticultura · Grãos (Soja/Milho) · Cana-de-açúcar · Outro |
| `agro-defensivos` | Defensivos Químicos Manipulados | SCT `418706001` | `open-choice` | Lista aberta padronizada de princípios ativos comerciais |
| `agro-classe-quimica` | Classe Toxicológica Principal | SCT `26400003` | `choice` | • **Organofosforados** (Inibidores da Colinesterase)<br>• **Carbamatos** (Inibidores Reversíveis)<br>• **Piretroides** (Neurotóxicos de canais de sódio)<br>• **Herbicidas / Glifosato**<br>• **Fungicidas Ditiocarbamatos** |
| `agro-forma-aplicacao` | Forma de Pulverização | SCT `42425007` | `choice` | • Pulverizador Costal Manual (`maior contato dérmico`)<br>• Pulverizador Costal Motorizado<br>• Tratorizado com Barra<br>• Pistola Manual |
| `agro-frequencia-uso` | Frequência de Aplicação | LOINC `89555-7` | `choice` | • Diária · Semanal · Quinzenal · Mensal · Sazonal (safra) |
| `agro-epi-mascara` | Uso de Máscara / Respirador com Filtro | SCT `425268008` | `choice` | • Sempre com filtro químico carvão ativado (`0`) · Máscara de pano/cirúrgica inadequada (`3`) · Não usa (`5`) |
| `agro-epi-luvas` | Uso de Luvas de Proteção Nitrílica | SCT `425268009` | `choice` | • Luvas nitrílicas adequadas (`0`) · Luvas de pano/látex comum (`3`) · Não usa (`5`) |
| `agro-epi-macacao` | Uso de Macacão Hidrorrepelente | SCT `425268010` | `choice` | • Macacão com CA válido (`0`) · Roupa de algodão comum (`4`) · Sem camisa / bermuda (`6`) |
| `agro-epi-botas` | Uso de Botas de PVC Impermeáveis | SCT `425268011` | `choice` | • Bota de PVC cano longo (`0`) · Chinelo / sapato de tecido (`5`) |
| `agro-lavagem-epi` | Local e Forma de Lavagem das Roupas | SCT `306161008` | `choice` | • Lavadas separadas das roupas da família com luvas (`0`) · Lavadas juntas com as roupas dos filhos/cônjuge (`4`) |
| `agro-descarte-embalagens`| Destino das Embalagens Vazias | SCT `418706002` | `choice` | • Tríplice lavagem e devolução ao posto de recebimento licenciado (`0`) · Queimadas no terreno (`4`) · Reutilizadas para armazenar água/alimentos (`6`) |
| `agro-sintomas-agudos` | Sintomas Agudos Após Aplicação | SCT `248536006` | `multi-choice`| • Miose / Visão turva · Sialorreia (excesso saliva) · Náuseas / Vômitos · Cólicas abdominais / Diarreia · Fasciculações musculares · Tontura / Cefaleia intensa · Dispneia / Broncoespasmo · Convulsão |

### 5.5.2 Vigilância Laboratorial da Colinesterase (NR-7)

| Exame | Código LOINC | Unidade UCUM | Valor Basal Pré-Exposição | Limiar de Atenção (NR-7) | Limiar Crítico / Intoxicação |
|---|---|---|---|---|---|
| **Colinesterase Eritrocitária (AChE)** | `2099-0` | `U/L` ou `U/g Hb` | Estabelecido no exame pré-admissional (100%) | **Queda ≥ 30%** em relação ao basal individual | **Queda ≥ 50%** em relação ao basal ou sintomas agudos |
| **Colinesterase Plasmática (BChE / Pseudocolinesterase)** | `2100-6` | `U/L` | Estabelecido no exame pré-admissional (100%) | **Queda ≥ 50%** em relação ao basal individual | **Queda ≥ 70%** em relação ao basal |
| **Código CID-10 de Intoxicação** | CID-10 `T60.0` | — | Efeito tóxico de inseticidas organofosforados e carbamatos | Notificação compulsória imediata no SINAN |
