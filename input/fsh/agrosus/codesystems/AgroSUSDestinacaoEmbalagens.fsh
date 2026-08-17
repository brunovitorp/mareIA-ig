CodeSystem: AgroSUSDestinacaoEmbalagensCS
Id: agrosus-destinacao-embalagens
Title: "Destinação de embalagens vazias AgroSUS"
Description: "Terminologia das formas de destinação de embalagens vazias de defensivos agrícolas quando não são devolvidas em local autorizado."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #queima
    "Queima"
    "As embalagens vazias são queimadas."

* #enterra
    "Enterra"
    "As embalagens vazias são enterradas."

* #lanca-rio-corrego
    "Lança em rio ou córrego"
    "As embalagens vazias são descartadas em rio, córrego ou outro curso de água."

* #lixo-comum
    "Lixo comum"
    "As embalagens vazias são descartadas junto aos resíduos comuns."

* #reutiliza
    "Reutiliza"
    "As embalagens vazias são reutilizadas para outra finalidade."

* #outro
    "Outro"
    "Outra forma de destinação não especificada."


ValueSet: AgroSUSDestinacaoEmbalagensNaoDevolvidasVS
Id: agrosus-destinacao-embalagens-nao-devolvidas
Title: "Destinação de embalagens não devolvidas"
Description: "Formas de destinação das embalagens vazias quando não ocorre devolução em local autorizado."

* ^status = #active
* ^experimental = false

* include codes from system AgroSUSDestinacaoEmbalagensCS