CodeSystem: AgroSUSTipoColetaCS
Id: agrosus-tipo-coleta
Title: "Tipos de Coleta AgroSUS"
Description: "Modalidades de aplicação do formulário de anamnese ocupacional e ambiental do AgroSUS."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #cadastro-inicial
    "Cadastro inicial"
    "Primeira aplicação do formulário ao trabalhador rural."

* #acompanhamento-semestral
    "Acompanhamento semestral"
    "Aplicação periódica semestral para acompanhamento do trabalhador rural."

* #visita-alerta
    "Visita de alerta"
    "Aplicação motivada por alerta, alteração clínica ou necessidade de reavaliação."


ValueSet: AgroSUSTipoColetaVS
Id: agrosus-tipo-coleta
Title: "Tipos de Coleta AgroSUS"
Description: "Modalidades permitidas para aplicação do formulário AgroSUS."
* ^status = #draft
* ^experimental = true

* include codes from system AgroSUSTipoColetaCS