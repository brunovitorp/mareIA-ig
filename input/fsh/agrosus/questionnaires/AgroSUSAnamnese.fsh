Instance: agrosus-anamnese
InstanceOf: Questionnaire
Usage: #definition
Title: "Formulário de Anamnese AgroSUS"
Description: "Formulário de anamnese ocupacional e ambiental aplicado pelo Agente Comunitário de Saúde aos pequenos produtores rurais."

* url = "https://jefersonrl.github.io/AgroSUS-FHIR/Questionnaire/agrosus-anamnese"
* version = "0.19.0"
* name = "AgroSUSAnamnese"
* title = "Formulário de Anamnese Ocupacional e Ambiental AgroSUS"
* status = #draft
* language = #pt-BR
* experimental = true
* date = "2026-07-21"
* publisher = "Fatec Ferraz de Vasconcelos"
* subjectType[0] = #Patient
* purpose = "Apoiar o registro e o acompanhamento de trabalhadores rurais expostos a defensivos agrícolas na Atenção Primária à Saúde."


// Seção 1 — Identificação do instrumento

* item[0].linkId = "identificacao-instrumento"
* item[0].text = "1. Identificação do instrumento"
* item[0].type = #group

* item[0].item[0].linkId = "id-agrosus"
* item[0].item[0].text = "Código do trabalhador (ID AgroSUS)"
* item[0].item[0].type = #string
* item[0].item[0].readOnly = true

* item[0].item[1].linkId = "numero-formulario"
* item[0].item[1].text = "Número do formulário"
* item[0].item[1].type = #string
* item[0].item[1].required = true

* item[0].item[2].linkId = "data-entrevista"
* item[0].item[2].text = "Data da entrevista"
* item[0].item[2].type = #date
* item[0].item[2].required = true

* item[0].item[3].linkId = "tipo-coleta"
* item[0].item[3].text = "Tipo de coleta"
* item[0].item[3].type = #choice
* item[0].item[3].required = true
* item[0].item[3].answerValueSet = Canonical(AgroSUSTipoColetaVS)

* item[0].item[4].linkId = "ubs-referencia"
* item[0].item[4].text = "UBS de referência"
* item[0].item[4].type = #string
* item[0].item[4].required = true

* item[0].item[5].linkId = "acs-responsavel"
* item[0].item[5].text = "ACS responsável"
* item[0].item[5].type = #string
* item[0].item[5].required = true

* item[0].item[6].linkId = "cnes-ubs"
* item[0].item[6].text = "CNES da UBS"
* item[0].item[6].type = #string
* item[0].item[6].required = true

* item[0].item[7].linkId = "ine-equipe"
* item[0].item[7].text = "Código INE da equipe"
* item[0].item[7].type = #string

* item[0].item[8].linkId = "municipio"
* item[0].item[8].text = "Município"
* item[0].item[8].type = #string
* item[0].item[8].required = true

* item[0].item[9].linkId = "bairro-localidade"
* item[0].item[9].text = "Bairro ou localidade"
* item[0].item[9].type = #string
* item[0].item[9].required = true

* item[0].item[10].linkId = "latitude"
* item[0].item[10].text = "Latitude"
* item[0].item[10].type = #decimal

* item[0].item[11].linkId = "longitude"
* item[0].item[11].text = "Longitude"
* item[0].item[11].type = #decimal

// Seção 2 — Dados pessoais do participante

* item[1].linkId = "dados-pessoais"
* item[1].text = "2. Dados pessoais do participante"
* item[1].type = #group

* item[1].item[0].linkId = "nome-completo"
* item[1].item[0].text = "Nome completo"
* item[1].item[0].type = #string
* item[1].item[0].required = true
* item[1].item[0].readOnly = true

* item[1].item[1].linkId = "cns"
* item[1].item[1].text = "Cartão Nacional de Saúde (CNS)"
* item[1].item[1].type = #string
* item[1].item[1].readOnly = true

* item[1].item[2].linkId = "cpf"
* item[1].item[2].text = "CPF"
* item[1].item[2].type = #string
* item[1].item[2].required = true
* item[1].item[2].readOnly = true

* item[1].item[3].linkId = "data-nascimento"
* item[1].item[3].text = "Data de nascimento"
* item[1].item[3].type = #date
* item[1].item[3].required = true
* item[1].item[3].readOnly = true

* item[1].item[4].linkId = "sexo"
* item[1].item[4].text = "Sexo"
* item[1].item[4].type = #choice
* item[1].item[4].required = true
* item[1].item[4].readOnly = true
* item[1].item[4].answerOption[0].valueCoding = http://hl7.org/fhir/administrative-gender#male "Male"
* item[1].item[4].answerOption[0].valueCoding.display.extension[0].url = "http://hl7.org/fhir/StructureDefinition/translation"
* item[1].item[4].answerOption[0].valueCoding.display.extension[0].extension[0].url = "lang"
* item[1].item[4].answerOption[0].valueCoding.display.extension[0].extension[0].valueCode = #pt-BR
* item[1].item[4].answerOption[0].valueCoding.display.extension[0].extension[1].url = "content"
* item[1].item[4].answerOption[0].valueCoding.display.extension[0].extension[1].valueString = "Masculino"

* item[1].item[4].answerOption[1].valueCoding = http://hl7.org/fhir/administrative-gender#female "Female"
* item[1].item[4].answerOption[1].valueCoding.display.extension[0].url = "http://hl7.org/fhir/StructureDefinition/translation"
* item[1].item[4].answerOption[1].valueCoding.display.extension[0].extension[0].url = "lang"
* item[1].item[4].answerOption[1].valueCoding.display.extension[0].extension[0].valueCode = #pt-BR
* item[1].item[4].answerOption[1].valueCoding.display.extension[0].extension[1].url = "content"
* item[1].item[4].answerOption[1].valueCoding.display.extension[0].extension[1].valueString = "Feminino"

* item[1].item[4].answerOption[2].valueCoding = http://hl7.org/fhir/administrative-gender#unknown "Unknown"
* item[1].item[4].answerOption[2].valueCoding.display.extension[0].url = "http://hl7.org/fhir/StructureDefinition/translation"
* item[1].item[4].answerOption[2].valueCoding.display.extension[0].extension[0].url = "lang"
* item[1].item[4].answerOption[2].valueCoding.display.extension[0].extension[0].valueCode = #pt-BR
* item[1].item[4].answerOption[2].valueCoding.display.extension[0].extension[1].url = "content"
* item[1].item[4].answerOption[2].valueCoding.display.extension[0].extension[1].valueString = "Não declarado"

* item[1].item[5].linkId = "raca-cor"
* item[1].item[5].text = "Raça/cor autodeclarada"
* item[1].item[5].type = #choice
* item[1].item[5].required = true
* item[1].item[5].readOnly = true
* item[1].item[5].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BRRacaCor"

* item[1].item[6].linkId = "escolaridade"
* item[1].item[6].text = "Escolaridade"
* item[1].item[6].type = #choice
* item[1].item[6].answerValueSet = Canonical(AgroSUSEscolaridadeVS)

* item[1].item[7].linkId = "telefone"
* item[1].item[7].text = "Telefone de contato"
* item[1].item[7].type = #string
* item[1].item[7].readOnly = true

* item[1].item[8].linkId = "ocupacao-cbo"
* item[1].item[8].text = "Ocupação principal (CBO)"
* item[1].item[8].type = #choice
* item[1].item[8].answerValueSet = "https://terminologia.saude.gov.br/fhir/ValueSet/BROcupacao"

* item[1].item[9].linkId = "tempo-atividade-rural"
* item[1].item[9].text = "Tempo de atividade rural, em anos"
* item[1].item[9].type = #integer

* item[1].item[10].linkId = "tempo-trabalho-defensivos"
* item[1].item[10].text = "Tempo de trabalho com defensivos agrícolas, em anos"
* item[1].item[10].type = #integer

// Seção 3 — Caracterização da propriedade rural

* item[2].linkId = "caracterizacao-propriedade"
* item[2].text = "3. Caracterização da propriedade rural"
* item[2].type = #group

* item[2].item[0].linkId = "situacao-posse"
* item[2].item[0].text = "Situação de posse da terra"
* item[2].item[0].type = #choice
* item[2].item[0].answerValueSet = Canonical(AgroSUSSituacaoPosseVS)

* item[2].item[1].linkId = "area-total-hectares"
* item[2].item[1].text = "Área total da propriedade, em hectares"
* item[2].item[1].type = #decimal

* item[2].item[2].linkId = "area-producao-hectares"
* item[2].item[2].text = "Área destinada à produção agrícola, em hectares"
* item[2].item[2].type = #decimal

* item[2].item[3].linkId = "principal-atividade-agricola"
* item[2].item[3].text = "Principal atividade agrícola"
* item[2].item[3].type = #choice
* item[2].item[3].answerValueSet = Canonical(AgroSUSAtividadeAgricolaVS)

* item[2].item[4].linkId = "tipo-producao"
* item[2].item[4].text = "Tipo de produção"
* item[2].item[4].type = #choice
* item[2].item[4].answerValueSet = Canonical(AgroSUSTipoProducaoVS)

* item[2].item[5].linkId = "culturas-produzidas"
* item[2].item[5].text = "Culturas produzidas"
* item[2].item[5].type = #string
* item[2].item[5].repeats = true

* item[2].item[6].linkId = "fontes-agua"
* item[2].item[6].text = "Fontes de água utilizadas na propriedade"
* item[2].item[6].type = #choice
* item[2].item[6].repeats = true
* item[2].item[6].answerValueSet = Canonical(AgroSUSFonteAguaVS)

// Seção 4 — Assistência técnica e responsabilidade técnica

* item[3].linkId = "assistencia-responsabilidade-tecnica"
* item[3].text = "4. Assistência técnica e responsabilidade técnica"
* item[3].type = #group

* item[3].item[0].linkId = "recebe-assistencia-tecnica"
* item[3].item[0].text = "Você recebe assistência técnica para a produção agrícola?"
* item[3].item[0].type = #boolean
* item[3].item[0].required = true

* item[3].item[1].linkId = "instituicao-assistencia"
* item[3].item[1].text = "Qual instituição presta assistência técnica?"
* item[3].item[1].type = #choice
* item[3].item[1].repeats = true
* item[3].item[1].required = true
* item[3].item[1].answerValueSet = Canonical(AgroSUSInstituicaoAssistenciaVS)
* item[3].item[1].enableWhen[0].question = "recebe-assistencia-tecnica"
* item[3].item[1].enableWhen[0].operator = #=
* item[3].item[1].enableWhen[0].answerBoolean = true

* item[3].item[2].linkId = "instituicao-assistencia-outra"
* item[3].item[2].text = "Especifique a outra instituição"
* item[3].item[2].type = #string
* item[3].item[2].required = true
* item[3].item[2].enableWhen[0].question = "instituicao-assistencia"
* item[3].item[2].enableWhen[0].operator = #=
* item[3].item[2].enableWhen[0].answerCoding = AgroSUSAssistenciaTecnicaCS#instituicao-outra

* item[3].item[3].linkId = "possui-responsavel-tecnico"
* item[3].item[3].text = "Existe um responsável técnico habilitado que acompanha sua produção?"
* item[3].item[3].type = #boolean
* item[3].item[3].required = true

* item[3].item[4].linkId = "formacao-responsavel-tecnico"
* item[3].item[4].text = "Formação do responsável técnico"
* item[3].item[4].type = #choice
* item[3].item[4].required = true
* item[3].item[4].answerValueSet = Canonical(AgroSUSFormacaoResponsavelTecnicoVS)
* item[3].item[4].enableWhen[0].question = "possui-responsavel-tecnico"
* item[3].item[4].enableWhen[0].operator = #=
* item[3].item[4].enableWhen[0].answerBoolean = true

* item[3].item[5].linkId = "formacao-responsavel-outra"
* item[3].item[5].text = "Especifique a formação do outro profissional habilitado"
* item[3].item[5].type = #string
* item[3].item[5].required = true
* item[3].item[5].enableWhen[0].question = "formacao-responsavel-tecnico"
* item[3].item[5].enableWhen[0].operator = #=
* item[3].item[5].enableWhen[0].answerCoding = AgroSUSAssistenciaTecnicaCS#formacao-outro-habilitado

* item[3].item[6].linkId = "nome-responsavel-tecnico"
* item[3].item[6].text = "Nome do responsável técnico"
* item[3].item[6].type = #string
* item[3].item[6].required = true
* item[3].item[6].enableWhen[0].question = "possui-responsavel-tecnico"
* item[3].item[6].enableWhen[0].operator = #=
* item[3].item[6].enableWhen[0].answerBoolean = true

* item[3].item[7].linkId = "registro-profissional-responsavel"
* item[3].item[7].text = "Número de registro profissional (CREA, CRBio ou outro)"
* item[3].item[7].type = #string
* item[3].item[7].required = true
* item[3].item[7].enableWhen[0].question = "possui-responsavel-tecnico"
* item[3].item[7].enableWhen[0].operator = #=
* item[3].item[7].enableWhen[0].answerBoolean = true

* item[3].item[8].linkId = "contato-responsavel-tecnico"
* item[3].item[8].text = "Telefone ou contato do responsável técnico"
* item[3].item[8].type = #string
* item[3].item[8].enableWhen[0].question = "possui-responsavel-tecnico"
* item[3].item[8].enableWhen[0].operator = #=
* item[3].item[8].enableWhen[0].answerBoolean = true

// Seção 5 — Capacitação do trabalhador

* item[4].linkId = "capacitacao-trabalhador"
* item[4].text = "5. Capacitação do trabalhador"
* item[4].type = #group

* item[4].item[0].linkId = "participou-capacitacao"
* item[4].item[0].text = "Você já participou de treinamento ou capacitação sobre o uso correto e seguro de defensivos agrícolas?"
* item[4].item[0].type = #boolean
* item[4].item[0].required = true

* item[4].item[1].linkId = "data-ultima-capacitacao"
* item[4].item[1].text = "Quando ocorreu a última capacitação? Informe o mês e o ano"
* item[4].item[1].type = #date
* item[4].item[1].required = true
* item[4].item[1].enableWhen[0].question = "participou-capacitacao"
* item[4].item[1].enableWhen[0].operator = #=
* item[4].item[1].enableWhen[0].answerBoolean = true

* item[4].item[2].linkId = "responsavel-capacitacao"
* item[4].item[2].text = "Quem realizou a capacitação?"
* item[4].item[2].type = #string
* item[4].item[2].required = true
* item[4].item[2].enableWhen[0].question = "participou-capacitacao"
* item[4].item[2].enableWhen[0].operator = #=
* item[4].item[2].enableWhen[0].answerBoolean = true

* item[4].item[3].linkId = "recebe-orientacoes-periodicas"
* item[4].item[3].text = "Você recebe orientações periódicas sobre segurança no trabalho rural?"
* item[4].item[3].type = #boolean
* item[4].item[3].required = true

* item[4].item[4].linkId = "temas-capacitacao"
* item[4].item[4].text = "Temas abordados nas capacitações"
* item[4].item[4].type = #choice
* item[4].item[4].repeats = true
* item[4].item[4].required = true
* item[4].item[4].answerValueSet = Canonical(AgroSUSTemasCapacitacaoVS)
* item[4].item[4].enableWhen[0].question = "participou-capacitacao"
* item[4].item[4].enableWhen[0].operator = #=
* item[4].item[4].enableWhen[0].answerBoolean = true

* item[4].item[5].linkId = "outros-temas-capacitacao"
* item[4].item[5].text = "Especifique os outros temas abordados"
* item[4].item[5].type = #string
* item[4].item[5].required = true
* item[4].item[5].enableWhen[0].question = "temas-capacitacao"
* item[4].item[5].enableWhen[0].operator = #=
* item[4].item[5].enableWhen[0].answerCoding = AgroSUSCapacitacaoCS#outros

// Seção 6 — Defensivos agrícolas utilizados e conformidade legal

* item[5].linkId = "defensivos-conformidade"
* item[5].text = "6. Defensivos agrícolas utilizados e conformidade legal"
* item[5].type = #group

* item[5].item[0].linkId = "possui-receituario-agronomico"
* item[5].item[0].text = "Possui receituário agronômico para aquisição e utilização dos defensivos agrícolas?"
* item[5].item[0].type = #boolean
* item[5].item[0].required = true

* item[5].item[1].linkId = "orientacao-verificacao-receituario"
* item[5].item[1].text = "Se houver receituário, verifique sua vigência e correspondência com os produtos efetivamente utilizados."
* item[5].item[1].type = #display

* item[5].item[2].linkId = "receituario-vigente"
* item[5].item[2].text = "O receituário agronômico está vigente?"
* item[5].item[2].type = #boolean
* item[5].item[2].required = true
* item[5].item[2].enableWhen[0].question = "possui-receituario-agronomico"
* item[5].item[2].enableWhen[0].operator = #=
* item[5].item[2].enableWhen[0].answerBoolean = true

* item[5].item[3].linkId = "receituario-corresponde-produtos"
* item[5].item[3].text = "O receituário corresponde aos produtos efetivamente utilizados na propriedade?"
* item[5].item[3].type = #boolean
* item[5].item[3].required = true
* item[5].item[3].enableWhen[0].question = "possui-receituario-agronomico"
* item[5].item[3].enableWhen[0].operator = #=
* item[5].item[3].enableWhen[0].answerBoolean = true

* item[5].item[4].linkId = "utiliza-produto-irregular"
* item[5].item[4].text = "Utiliza produto sem registro, vencido ou de origem desconhecida?"
* item[5].item[4].type = #boolean
* item[5].item[4].required = true

* item[5].item[5].linkId = "defensivo-utilizado"
* item[5].item[5].text = "Defensivo agrícola utilizado"
* item[5].item[5].type = #group
* item[5].item[5].repeats = true

* item[5].item[5].item[0].linkId = "defensivo-nome-comercial"
* item[5].item[5].item[0].text = "Nome comercial"
* item[5].item[5].item[0].type = #string
* item[5].item[5].item[0].required = true

* item[5].item[5].item[1].linkId = "defensivo-principio-ativo"
* item[5].item[5].item[1].text = "Princípio ativo"
* item[5].item[5].item[1].type = #string
* item[5].item[5].item[1].required = true

* item[5].item[5].item[2].linkId = "defensivo-classe-uso"
* item[5].item[5].item[2].text = "Classe de uso"
* item[5].item[5].item[2].type = #string

* item[5].item[5].item[3].linkId = "defensivo-classificacao-toxicologica"
* item[5].item[5].item[3].text = "Classe toxicológica ou de perigo"
* item[5].item[5].item[3].type = #choice
* item[5].item[5].item[3].answerValueSet = Canonical(AgroSUSClassificacaoToxicologicaVS)

* item[5].item[5].item[4].linkId = "defensivo-numero-registro"
* item[5].item[5].item[4].text = "Número de registro Anvisa/MAPA"
* item[5].item[5].item[4].type = #string

// Seção 7 — Rastreabilidade das aplicações

* item[6].linkId = "rastreabilidade-aplicacoes"
* item[6].text = "7. Rastreabilidade das aplicações"
* item[6].type = #group

* item[6].item[0].linkId = "registra-datas-aplicacao"
* item[6].item[0].text = "Registra as datas das aplicações de defensivos agrícolas?"
* item[6].item[0].type = #boolean
* item[6].item[0].required = true

* item[6].item[1].linkId = "registra-produtos-aplicados"
* item[6].item[1].text = "Mantém registro dos produtos comerciais utilizados em cada aplicação?"
* item[6].item[1].type = #boolean
* item[6].item[1].required = true

* item[6].item[2].linkId = "registra-quantidade-aplicada"
* item[6].item[2].text = "Registra a quantidade aplicada, como dose ou volume?"
* item[6].item[2].type = #boolean
* item[6].item[2].required = true

* item[6].item[3].linkId = "registra-responsavel-aplicacao"
* item[6].item[3].text = "Registra quem realizou cada aplicação?"
* item[6].item[3].type = #boolean
* item[6].item[3].required = true

* item[6].item[4].linkId = "registra-cultura-tratada"
* item[6].item[4].text = "Registra qual cultura foi tratada em cada aplicação?"
* item[6].item[4].type = #boolean
* item[6].item[4].required = true

* item[6].item[5].linkId = "armazenamento-registros-aplicacao"
* item[6].item[5].text = "Onde os registros das aplicações são armazenados?"
* item[6].item[5].type = #choice
* item[6].item[5].repeats = true
* item[6].item[5].required = true
* item[6].item[5].answerValueSet = Canonical(AgroSUSArmazenamentoRegistrosVS)

* item[6].item[6].linkId = "tempo-guarda-registros"
* item[6].item[6].text = "Por quanto tempo os registros são guardados?"
* item[6].item[6].type = #string

* item[6].item[7].linkId = "registros-disponiveis-consulta"
* item[6].item[7].text = "Os registros estão disponíveis para consulta pela equipe de saúde?"
* item[6].item[7].type = #boolean
* item[6].item[7].required = true

// Seção 8 — Frequência e forma de exposição

* item[7].linkId = "frequencia-forma-exposicao"
* item[7].text = "8. Frequência e forma de exposição"
* item[7].type = #group

* item[7].item[0].linkId = "dias-aplicacao-mes"
* item[7].item[0].text = "Quantos dias por mês realiza aplicação de defensivos agrícolas?"
* item[7].item[0].type = #choice
* item[7].item[0].required = true
* item[7].item[0].answerValueSet = Canonical(AgroSUSDiasAplicacaoMesVS)

* item[7].item[1].linkId = "horas-aplicacao-dia"
* item[7].item[1].text = "Durante quantas horas por dia realiza a aplicação?"
* item[7].item[1].type = #choice
* item[7].item[1].required = true
* item[7].item[1].answerValueSet = Canonical(AgroSUSHorasAplicacaoDiaVS)

* item[7].item[2].linkId = "meses-maior-intensidade"
* item[7].item[2].text = "Em quais meses do ano ocorre maior intensidade de uso?"
* item[7].item[2].type = #choice
* item[7].item[2].repeats = true
* item[7].item[2].required = true
* item[7].item[2].answerValueSet = Canonical(AgroSUSMesMaiorIntensidadeVS)

* item[7].item[3].linkId = "data-ultima-aplicacao"
* item[7].item[3].text = "Data da última aplicação"
* item[7].item[3].type = #date

* item[7].item[4].linkId = "equipamento-aplicacao"
* item[7].item[4].text = "Qual tipo de equipamento é utilizado na aplicação?"
* item[7].item[4].type = #choice
* item[7].item[4].repeats = true
* item[7].item[4].required = true
* item[7].item[4].answerValueSet = Canonical(AgroSUSEquipamentoAplicacaoVS)

* item[7].item[5].linkId = "via-exposicao-mais-comum"
* item[7].item[5].text = "Qual é a via de exposição mais comum?"
* item[7].item[5].type = #choice
* item[7].item[5].required = true
* item[7].item[5].answerValueSet = Canonical(AgroSUSViaExposicaoVS)

* item[7].item[6].linkId = "responsavel-aplicacao"
* item[7].item[6].text = "Quem realiza a aplicação dos defensivos agrícolas?"
* item[7].item[6].type = #choice
* item[7].item[6].repeats = true
* item[7].item[6].required = true
* item[7].item[6].answerValueSet = Canonical(AgroSUSResponsavelAplicacaoVS)

* item[7].item[7].linkId = "outro-responsavel-aplicacao"
* item[7].item[7].text = "Informe quem é o outro responsável pela aplicação"
* item[7].item[7].type = #string
* item[7].item[7].required = true
* item[7].item[7].enableWhen[0].question = "responsavel-aplicacao"
* item[7].item[7].enableWhen[0].operator = #=
* item[7].item[7].enableWhen[0].answerCoding = AgroSUSExposicaoCS#outro

* item[7].item[8].linkId = "outras-pessoas-durante-aplicacao"
* item[7].item[8].text = "Há presença de outras pessoas durante a aplicação dos defensivos?"
* item[7].item[8].type = #boolean
* item[7].item[8].required = true

* item[7].item[9].linkId = "criancas-idosos-proximos-aplicacao"
* item[7].item[9].text = "Há crianças ou idosos próximos à área durante a aplicação?"
* item[7].item[9].type = #boolean
* item[7].item[9].required = true

* item[7].item[10].linkId = "respeita-intervalo-reentrada"
* item[7].item[10].text = "O intervalo de reentrada na lavoura após a aplicação é habitualmente respeitado?"
* item[7].item[10].type = #boolean
* item[7].item[10].required = true

* item[7].item[11].linkId = "observa-condicoes-climaticas"
* item[7].item[11].text = "As condições climáticas, como vento, chuva e temperatura, são observadas antes de iniciar a pulverização?"
* item[7].item[11].type = #boolean
* item[7].item[11].required = true

// Seção 9 — Equipamentos de Proteção Individual

* item[8].linkId = "equipamentos-protecao-individual"
* item[8].text = "9. Equipamentos de Proteção Individual"
* item[8].type = #group

* item[8].item[0].linkId = "uso-mascara-respiratoria"
* item[8].item[0].text = "Máscara respiratória PFF2/PFF3 ou com filtro químico"
* item[8].item[0].type = #choice
* item[8].item[0].required = true
* item[8].item[0].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[1].linkId = "uso-touca-arabe"
* item[8].item[1].text = "Touca árabe"
* item[8].item[1].type = #choice
* item[8].item[1].required = true
* item[8].item[1].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[2].linkId = "uso-luvas"
* item[8].item[2].text = "Luvas de nitrila, neoprene ou borracha"
* item[8].item[2].type = #choice
* item[8].item[2].required = true
* item[8].item[2].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[3].linkId = "uso-avental-impermeavel"
* item[8].item[3].text = "Avental impermeável"
* item[8].item[3].type = #choice
* item[8].item[3].required = true
* item[8].item[3].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[4].linkId = "uso-botas-borracha"
* item[8].item[4].text = "Botas de borracha"
* item[8].item[4].type = #choice
* item[8].item[4].required = true
* item[8].item[4].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[5].linkId = "uso-oculos-protecao"
* item[8].item[5].text = "Óculos de proteção"
* item[8].item[5].type = #choice
* item[8].item[5].required = true
* item[8].item[5].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[6].linkId = "uso-macacao-impermeavel"
* item[8].item[6].text = "Macacão ou roupa impermeável"
* item[8].item[6].type = #choice
* item[8].item[6].required = true
* item[8].item[6].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)

* item[8].item[7].linkId = "uso-protetor-auricular"
* item[8].item[7].text = "Protetor auricular"
* item[8].item[7].type = #choice
* item[8].item[7].required = true
* item[8].item[7].answerValueSet = Canonical(AgroSUSFrequenciaUsoEPIVS)
* item[8].item[7].enableWhen[0].question = "equipamento-aplicacao"
* item[8].item[7].enableWhen[0].operator = #=
* item[8].item[7].enableWhen[0].answerCoding = AgroSUSExposicaoCS#pulverizador-costal-motorizado
* item[8].item[7].enableWhen[1].question = "equipamento-aplicacao"
* item[8].item[7].enableWhen[1].operator = #=
* item[8].item[7].enableWhen[1].answerCoding = AgroSUSExposicaoCS#trator-com-barra
* item[8].item[7].enableBehavior = #any

* item[8].item[8].linkId = "epis-boas-condicoes"
* item[8].item[8].text = "Os EPIs estão em boas condições de uso e conservação?"
* item[8].item[8].type = #boolean

* item[8].item[9].linkId = "substitui-filtros-mascara"
* item[8].item[9].text = "Os filtros da máscara respiratória são substituídos periodicamente conforme recomendação do fabricante?"
* item[8].item[9].type = #boolean
* item[8].item[9].required = true
* item[8].item[9].enableWhen[0].question = "uso-mascara-respiratoria"
* item[8].item[9].enableWhen[0].operator = #!=
* item[8].item[9].enableWhen[0].answerCoding = AgroSUSEPICS#nao-possui

* item[8].item[10].linkId = "higieniza-epis-apos-uso"
* item[8].item[10].text = "Realiza a lavagem e a higienização dos EPIs após cada uso?"
* item[8].item[10].type = #boolean

* item[8].item[11].linkId = "armazenamento-epis"
* item[8].item[11].text = "Onde os EPIs são armazenados?"
* item[8].item[11].type = #choice
* item[8].item[11].repeats = true
* item[8].item[11].answerValueSet = Canonical(AgroSUSArmazenamentoEPIVS)

* item[8].item[12].linkId = "outro-armazenamento-epis"
* item[8].item[12].text = "Informe o outro local de armazenamento dos EPIs"
* item[8].item[12].type = #string
* item[8].item[12].required = true
* item[8].item[12].enableWhen[0].question = "armazenamento-epis"
* item[8].item[12].enableWhen[0].operator = #=
* item[8].item[12].enableWhen[0].answerCoding = AgroSUSEPICS#outro

* item[8].item[13].linkId = "motivo-nao-utilizar-epi"
* item[8].item[13].text = "Qual o motivo de não utilizar os EPIs, quando aplicável?"
* item[8].item[13].type = #choice
* item[8].item[13].repeats = true
* item[8].item[13].answerValueSet = Canonical(AgroSUSMotivoNaoUsoEPIVS)

* item[8].item[14].linkId = "outro-motivo-nao-utilizar-epi"
* item[8].item[14].text = "Informe o outro motivo de não utilizar os EPIs"
* item[8].item[14].type = #string
* item[8].item[14].required = true
* item[8].item[14].enableWhen[0].question = "motivo-nao-utilizar-epi"
* item[8].item[14].enableWhen[0].operator = #=
* item[8].item[14].enableWhen[0].answerCoding = AgroSUSEPICS#outro

// Seção 10 — Armazenamento dos defensivos agrícolas

* item[9].linkId = "armazenamento-defensivos"
* item[9].text = "10. Armazenamento dos defensivos agrícolas"
* item[9].type = #group

* item[9].item[0].linkId = "local-armazenamento-defensivos"
* item[9].item[0].text = "Onde os defensivos agrícolas são armazenados?"
* item[9].item[0].type = #choice
* item[9].item[0].repeats = true
* item[9].item[0].required = true
* item[9].item[0].answerValueSet = Canonical(AgroSUSLocalArmazenamentoDefensivosVS)

* item[9].item[1].linkId = "outro-local-armazenamento-defensivos"
* item[9].item[1].text = "Informe o outro local de armazenamento"
* item[9].item[1].type = #string
* item[9].item[1].required = true
* item[9].item[1].enableWhen[0].question = "local-armazenamento-defensivos"
* item[9].item[1].enableWhen[0].operator = #=
* item[9].item[1].enableWhen[0].answerCoding = AgroSUSArmazenamentoDefensivosCS#outro

* item[9].item[2].linkId = "deposito-ventilacao-adequada"
* item[9].item[2].text = "O depósito possui ventilação adequada?"
* item[9].item[2].type = #boolean
* item[9].item[2].required = true

* item[9].item[3].linkId = "deposito-piso-impermeavel"
* item[9].item[3].text = "O depósito possui piso impermeável?"
* item[9].item[3].type = #boolean
* item[9].item[3].required = true

* item[9].item[4].linkId = "deposito-prateleiras-apropriadas"
* item[9].item[4].text = "O depósito possui prateleiras apropriadas?"
* item[9].item[4].type = #boolean
* item[9].item[4].required = true

* item[9].item[5].linkId = "deposito-fechadura-seguranca"
* item[9].item[5].text = "O depósito possui fechadura ou tranca de segurança?"
* item[9].item[5].type = #boolean
* item[9].item[5].required = true

* item[9].item[6].linkId = "deposito-sinalizacao-risco"
* item[9].item[6].text = "O depósito possui sinalização de risco e perigo?"
* item[9].item[6].type = #boolean
* item[9].item[6].required = true

* item[9].item[7].linkId = "deposito-extintor-incendio"
* item[9].item[7].text = "Há extintor de incêndio disponível no depósito?"
* item[9].item[7].type = #boolean
* item[9].item[7].required = true

* item[9].item[8].linkId = "defensivos-separados-alimentos"
* item[9].item[8].text = "Os defensivos são armazenados separadamente de alimentos?"
* item[9].item[8].type = #boolean
* item[9].item[8].required = true

* item[9].item[9].linkId = "defensivos-separados-fontes-agua"
* item[9].item[9].text = "Os defensivos são armazenados separadamente de fontes de água?"
* item[9].item[9].type = #boolean
* item[9].item[9].required = true

* item[9].item[10].linkId = "defensivos-separados-roupas-epis"
* item[9].item[10].text = "Os defensivos são armazenados separadamente de roupas e EPIs?"
* item[9].item[10].type = #boolean
* item[9].item[10].required = true

* item[9].item[11].linkId = "nenhum-defensivo-na-residencia"
* item[9].item[11].text = "Nenhum defensivo agrícola é armazenado dentro da residência?"
* item[9].item[11].type = #boolean
* item[9].item[11].required = true

// Seção 11 — Destinação das embalagens vazias

* item[10].linkId = "destinacao-embalagens-vazias"
* item[10].text = "11. Destinação das embalagens vazias"
* item[10].type = #group

* item[10].item[0].linkId = "realiza-triplice-lavagem"
* item[10].item[0].text = "Realiza a tríplice lavagem ou lavagem sob pressão das embalagens, quando aplicável?"
* item[10].item[0].type = #boolean
* item[10].item[0].required = true

* item[10].item[1].linkId = "devolve-embalagens-local-autorizado"
* item[10].item[1].text = "Realiza a devolução das embalagens vazias em locais autorizados?"
* item[10].item[1].type = #boolean
* item[10].item[1].required = true

* item[10].item[2].linkId = "local-devolucao-embalagens"
* item[10].item[2].text = "Qual é o local de devolução das embalagens?"
* item[10].item[2].type = #string
* item[10].item[2].required = true
* item[10].item[2].enableWhen[0].question = "devolve-embalagens-local-autorizado"
* item[10].item[2].enableWhen[0].operator = #=
* item[10].item[2].enableWhen[0].answerBoolean = true

* item[10].item[3].linkId = "tempo-medio-para-devolucao"
* item[10].item[3].text = "Qual é o tempo médio entre o término do produto e a devolução da embalagem?"
* item[10].item[3].type = #string
* item[10].item[3].enableWhen[0].question = "devolve-embalagens-local-autorizado"
* item[10].item[3].enableWhen[0].operator = #=
* item[10].item[3].enableWhen[0].answerBoolean = true

* item[10].item[4].linkId = "destino-embalagens-nao-devolvidas"
* item[10].item[4].text = "Caso não realize a devolução, qual é o destino das embalagens?"
* item[10].item[4].type = #choice
* item[10].item[4].repeats = true
* item[10].item[4].required = true
* item[10].item[4].answerValueSet = Canonical(AgroSUSDestinacaoEmbalagensNaoDevolvidasVS)
* item[10].item[4].enableWhen[0].question = "devolve-embalagens-local-autorizado"
* item[10].item[4].enableWhen[0].operator = #=
* item[10].item[4].enableWhen[0].answerBoolean = false

* item[10].item[5].linkId = "outro-destino-embalagens"
* item[10].item[5].text = "Informe o outro destino dado às embalagens"
* item[10].item[5].type = #string
* item[10].item[5].required = true
* item[10].item[5].enableWhen[0].question = "destino-embalagens-nao-devolvidas"
* item[10].item[5].enableWhen[0].operator = #=
* item[10].item[5].enableWhen[0].answerCoding = AgroSUSDestinacaoEmbalagensCS#outro

// Seção 12 — Exposição familiar e ambiental

* item[11].linkId = "exposicao-familiar-ambiental"
* item[11].text = "12. Exposição familiar e ambiental"
* item[11].type = #group

* item[11].item[0].linkId = "familiares-auxiliam-aplicacao"
* item[11].item[0].text = "Familiares auxiliam na aplicação de defensivos agrícolas?"
* item[11].item[0].type = #boolean
* item[11].item[0].required = true

* item[11].item[1].linkId = "familiares-que-auxiliam"
* item[11].item[1].text = "Quais familiares auxiliam na aplicação?"
* item[11].item[1].type = #choice
* item[11].item[1].repeats = true
* item[11].item[1].required = true
* item[11].item[1].answerValueSet = Canonical(AgroSUSFamiliaresAuxiliamAplicacaoVS)
* item[11].item[1].enableWhen[0].question = "familiares-auxiliam-aplicacao"
* item[11].item[1].enableWhen[0].operator = #=
* item[11].item[1].enableWhen[0].answerBoolean = true

* item[11].item[2].linkId = "outros-familiares-que-auxiliam"
* item[11].item[2].text = "Informe quais são os outros familiares"
* item[11].item[2].type = #string
* item[11].item[2].required = true
* item[11].item[2].enableWhen[0].question = "familiares-que-auxiliam"
* item[11].item[2].enableWhen[0].operator = #=
* item[11].item[2].enableWhen[0].answerCoding = AgroSUSExposicaoFamiliarCS#outros

* item[11].item[3].linkId = "criancas-acesso-area-ou-deposito"
* item[11].item[3].text = "Crianças ou adolescentes têm acesso às áreas de aplicação ou ao depósito de armazenamento?"
* item[11].item[3].type = #boolean
* item[11].item[3].required = true

* item[11].item[4].linkId = "fonte-agua-proxima-aplicacao"
* item[11].item[4].text = "Há nascente, rio, córrego, açude ou poço próximo à área onde os defensivos são aplicados?"
* item[11].item[4].type = #boolean
* item[11].item[4].required = true

* item[11].item[5].linkId = "moradias-proximas-aplicacao"
* item[11].item[5].text = "Há moradias próximas da área de aplicação, como casas de vizinhos, agregados ou trabalhadores?"
* item[11].item[5].type = #boolean
* item[11].item[5].required = true

* item[11].item[6].linkId = "risco-deriva-propriedades-vizinhas"
* item[11].item[6].text = "Há risco de deriva da calda defensiva para áreas ou propriedades vizinhas?"
* item[11].item[6].type = #boolean
* item[11].item[6].required = true

* item[11].item[7].linkId = "agua-proxima-usada-consumo"
* item[11].item[7].text = "A água da fonte próxima à área de aplicação é utilizada para consumo humano ou animal?"
* item[11].item[7].type = #boolean
* item[11].item[7].required = true
* item[11].item[7].enableWhen[0].question = "fonte-agua-proxima-aplicacao"
* item[11].item[7].enableWhen[0].operator = #=
* item[11].item[7].enableWhen[0].answerBoolean = true

// Seção 13 — Condições de saúde e sintomas
// Parte A — Condições gerais de saúde

* item[12].linkId = "condicoes-saude-sintomas"
* item[12].text = "13. Condições de saúde e sintomas"
* item[12].type = #group

* item[12].item[0].linkId = "condicoes-saude-referidas"
* item[12].item[0].text = "Quais condições de saúde preexistentes foram referidas pelo trabalhador?"
* item[12].item[0].type = #choice
* item[12].item[0].repeats = true
* item[12].item[0].required = true
* item[12].item[0].answerValueSet = Canonical(AgroSUSCondicaoSaudeReferidaVS)

* item[12].item[1].linkId = "tipo-cancer-referido"
* item[12].item[1].text = "Informe qual tipo de câncer foi referido"
* item[12].item[1].type = #string
* item[12].item[1].required = true
* item[12].item[1].enableWhen[0].question = "condicoes-saude-referidas"
* item[12].item[1].enableWhen[0].operator = #=
* item[12].item[1].enableWhen[0].answerCoding = AgroSUSCondicoesSintomasCS#condicao-cancer

* item[12].item[2].linkId = "medicamentos-uso-continuo"
* item[12].item[2].text = "Medicamentos em uso contínuo"
* item[12].item[2].type = #text

* item[12].item[3].linkId = "tabagismo"
* item[12].item[3].text = "O trabalhador faz uso de produtos derivados do tabaco?"
* item[12].item[3].type = #boolean
* item[12].item[3].required = true

* item[12].item[4].linkId = "uso-regular-alcool"
* item[12].item[4].text = "O trabalhador faz uso regular de bebidas alcoólicas?"
* item[12].item[4].type = #boolean
* item[12].item[4].required = true

* item[12].item[5].linkId = "orientacao-sintomas"
* item[12].item[5].text = "Informe, para cada sinal ou sintoma, se ocorreu nos últimos 30 dias e se surgiu ou piorou após a aplicação de defensivo agrícola."
* item[12].item[5].type = #display

// Seção 13 — Parte B: sinais e sintomas dos últimos 30 dias

* item[12].item[6].linkId = "avaliacao-cefaleia-frequente"
* item[12].item[6].text = "Dor de cabeça (cefaleia) frequente"
* item[12].item[6].type = #group
* item[12].item[6].code[0] = AgroSUSCondicoesSintomasCS#sintoma-cefaleia-frequente
* item[12].item[6].item[0].linkId = "cefaleia-frequente-presente"
* item[12].item[6].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[6].item[0].type = #boolean
* item[12].item[6].item[0].required = true
* item[12].item[6].item[1].linkId = "cefaleia-frequente-apos-aplicacao"
* item[12].item[6].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[6].item[1].type = #boolean
* item[12].item[6].item[1].required = true
* item[12].item[6].item[1].enableWhen[0].question = "cefaleia-frequente-presente"
* item[12].item[6].item[1].enableWhen[0].operator = #=
* item[12].item[6].item[1].enableWhen[0].answerBoolean = true

* item[12].item[7].linkId = "avaliacao-tontura-vertigem"
* item[12].item[7].text = "Tontura ou vertigem"
* item[12].item[7].type = #group
* item[12].item[7].code[0] = AgroSUSCondicoesSintomasCS#sintoma-tontura-vertigem
* item[12].item[7].item[0].linkId = "tontura-vertigem-presente"
* item[12].item[7].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[7].item[0].type = #boolean
* item[12].item[7].item[0].required = true
* item[12].item[7].item[1].linkId = "tontura-vertigem-apos-aplicacao"
* item[12].item[7].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[7].item[1].type = #boolean
* item[12].item[7].item[1].required = true
* item[12].item[7].item[1].enableWhen[0].question = "tontura-vertigem-presente"
* item[12].item[7].item[1].enableWhen[0].operator = #=
* item[12].item[7].item[1].enableWhen[0].answerBoolean = true

* item[12].item[8].linkId = "avaliacao-nauseas"
* item[12].item[8].text = "Náuseas"
* item[12].item[8].type = #group
* item[12].item[8].code[0] = AgroSUSCondicoesSintomasCS#sintoma-nauseas
* item[12].item[8].item[0].linkId = "nauseas-presente"
* item[12].item[8].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[8].item[0].type = #boolean
* item[12].item[8].item[0].required = true
* item[12].item[8].item[1].linkId = "nauseas-apos-aplicacao"
* item[12].item[8].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[8].item[1].type = #boolean
* item[12].item[8].item[1].required = true
* item[12].item[8].item[1].enableWhen[0].question = "nauseas-presente"
* item[12].item[8].item[1].enableWhen[0].operator = #=
* item[12].item[8].item[1].enableWhen[0].answerBoolean = true

* item[12].item[9].linkId = "avaliacao-vomitos"
* item[12].item[9].text = "Vômitos"
* item[12].item[9].type = #group
* item[12].item[9].code[0] = AgroSUSCondicoesSintomasCS#sintoma-vomitos
* item[12].item[9].item[0].linkId = "vomitos-presente"
* item[12].item[9].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[9].item[0].type = #boolean
* item[12].item[9].item[0].required = true
* item[12].item[9].item[1].linkId = "vomitos-apos-aplicacao"
* item[12].item[9].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[9].item[1].type = #boolean
* item[12].item[9].item[1].required = true
* item[12].item[9].item[1].enableWhen[0].question = "vomitos-presente"
* item[12].item[9].item[1].enableWhen[0].operator = #=
* item[12].item[9].item[1].enableWhen[0].answerBoolean = true

* item[12].item[10].linkId = "avaliacao-diarreia-colicas"
* item[12].item[10].text = "Diarreia ou cólicas abdominais"
* item[12].item[10].type = #group
* item[12].item[10].code[0] = AgroSUSCondicoesSintomasCS#sintoma-diarreia-colicas-abdominais
* item[12].item[10].item[0].linkId = "diarreia-colicas-presente"
* item[12].item[10].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[10].item[0].type = #boolean
* item[12].item[10].item[0].required = true
* item[12].item[10].item[1].linkId = "diarreia-colicas-apos-aplicacao"
* item[12].item[10].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[10].item[1].type = #boolean
* item[12].item[10].item[1].required = true
* item[12].item[10].item[1].enableWhen[0].question = "diarreia-colicas-presente"
* item[12].item[10].item[1].enableWhen[0].operator = #=
* item[12].item[10].item[1].enableWhen[0].answerBoolean = true

* item[12].item[11].linkId = "avaliacao-tremores-contracoes"
* item[12].item[11].text = "Tremores ou contrações musculares involuntárias"
* item[12].item[11].type = #group
* item[12].item[11].code[0] = AgroSUSCondicoesSintomasCS#sintoma-tremores-contracoes-involuntarias
* item[12].item[11].item[0].linkId = "tremores-contracoes-presente"
* item[12].item[11].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[11].item[0].type = #boolean
* item[12].item[11].item[0].required = true
* item[12].item[11].item[1].linkId = "tremores-contracoes-apos-aplicacao"
* item[12].item[11].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[11].item[1].type = #boolean
* item[12].item[11].item[1].required = true
* item[12].item[11].item[1].enableWhen[0].question = "tremores-contracoes-presente"
* item[12].item[11].item[1].enableWhen[0].operator = #=
* item[12].item[11].item[1].enableWhen[0].answerBoolean = true

* item[12].item[12].linkId = "avaliacao-fraqueza-cansaco"
* item[12].item[12].text = "Fraqueza ou cansaço extremo"
* item[12].item[12].type = #group
* item[12].item[12].code[0] = AgroSUSCondicoesSintomasCS#sintoma-fraqueza-cansaco-extremo
* item[12].item[12].item[0].linkId = "fraqueza-cansaco-presente"
* item[12].item[12].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[12].item[0].type = #boolean
* item[12].item[12].item[0].required = true
* item[12].item[12].item[1].linkId = "fraqueza-cansaco-apos-aplicacao"
* item[12].item[12].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[12].item[1].type = #boolean
* item[12].item[12].item[1].required = true
* item[12].item[12].item[1].enableWhen[0].question = "fraqueza-cansaco-presente"
* item[12].item[12].item[1].enableWhen[0].operator = #=
* item[12].item[12].item[1].enableWhen[0].answerBoolean = true

* item[12].item[13].linkId = "avaliacao-diaforese"
* item[12].item[13].text = "Suor excessivo (diaforese)"
* item[12].item[13].type = #group
* item[12].item[13].code[0] = AgroSUSCondicoesSintomasCS#sintoma-diaforese
* item[12].item[13].item[0].linkId = "diaforese-presente"
* item[12].item[13].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[13].item[0].type = #boolean
* item[12].item[13].item[0].required = true
* item[12].item[13].item[1].linkId = "diaforese-apos-aplicacao"
* item[12].item[13].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[13].item[1].type = #boolean
* item[12].item[13].item[1].required = true
* item[12].item[13].item[1].enableWhen[0].question = "diaforese-presente"
* item[12].item[13].item[1].enableWhen[0].operator = #=
* item[12].item[13].item[1].enableWhen[0].answerBoolean = true

* item[12].item[14].linkId = "avaliacao-hipersalivacao"
* item[12].item[14].text = "Salivação excessiva (hipersalivação)"
* item[12].item[14].type = #group
* item[12].item[14].code[0] = AgroSUSCondicoesSintomasCS#sintoma-hipersalivacao
* item[12].item[14].item[0].linkId = "hipersalivacao-presente"
* item[12].item[14].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[14].item[0].type = #boolean
* item[12].item[14].item[0].required = true
* item[12].item[14].item[1].linkId = "hipersalivacao-apos-aplicacao"
* item[12].item[14].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[14].item[1].type = #boolean
* item[12].item[14].item[1].required = true
* item[12].item[14].item[1].enableWhen[0].question = "hipersalivacao-presente"
* item[12].item[14].item[1].enableWhen[0].operator = #=
* item[12].item[14].item[1].enableWhen[0].answerBoolean = true

* item[12].item[15].linkId = "avaliacao-irritacao-ocular"
* item[12].item[15].text = "Irritação nos olhos, lacrimejamento ou hiperemia"
* item[12].item[15].type = #group
* item[12].item[15].code[0] = AgroSUSCondicoesSintomasCS#sintoma-irritacao-ocular
* item[12].item[15].item[0].linkId = "irritacao-ocular-presente"
* item[12].item[15].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[15].item[0].type = #boolean
* item[12].item[15].item[0].required = true
* item[12].item[15].item[1].linkId = "irritacao-ocular-apos-aplicacao"
* item[12].item[15].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[15].item[1].type = #boolean
* item[12].item[15].item[1].required = true
* item[12].item[15].item[1].enableWhen[0].question = "irritacao-ocular-presente"
* item[12].item[15].item[1].enableWhen[0].operator = #=
* item[12].item[15].item[1].enableWhen[0].answerBoolean = true

* item[12].item[16].linkId = "avaliacao-irritacao-pele"
* item[12].item[16].text = "Irritação ou dermatite na pele"
* item[12].item[16].type = #group
* item[12].item[16].code[0] = AgroSUSCondicoesSintomasCS#sintoma-irritacao-dermatite-pele
* item[12].item[16].item[0].linkId = "irritacao-pele-presente"
* item[12].item[16].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[16].item[0].type = #boolean
* item[12].item[16].item[0].required = true
* item[12].item[16].item[1].linkId = "irritacao-pele-apos-aplicacao"
* item[12].item[16].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[16].item[1].type = #boolean
* item[12].item[16].item[1].required = true
* item[12].item[16].item[1].enableWhen[0].question = "irritacao-pele-presente"
* item[12].item[16].item[1].enableWhen[0].operator = #=
* item[12].item[16].item[1].enableWhen[0].answerBoolean = true

* item[12].item[17].linkId = "avaliacao-dispneia"
* item[12].item[17].text = "Falta de ar ou dispneia"
* item[12].item[17].type = #group
* item[12].item[17].code[0] = AgroSUSCondicoesSintomasCS#sintoma-dispneia
* item[12].item[17].item[0].linkId = "dispneia-presente"
* item[12].item[17].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[17].item[0].type = #boolean
* item[12].item[17].item[0].required = true
* item[12].item[17].item[1].linkId = "dispneia-apos-aplicacao"
* item[12].item[17].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[17].item[1].type = #boolean
* item[12].item[17].item[1].required = true
* item[12].item[17].item[1].enableWhen[0].question = "dispneia-presente"
* item[12].item[17].item[1].enableWhen[0].operator = #=
* item[12].item[17].item[1].enableWhen[0].answerBoolean = true

* item[12].item[18].linkId = "avaliacao-tosse-frequente"
* item[12].item[18].text = "Tosse seca ou produtiva frequente"
* item[12].item[18].type = #group
* item[12].item[18].code[0] = AgroSUSCondicoesSintomasCS#sintoma-tosse-frequente
* item[12].item[18].item[0].linkId = "tosse-frequente-presente"
* item[12].item[18].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[18].item[0].type = #boolean
* item[12].item[18].item[0].required = true
* item[12].item[18].item[1].linkId = "tosse-frequente-apos-aplicacao"
* item[12].item[18].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[18].item[1].type = #boolean
* item[12].item[18].item[1].required = true
* item[12].item[18].item[1].enableWhen[0].question = "tosse-frequente-presente"
* item[12].item[18].item[1].enableWhen[0].operator = #=
* item[12].item[18].item[1].enableWhen[0].answerBoolean = true

* item[12].item[19].linkId = "avaliacao-palpitacoes"
* item[12].item[19].text = "Palpitações ou batimentos irregulares"
* item[12].item[19].type = #group
* item[12].item[19].code[0] = AgroSUSCondicoesSintomasCS#sintoma-palpitacoes
* item[12].item[19].item[0].linkId = "palpitacoes-presente"
* item[12].item[19].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[19].item[0].type = #boolean
* item[12].item[19].item[0].required = true
* item[12].item[19].item[1].linkId = "palpitacoes-apos-aplicacao"
* item[12].item[19].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[19].item[1].type = #boolean
* item[12].item[19].item[1].required = true
* item[12].item[19].item[1].enableWhen[0].question = "palpitacoes-presente"
* item[12].item[19].item[1].enableWhen[0].operator = #=
* item[12].item[19].item[1].enableWhen[0].answerBoolean = true

* item[12].item[20].linkId = "avaliacao-alteracao-visual"
* item[12].item[20].text = "Alteração visual ou visão turva"
* item[12].item[20].type = #group
* item[12].item[20].code[0] = AgroSUSCondicoesSintomasCS#sintoma-alteracao-visual
* item[12].item[20].item[0].linkId = "alteracao-visual-presente"
* item[12].item[20].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[20].item[0].type = #boolean
* item[12].item[20].item[0].required = true
* item[12].item[20].item[1].linkId = "alteracao-visual-apos-aplicacao"
* item[12].item[20].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[20].item[1].type = #boolean
* item[12].item[20].item[1].required = true
* item[12].item[20].item[1].enableWhen[0].question = "alteracao-visual-presente"
* item[12].item[20].item[1].enableWhen[0].operator = #=
* item[12].item[20].item[1].enableWhen[0].answerBoolean = true

* item[12].item[21].linkId = "avaliacao-confusao-desorientacao"
* item[12].item[21].text = "Confusão mental ou desorientação"
* item[12].item[21].type = #group
* item[12].item[21].code[0] = AgroSUSCondicoesSintomasCS#sintoma-confusao-desorientacao
* item[12].item[21].item[0].linkId = "confusao-desorientacao-presente"
* item[12].item[21].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[21].item[0].type = #boolean
* item[12].item[21].item[0].required = true
* item[12].item[21].item[1].linkId = "confusao-desorientacao-apos-aplicacao"
* item[12].item[21].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[21].item[1].type = #boolean
* item[12].item[21].item[1].required = true
* item[12].item[21].item[1].enableWhen[0].question = "confusao-desorientacao-presente"
* item[12].item[21].item[1].enableWhen[0].operator = #=
* item[12].item[21].item[1].enableWhen[0].answerBoolean = true

* item[12].item[22].linkId = "avaliacao-memoria-concentracao"
* item[12].item[22].text = "Dificuldade de memória ou concentração"
* item[12].item[22].type = #group
* item[12].item[22].code[0] = AgroSUSCondicoesSintomasCS#sintoma-dificuldade-memoria-concentracao
* item[12].item[22].item[0].linkId = "memoria-concentracao-presente"
* item[12].item[22].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[22].item[0].type = #boolean
* item[12].item[22].item[0].required = true
* item[12].item[22].item[1].linkId = "memoria-concentracao-apos-aplicacao"
* item[12].item[22].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[22].item[1].type = #boolean
* item[12].item[22].item[1].required = true
* item[12].item[22].item[1].enableWhen[0].question = "memoria-concentracao-presente"
* item[12].item[22].item[1].enableWhen[0].operator = #=
* item[12].item[22].item[1].enableWhen[0].answerBoolean = true

* item[12].item[23].linkId = "avaliacao-disturbios-sono"
* item[12].item[23].text = "Distúrbios do sono, insônia ou hipersonia"
* item[12].item[23].type = #group
* item[12].item[23].code[0] = AgroSUSCondicoesSintomasCS#sintoma-disturbios-sono
* item[12].item[23].item[0].linkId = "disturbios-sono-presente"
* item[12].item[23].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[23].item[0].type = #boolean
* item[12].item[23].item[0].required = true
* item[12].item[23].item[1].linkId = "disturbios-sono-apos-aplicacao"
* item[12].item[23].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[23].item[1].type = #boolean
* item[12].item[23].item[1].required = true
* item[12].item[23].item[1].enableWhen[0].question = "disturbios-sono-presente"
* item[12].item[23].item[1].enableWhen[0].operator = #=
* item[12].item[23].item[1].enableWhen[0].answerBoolean = true

* item[12].item[24].linkId = "avaliacao-formigamento-membros"
* item[12].item[24].text = "Formigamento nos membros, como mãos, pés ou pernas"
* item[12].item[24].type = #group
* item[12].item[24].code[0] = AgroSUSCondicoesSintomasCS#sintoma-formigamento-membros
* item[12].item[24].item[0].linkId = "formigamento-membros-presente"
* item[12].item[24].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[24].item[0].type = #boolean
* item[12].item[24].item[0].required = true
* item[12].item[24].item[1].linkId = "formigamento-membros-apos-aplicacao"
* item[12].item[24].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[24].item[1].type = #boolean
* item[12].item[24].item[1].required = true
* item[12].item[24].item[1].enableWhen[0].question = "formigamento-membros-presente"
* item[12].item[24].item[1].enableWhen[0].operator = #=
* item[12].item[24].item[1].enableWhen[0].answerBoolean = true

* item[12].item[25].linkId = "avaliacao-irritabilidade-humor"
* item[12].item[25].text = "Irritabilidade ou alterações de humor"
* item[12].item[25].type = #group
* item[12].item[25].code[0] = AgroSUSCondicoesSintomasCS#sintoma-irritabilidade-alteracoes-humor
* item[12].item[25].item[0].linkId = "irritabilidade-humor-presente"
* item[12].item[25].item[0].text = "Apresentou este sintoma nos últimos 30 dias?"
* item[12].item[25].item[0].type = #boolean
* item[12].item[25].item[0].required = true
* item[12].item[25].item[1].linkId = "irritabilidade-humor-apos-aplicacao"
* item[12].item[25].item[1].text = "O sintoma surgiu ou piorou após aplicação de defensivo agrícola?"
* item[12].item[25].item[1].type = #boolean
* item[12].item[25].item[1].required = true
* item[12].item[25].item[1].enableWhen[0].question = "irritabilidade-humor-presente"
* item[12].item[25].item[1].enableWhen[0].operator = #=
* item[12].item[25].item[1].enableWhen[0].answerBoolean = true

// Seção 14 — Histórico de intoxicação e vigilância em saúde

* item[13].linkId = "historico-intoxicacao-vigilancia"
* item[13].text = "14. Histórico de intoxicação e vigilância em saúde"
* item[13].type = #group

* item[13].item[0].linkId = "procurou-atendimento-sintomas-defensivos"
* item[13].item[0].text = "Já procurou atendimento de saúde por sintomas que acreditava estarem relacionados ao uso de defensivos agrícolas?"
* item[13].item[0].type = #boolean
* item[13].item[0].required = true

* item[13].item[1].linkId = "intoxicacao-confirmada-medico"
* item[13].item[1].text = "Já teve intoxicação por defensivo agrícola confirmada por médico?"
* item[13].item[1].type = #boolean
* item[13].item[1].required = true

* item[13].item[2].linkId = "hospitalizacao-por-intoxicacao"
* item[13].item[2].text = "Já foi hospitalizado em decorrência de intoxicação por defensivo agrícola?"
* item[13].item[2].type = #boolean
* item[13].item[2].required = true

* item[13].item[3].linkId = "caso-notificado-sinan"
* item[13].item[3].text = "O caso foi notificado no Sistema de Informação de Agravos de Notificação (SINAN)?"
* item[13].item[3].type = #boolean
* item[13].item[3].required = true

* item[13].item[4].linkId = "cat-emitida"
* item[13].item[4].text = "Foi emitida Comunicação de Acidente de Trabalho (CAT) em decorrência do evento?"
* item[13].item[4].type = #boolean
* item[13].item[4].required = true

* item[13].item[5].linkId = "acompanhamento-cerest"
* item[13].item[5].text = "Já recebeu visita ou acompanhamento do Centro de Referência em Saúde do Trabalhador (CEREST)?"
* item[13].item[5].type = #boolean
* item[13].item[5].required = true

* item[13].item[6].linkId = "encaminhamento-apos-evento"
* item[13].item[6].text = "Houve encaminhamento para UBS, CEREST ou outro serviço de saúde especializado após o evento?"
* item[13].item[6].type = #boolean
* item[13].item[6].required = true

* item[13].item[7].linkId = "numero-intoxicacoes-agudas-autorreferidas"
* item[13].item[7].text = "Número de intoxicações agudas anteriores autorreferidas"
* item[13].item[7].type = #choice
* item[13].item[7].required = true
* item[13].item[7].answerValueSet = Canonical(AgroSUSNumeroIntoxicacoesAgudasVS)

// Seção 15 — Indicadores de boas práticas agrícolas

* item[14].linkId = "indicadores-boas-praticas"
* item[14].text = "15. Indicadores de boas práticas agrícolas"
* item[14].type = #group

* item[14].item[0].linkId = "boa-pratica-assistencia-tecnica"
* item[14].item[0].text = "Recebe assistência técnica para a produção"
* item[14].item[0].type = #choice
* item[14].item[0].required = true
* item[14].item[0].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[1].linkId = "boa-pratica-responsavel-tecnico"
* item[14].item[1].text = "Possui responsável técnico habilitado pela produção"
* item[14].item[1].type = #choice
* item[14].item[1].required = true
* item[14].item[1].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[2].linkId = "boa-pratica-receituario-vigente"
* item[14].item[2].text = "Possui receituário agronômico vigente"
* item[14].item[2].type = #choice
* item[14].item[2].required = true
* item[14].item[2].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[3].linkId = "boa-pratica-capacitacao-uso-seguro"
* item[14].item[3].text = "Participou de capacitação em uso seguro de defensivos"
* item[14].item[3].type = #choice
* item[14].item[3].required = true
* item[14].item[3].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[4].linkId = "boa-pratica-uso-adequado-epis"
* item[14].item[4].text = "Utiliza EPIs de forma adequada durante a aplicação"
* item[14].item[4].type = #choice
* item[14].item[4].required = true
* item[14].item[4].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[5].linkId = "boa-pratica-higienizacao-epis"
* item[14].item[5].text = "Realiza higienização correta dos EPIs após o uso"
* item[14].item[5].type = #choice
* item[14].item[5].required = true
* item[14].item[5].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[6].linkId = "boa-pratica-armazenamento-defensivos"
* item[14].item[6].text = "Armazena os defensivos em local adequado e seguro"
* item[14].item[6].type = #choice
* item[14].item[6].required = true
* item[14].item[6].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[7].linkId = "boa-pratica-triplice-lavagem"
* item[14].item[7].text = "Realiza tríplice lavagem das embalagens vazias"
* item[14].item[7].type = #choice
* item[14].item[7].required = true
* item[14].item[7].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[8].linkId = "boa-pratica-devolucao-embalagens"
* item[14].item[8].text = "Devolve embalagens vazias nos pontos de coleta autorizados"
* item[14].item[8].type = #choice
* item[14].item[8].required = true
* item[14].item[8].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[9].linkId = "boa-pratica-registro-datas"
* item[14].item[9].text = "Mantém registro das datas de aplicação"
* item[14].item[9].type = #choice
* item[14].item[9].required = true
* item[14].item[9].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[10].linkId = "boa-pratica-registro-produtos"
* item[14].item[10].text = "Mantém registro dos produtos utilizados em cada aplicação"
* item[14].item[10].type = #choice
* item[14].item[10].required = true
* item[14].item[10].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[11].linkId = "boa-pratica-intervalo-reentrada"
* item[14].item[11].text = "Respeita o intervalo de reentrada na lavoura"
* item[14].item[11].type = #choice
* item[14].item[11].required = true
* item[14].item[11].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[12].linkId = "boa-pratica-condicoes-climaticas"
* item[14].item[12].text = "Observa as condições climáticas antes de pulverizar"
* item[14].item[12].type = #choice
* item[14].item[12].required = true
* item[14].item[12].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[13].linkId = "boa-pratica-manutencao-pulverizador"
* item[14].item[13].text = "Realiza manutenção periódica do pulverizador"
* item[14].item[13].type = #choice
* item[14].item[13].required = true
* item[14].item[13].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

* item[14].item[14].linkId = "boa-pratica-acompanhamento-aps"
* item[14].item[14].text = "Recebe acompanhamento periódico pela equipe de APS/ESF"
* item[14].item[14].type = #choice
* item[14].item[14].required = true
* item[14].item[14].answerValueSet = Canonical(AgroSUSAvaliacaoBoasPraticasVS)

// Seção 16 — Vigilância de sinais de alerta (reativada; ver Library/AgroSUSIntoxicacaoLogic,
// PlanDefinition/AgroSUSEstratificacaoRisco, ADR-0001 e ADR-0002). Gatilhos discretos e
// independentes, fundamentados em NR-7/NR-31 e na Nota Informativa nº 16/2019-CGLAB/MS — NÃO há
// escore composto de risco validado (ADR-0002); o ACS registra o que observa em campo, e a
// avaliação clínica é feita pela equipe da UBS.

* item[15].linkId = "vigilancia-sinais-alerta"
* item[15].text = "16. Vigilância de sinais de alerta"
* item[15].type = #group

* item[15].item[0].linkId = "vigilancia-nota-metodologica"
* item[15].item[0].text = "Os itens abaixo são gatilhos independentes de atenção clínica, com base em NR-7, NR-31 e na Nota Informativa nº 16/2019-CGLAB/MS. Não representam um escore ou pontuação combinada — qualquer gatilho presente deve motivar avaliação prioritária pela equipe da UBS."
* item[15].item[0].type = #display

* item[15].item[1].linkId = "vigilancia-sintoma-agudo-observado"
* item[15].item[1].text = "O trabalhador apresenta, no momento da visita, algum sinal ou sintoma agudo compatível com intoxicação por defensivos (ver Seção 13)?"
* item[15].item[1].type = #boolean
* item[15].item[1].required = true

* item[15].item[2].linkId = "vigilancia-produto-categoria-1-2-sem-epi"
* item[15].item[2].text = "O trabalhador manuseia defensivo de categoria toxicológica 1 ou 2 sem uso adequado de EPI (ver Seções 6 e 9)?"
* item[15].item[2].type = #boolean
* item[15].item[2].required = true

* item[15].item[3].linkId = "vigilancia-historico-intoxicacao-previa"
* item[15].item[3].text = "Há histórico de intoxicação aguda prévia autorreferido (ver Seção 14)?"
* item[15].item[3].type = #boolean
* item[15].item[3].required = true

* item[15].item[4].linkId = "vigilancia-colinesterase-alterada-precaucao"
* item[15].item[4].text = "Há resultado de colinesterase alterado ou em faixa de precaução no acompanhamento laboratorial mais recente, quando disponível (ver Library AgroSUSIntoxicacaoLogic)?"
* item[15].item[4].type = #boolean

* item[15].item[5].linkId = "vigilancia-encaminhamento-recomendado"
* item[15].item[5].text = "Diante dos gatilhos acima, o ACS recomenda encaminhamento prioritário para avaliação na UBS?"
* item[15].item[5].type = #boolean
* item[15].item[5].required = true

* item[15].item[6].linkId = "vigilancia-observacoes"
* item[15].item[6].text = "Observações adicionais sobre os gatilhos identificados"
* item[15].item[6].type = #text

// Seção 17 — Observações do Agente Comunitário de Saúde

* item[16].linkId = "observacoes-acs"
* item[16].text = "17. Observações do Agente Comunitário de Saúde"
* item[16].type = #group

* item[16].item[0].linkId = "observacoes-adicionais-acs"
* item[16].item[0].text = "Registre condições do domicílio, contexto ambiental observado em campo, comportamento durante a entrevista, dificuldades na aplicação do instrumento ou outras informações relevantes para o acompanhamento."
* item[16].item[0].type = #text

// Seção 18 — Encerramento assistencial

* item[17].linkId = "encerramento-assistencial"
* item[17].text = "18. Encerramento"
* item[17].type = #group

* item[17].item[0].linkId = "orientacao-encerramento"
* item[17].item[0].text = "Antes de concluir, confira as respostas registradas com o trabalhador ou responsável."
* item[17].item[0].type = #display

* item[17].item[1].linkId = "respostas-conferidas-participante"
* item[17].item[1].text = "As informações registradas foram conferidas com o trabalhador ou responsável?"
* item[17].item[1].type = #boolean
* item[17].item[1].required = true
