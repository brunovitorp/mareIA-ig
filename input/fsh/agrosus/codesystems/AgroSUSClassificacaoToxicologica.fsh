CodeSystem: AgroSUSClassificacaoToxicologicaCS
Id: agrosus-classificacao-toxicologica
Title: "Classificação Toxicológica de Defensivos Agrícolas"
Description: "Representação FHIR das categorias de classificação toxicológica estabelecidas pela Anvisa."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "Classificação conforme a RDC Anvisa nº 294/2019."

* #categoria-1
    "Categoria 1 — Produto extremamente tóxico"
    "Produto extremamente tóxico, identificado por faixa vermelha."

* #categoria-2
    "Categoria 2 — Produto altamente tóxico"
    "Produto altamente tóxico, identificado por faixa vermelha."

* #categoria-3
    "Categoria 3 — Produto moderadamente tóxico"
    "Produto moderadamente tóxico, identificado por faixa amarela."

* #categoria-4
    "Categoria 4 — Produto pouco tóxico"
    "Produto pouco tóxico, identificado por faixa azul."

* #categoria-5
    "Categoria 5 — Produto improvável de causar dano agudo"
    "Produto improvável de causar dano agudo, identificado por faixa azul."

* #nao-classificado
    "Produto não classificado"
    "Produto não classificado, identificado por faixa verde."


ValueSet: AgroSUSClassificacaoToxicologicaVS
Id: agrosus-classificacao-toxicologica
Title: "Classificação Toxicológica de Defensivos Agrícolas"
Description: "Categorias toxicológicas permitidas no formulário AgroSUS."
* ^status = #draft
* ^experimental = true

* include codes from system AgroSUSClassificacaoToxicologicaCS