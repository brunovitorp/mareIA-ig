CodeSystem: AgroSUSPropriedadeCS
Id: agrosus-propriedade
Title: "Terminologia da Propriedade Rural AgroSUS"
Description: "Códigos utilizados para caracterizar propriedades rurais no formulário AgroSUS."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

// Situação de posse
* #posse-proprietario "Proprietário"
* #posse-arrendatario "Arrendatário"
* #posse-meeiro "Meeiro"
* #posse-assentado "Assentado"
* #posse-cedida "Terra cedida"
* #posse-outra "Outra situação de posse"

// Principal atividade agrícola
* #atividade-lavoura-temporaria "Lavoura temporária"
* #atividade-lavoura-permanente "Lavoura permanente"
* #atividade-horticultura "Horticultura"
* #atividade-fruticultura "Fruticultura"
* #atividade-pecuaria "Pecuária"
* #atividade-outra "Outra atividade agrícola"

// Tipo de produção
* #producao-convencional "Convencional"
* #producao-organica "Orgânica"
* #producao-agroecologica "Agroecológica"
* #producao-integrada "Integrada"
* #producao-outra "Outro tipo de produção"

// Fonte de água
* #agua-rede-publica "Rede pública"
* #agua-poco-artesiano "Poço artesiano"
* #agua-poco-comum "Poço comum"
* #agua-rio-corrego "Rio ou córrego"
* #agua-acude-represa "Açude ou represa"
* #agua-cisterna "Cisterna"
* #agua-outra "Outra fonte de água"


ValueSet: AgroSUSSituacaoPosseVS
Id: agrosus-situacao-posse
Title: "Situação de Posse da Terra"
Description: "Situações de posse da propriedade rural."
* ^status = #draft
* ^experimental = true

* AgroSUSPropriedadeCS#posse-proprietario
* AgroSUSPropriedadeCS#posse-arrendatario
* AgroSUSPropriedadeCS#posse-meeiro
* AgroSUSPropriedadeCS#posse-assentado
* AgroSUSPropriedadeCS#posse-cedida
* AgroSUSPropriedadeCS#posse-outra


ValueSet: AgroSUSAtividadeAgricolaVS
Id: agrosus-atividade-agricola
Title: "Principal Atividade Agrícola"
Description: "Principais atividades desenvolvidas na propriedade rural."
* ^status = #draft
* ^experimental = true

* AgroSUSPropriedadeCS#atividade-lavoura-temporaria
* AgroSUSPropriedadeCS#atividade-lavoura-permanente
* AgroSUSPropriedadeCS#atividade-horticultura
* AgroSUSPropriedadeCS#atividade-fruticultura
* AgroSUSPropriedadeCS#atividade-pecuaria
* AgroSUSPropriedadeCS#atividade-outra


ValueSet: AgroSUSTipoProducaoVS
Id: agrosus-tipo-producao
Title: "Tipo de Produção Agrícola"
Description: "Tipos de produção utilizados na propriedade rural."
* ^status = #draft
* ^experimental = true

* AgroSUSPropriedadeCS#producao-convencional
* AgroSUSPropriedadeCS#producao-organica
* AgroSUSPropriedadeCS#producao-agroecologica
* AgroSUSPropriedadeCS#producao-integrada
* AgroSUSPropriedadeCS#producao-outra


ValueSet: AgroSUSFonteAguaVS
Id: agrosus-fonte-agua
Title: "Fonte de Água da Propriedade"
Description: "Fontes de água utilizadas na propriedade rural."
* ^status = #draft
* ^experimental = true

* AgroSUSPropriedadeCS#agua-rede-publica
* AgroSUSPropriedadeCS#agua-poco-artesiano
* AgroSUSPropriedadeCS#agua-poco-comum
* AgroSUSPropriedadeCS#agua-rio-corrego
* AgroSUSPropriedadeCS#agua-acude-represa
* AgroSUSPropriedadeCS#agua-cisterna
* AgroSUSPropriedadeCS#agua-outra