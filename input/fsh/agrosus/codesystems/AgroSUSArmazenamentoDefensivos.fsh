CodeSystem: AgroSUSArmazenamentoDefensivosCS
Id: agrosus-armazenamento-defensivos
Title: "Armazenamento de defensivos agrícolas AgroSUS"
Description: "Terminologia dos locais utilizados para armazenamento de defensivos agrícolas."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #deposito-isolado-especifico
    "Depósito isolado e específico"
    "Os defensivos agrícolas são armazenados em depósito isolado e destinado especificamente a essa finalidade."

* #galpao-geral
    "Galpão geral"
    "Os defensivos agrícolas são armazenados em galpão utilizado também para outras finalidades."

* #dentro-residencia
    "Dentro da residência"
    "Os defensivos agrícolas são armazenados no interior da residência."

* #ao-ar-livre
    "Ao ar livre"
    "Os defensivos agrícolas são armazenados em área externa sem depósito fechado."

* #outro
    "Outro"
    "Outro local de armazenamento não especificado."


ValueSet: AgroSUSLocalArmazenamentoDefensivosVS
Id: agrosus-local-armazenamento-defensivos
Title: "Local de armazenamento dos defensivos agrícolas"
Description: "Locais onde os defensivos agrícolas são armazenados na propriedade."

* ^status = #active
* ^experimental = false

* include codes from system AgroSUSArmazenamentoDefensivosCS