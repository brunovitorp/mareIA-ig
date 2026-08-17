CodeSystem: AgroSUSCapacitacaoCS
Id: agrosus-capacitacao
Title: "Temas de Capacitação AgroSUS"
Description: "Temas abordados em capacitações sobre o uso seguro de defensivos agrícolas."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #uso-manuseio-seguro
    "Uso e manuseio seguro"
    "Orientações para uso e manuseio seguro de defensivos agrícolas."

* #epis
    "Equipamentos de proteção individual"
    "Orientações sobre seleção, utilização e conservação de EPIs."

* #armazenamento
    "Armazenamento"
    "Orientações sobre armazenamento seguro de defensivos agrícolas."

* #descarte-embalagens
    "Descarte de embalagens"
    "Orientações sobre lavagem, devolução e destinação de embalagens vazias."

* #primeiros-socorros
    "Primeiros socorros"
    "Orientações sobre primeiros socorros relacionados à exposição."

* #outros
    "Outros temas"
    "Outros temas abordados durante a capacitação."


ValueSet: AgroSUSTemasCapacitacaoVS
Id: agrosus-temas-capacitacao
Title: "Temas de Capacitação AgroSUS"
Description: "Temas que podem ser selecionados no registro de capacitação do trabalhador rural."
* ^status = #draft
* ^experimental = true

* include codes from system AgroSUSCapacitacaoCS