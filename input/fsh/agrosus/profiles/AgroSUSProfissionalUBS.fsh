Profile: AgroSUSProfissionalUBS
Parent: PractitionerMareIABase
Id: agrosus-profissional-ubs
Title: "Profissional Assistencial da UBS AgroSUS"
Description: "Profissional da Unidade Básica de Saúde responsável pela avaliação clínica, acompanhamento ou apoio assistencial ao trabalhador rural no AgroSUS."

* active 1..1 MS
* active ^short = "Indica se o cadastro do profissional está ativo"

* identifier[cns] 1..1 MS
* identifier[cns] ^short = "CNS do profissional assistencial"

* identifier[cpf] MS
* identifier[cpf] ^short = "CPF do profissional assistencial"

* identifier[identificadorMedico] MS
* identifier[identificadorMedico] ^short = "Registro profissional no conselho de medicina, quando aplicável"

* identifier[identificadorEnfermeiro] MS
* identifier[identificadorEnfermeiro] ^short = "Registro profissional no conselho de enfermagem, quando aplicável"

* name 1..* MS
* name ^short = "Nome completo do profissional"

* telecom MS
* telecom ^short = "Meio de contato profissional"

* qualification MS
* qualification ^short = "Formação, especialidade ou qualificação profissional"

* qualification.code MS
