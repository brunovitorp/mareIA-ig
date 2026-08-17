CodeSystem: AgroSUSAvaliacaoBoasPraticasCS
Id: agrosus-avaliacao-boas-praticas
Title: "Avaliação de boas práticas agrícolas AgroSUS"
Description: "Terminologia utilizada para avaliar o atendimento aos indicadores de boas práticas agrícolas no formulário AgroSUS."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #sim
    "Sim"
    "A boa prática avaliada é realizada ou atendida."

* #nao
    "Não"
    "A boa prática avaliada não é realizada ou não é atendida."

* #nao-se-aplica
    "Não se aplica"
    "A boa prática avaliada não se aplica à situação do trabalhador ou da propriedade."


ValueSet: AgroSUSAvaliacaoBoasPraticasVS
Id: agrosus-avaliacao-boas-praticas
Title: "Respostas dos indicadores de boas práticas"
Description: "Respostas permitidas para cada indicador de boa prática agrícola."

* ^status = #active
* ^experimental = false

* include codes from system AgroSUSAvaliacaoBoasPraticasCS