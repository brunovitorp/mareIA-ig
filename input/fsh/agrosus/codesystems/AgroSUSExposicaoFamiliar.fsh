CodeSystem: AgroSUSExposicaoFamiliarCS
Id: agrosus-exposicao-familiar
Title: "Exposição familiar AgroSUS"
Description: "Terminologia para identificar familiares que auxiliam na aplicação de defensivos agrícolas."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #conjuge
    "Cônjuge"
    "Cônjuge ou companheiro do trabalhador rural."

* #filhos
    "Filhos"
    "Filhos ou filhas do trabalhador rural."

* #pais-sogros
    "Pais ou sogros"
    "Pais, mães, sogros ou sogras do trabalhador rural."

* #outros
    "Outros familiares"
    "Outros familiares que auxiliam na aplicação de defensivos agrícolas."


ValueSet: AgroSUSFamiliaresAuxiliamAplicacaoVS
Id: agrosus-familiares-auxiliam-aplicacao
Title: "Familiares que auxiliam na aplicação"
Description: "Familiares que auxiliam o trabalhador rural na aplicação de defensivos agrícolas."

* ^status = #active
* ^experimental = false

* include codes from system AgroSUSExposicaoFamiliarCS