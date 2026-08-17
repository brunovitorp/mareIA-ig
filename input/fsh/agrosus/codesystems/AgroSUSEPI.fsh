CodeSystem: AgroSUSEPICS
Id: agrosus-epi
Title: "Terminologia de equipamentos de proteção individual AgroSUS"
Description: "Terminologia para frequência de uso, armazenamento e motivos de não utilização dos equipamentos de proteção individual."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// Frequência de utilização
* #uso-sempre
    "Sempre"
    "O equipamento de proteção individual é utilizado sempre."

* #uso-as-vezes
    "Às vezes"
    "O equipamento de proteção individual é utilizado ocasionalmente."

* #uso-nunca
    "Nunca"
    "O trabalhador possui o equipamento, mas nunca o utiliza."

* #nao-possui
    "Não possui"
    "O trabalhador não possui o equipamento de proteção individual."

// Armazenamento dos EPIs
* #armazenamento-local-especific-separado
    "Local específico e separado"
    "Os equipamentos são armazenados em local específico e separado."

* #armazenamento-junto-roupas-pessoais
    "Junto de roupas pessoais"
    "Os equipamentos são armazenados junto de roupas pessoais."

* #armazenamento-deposito-defensivos
    "Depósito de defensivos"
    "Os equipamentos são armazenados no depósito de defensivos agrícolas."

// Motivos de não utilização
* #motivo-desconforto
    "Desconforto"
    "O equipamento não é utilizado devido ao desconforto."

* #motivo-descuido
    "Descuido"
    "O equipamento não é utilizado por descuido."

* #motivo-considera-desnecessario
    "Considera desnecessário"
    "O trabalhador considera desnecessária a utilização do equipamento."

* #motivo-custo-elevado
    "Custo elevado"
    "O equipamento não é utilizado devido ao custo elevado."

* #outro
    "Outro"
    "Outra forma de armazenamento ou outro motivo não especificado."


ValueSet: AgroSUSFrequenciaUsoEPIVS
Id: agrosus-frequencia-uso-epi
Title: "Frequência de utilização de EPI"
Description: "Frequência declarada de utilização de cada equipamento de proteção individual."

* ^status = #active
* ^experimental = false

* AgroSUSEPICS#uso-sempre
* AgroSUSEPICS#uso-as-vezes
* AgroSUSEPICS#uso-nunca
* AgroSUSEPICS#nao-possui


ValueSet: AgroSUSArmazenamentoEPIVS
Id: agrosus-armazenamento-epi
Title: "Local de armazenamento dos EPIs"
Description: "Locais utilizados para o armazenamento dos equipamentos de proteção individual."

* ^status = #active
* ^experimental = false

* AgroSUSEPICS#armazenamento-local-especific-separado
* AgroSUSEPICS#armazenamento-junto-roupas-pessoais
* AgroSUSEPICS#armazenamento-deposito-defensivos
* AgroSUSEPICS#outro


ValueSet: AgroSUSMotivoNaoUsoEPIVS
Id: agrosus-motivo-nao-uso-epi
Title: "Motivos de não utilização de EPI"
Description: "Motivos declarados para a não utilização dos equipamentos de proteção individual."

* ^status = #active
* ^experimental = false

* AgroSUSEPICS#nao-possui
* AgroSUSEPICS#motivo-desconforto
* AgroSUSEPICS#motivo-descuido
* AgroSUSEPICS#motivo-considera-desnecessario
* AgroSUSEPICS#motivo-custo-elevado
* AgroSUSEPICS#outro