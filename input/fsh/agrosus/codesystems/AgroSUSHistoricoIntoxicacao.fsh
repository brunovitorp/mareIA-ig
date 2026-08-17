CodeSystem: AgroSUSHistoricoIntoxicacaoCS
Id: agrosus-historico-intoxicacao
Title: "Histórico de intoxicação AgroSUS"
Description: "Terminologia para registrar a quantidade autorreferida de episódios anteriores de intoxicação aguda por defensivos agrícolas."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #nenhuma
    "Nenhuma"
    "O trabalhador não refere episódio anterior de intoxicação aguda."

* #uma-vez
    "1 vez"
    "O trabalhador refere um episódio anterior de intoxicação aguda."

* #duas-tres-vezes
    "2–3 vezes"
    "O trabalhador refere entre dois e três episódios anteriores de intoxicação aguda."

* #quatro-ou-mais
    "4 ou mais vezes"
    "O trabalhador refere quatro ou mais episódios anteriores de intoxicação aguda."


ValueSet: AgroSUSNumeroIntoxicacoesAgudasVS
Id: agrosus-numero-intoxicacoes-agudas
Title: "Número de intoxicações agudas anteriores"
Description: "Faixas para registro do número autorreferido de episódios anteriores de intoxicação aguda."

* ^status = #active
* ^experimental = false

* include codes from system AgroSUSHistoricoIntoxicacaoCS