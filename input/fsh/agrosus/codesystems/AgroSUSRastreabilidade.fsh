CodeSystem: AgroSUSRastreabilidadeCS
Id: agrosus-rastreabilidade
Title: "Rastreabilidade das aplicações AgroSUS"
Description: "Terminologia utilizada para identificar onde são armazenados os registros das aplicações de defensivos agrícolas."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #caderno-diario
    "Caderno ou diário"
    "Os registros das aplicações são mantidos em caderno ou diário."

* #planilha-papel
    "Planilha em papel"
    "Os registros das aplicações são mantidos em formulário ou planilha impressa."

* #aplicativo
    "Aplicativo"
    "Os registros das aplicações são mantidos em aplicativo móvel."

* #software-agricola
    "Software agrícola"
    "Os registros das aplicações são mantidos em sistema informatizado de gestão agrícola."

* #nao-registra
    "Não registra"
    "Não mantém registro das aplicações de defensivos agrícolas."


ValueSet: AgroSUSArmazenamentoRegistrosVS
Id: agrosus-armazenamento-registros
Title: "Formas de armazenamento dos registros"
Description: "Formas utilizadas para armazenar os registros das aplicações de defensivos agrícolas."

* ^status = #active
* ^experimental = false

* include codes from system AgroSUSRastreabilidadeCS