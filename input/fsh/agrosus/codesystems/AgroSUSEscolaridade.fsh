CodeSystem: AgroSUSEscolaridadeCS
Id: agrosus-escolaridade
Title: "Escolaridade AgroSUS"
Description: "Categorias de escolaridade utilizadas no formulário de anamnese AgroSUS."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete

* #sem-escolaridade
    "Sem escolaridade"
    "Pessoa que declara não possuir escolaridade formal."

* #fundamental-incompleto
    "Ensino fundamental incompleto"
    "Pessoa que iniciou, mas não concluiu o ensino fundamental."

* #fundamental-completo
    "Ensino fundamental completo"
    "Pessoa que concluiu o ensino fundamental."

* #medio
    "Ensino médio"
    "Pessoa que declara escolaridade em nível de ensino médio."

* #superior
    "Ensino superior"
    "Pessoa que declara escolaridade em nível de ensino superior."


ValueSet: AgroSUSEscolaridadeVS
Id: agrosus-escolaridade
Title: "Escolaridade AgroSUS"
Description: "Categorias permitidas para escolaridade no formulário AgroSUS."
* ^status = #draft
* ^experimental = true

* include codes from system AgroSUSEscolaridadeCS