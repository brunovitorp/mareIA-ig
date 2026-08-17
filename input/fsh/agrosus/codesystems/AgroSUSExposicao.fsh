CodeSystem: AgroSUSExposicaoCS
Id: agrosus-exposicao
Title: "Terminologia de exposição ocupacional AgroSUS"
Description: "Terminologia das características de frequência e forma de exposição aos defensivos agrícolas."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// Dias de aplicação por mês
* #dias-mes-1-2 "1–2 dias por mês"
* #dias-mes-3-5 "3–5 dias por mês"
* #dias-mes-6-10 "6–10 dias por mês"
* #dias-mes-mais-10 "Mais de 10 dias por mês"

// Horas de aplicação por dia
* #horas-dia-menos-2 "Menos de 2 horas por dia"
* #horas-dia-2-4 "2–4 horas por dia"
* #horas-dia-4-6 "4–6 horas por dia"
* #horas-dia-mais-6 "Mais de 6 horas por dia"

// Meses do ano
* #janeiro "Janeiro"
* #fevereiro "Fevereiro"
* #marco "Março"
* #abril "Abril"
* #maio "Maio"
* #junho "Junho"
* #julho "Julho"
* #agosto "Agosto"
* #setembro "Setembro"
* #outubro "Outubro"
* #novembro "Novembro"
* #dezembro "Dezembro"

// Equipamentos de aplicação
* #pulverizador-costal-manual
    "Pulverizador costal manual"
* #pulverizador-costal-motorizado
    "Pulverizador costal motorizado"
* #trator-com-barra
    "Trator com barra"

// Vias de exposição
* #cutanea
    "Cutânea (pele)"
* #respiratoria
    "Respiratória (inalação)"
* #ocular
    "Ocular"
* #digestiva-oral
    "Digestiva ou oral"
* #multiplas-vias
    "Múltiplas vias"

// Responsável pela aplicação
* #proprio-produtor
    "O próprio produtor"
* #familiar
    "Familiar"
* #trabalhador-contratado
    "Trabalhador contratado"
* #empresa-terceirizada
    "Empresa terceirizada"
* #outro
    "Outro"


ValueSet: AgroSUSDiasAplicacaoMesVS
Id: agrosus-dias-aplicacao-mes
Title: "Dias de aplicação por mês"
Description: "Faixas de frequência mensal de aplicação de defensivos agrícolas."

* ^status = #active
* ^experimental = false

* AgroSUSExposicaoCS#dias-mes-1-2
* AgroSUSExposicaoCS#dias-mes-3-5
* AgroSUSExposicaoCS#dias-mes-6-10
* AgroSUSExposicaoCS#dias-mes-mais-10


ValueSet: AgroSUSHorasAplicacaoDiaVS
Id: agrosus-horas-aplicacao-dia
Title: "Horas de aplicação por dia"
Description: "Faixas de duração diária da aplicação de defensivos agrícolas."

* ^status = #active
* ^experimental = false

* AgroSUSExposicaoCS#horas-dia-menos-2
* AgroSUSExposicaoCS#horas-dia-2-4
* AgroSUSExposicaoCS#horas-dia-4-6
* AgroSUSExposicaoCS#horas-dia-mais-6


ValueSet: AgroSUSMesMaiorIntensidadeVS
Id: agrosus-mes-maior-intensidade
Title: "Meses de maior intensidade de uso"
Description: "Meses do ano com maior intensidade de utilização de defensivos agrícolas."

* ^status = #active
* ^experimental = false

* AgroSUSExposicaoCS#janeiro
* AgroSUSExposicaoCS#fevereiro
* AgroSUSExposicaoCS#marco
* AgroSUSExposicaoCS#abril
* AgroSUSExposicaoCS#maio
* AgroSUSExposicaoCS#junho
* AgroSUSExposicaoCS#julho
* AgroSUSExposicaoCS#agosto
* AgroSUSExposicaoCS#setembro
* AgroSUSExposicaoCS#outubro
* AgroSUSExposicaoCS#novembro
* AgroSUSExposicaoCS#dezembro


ValueSet: AgroSUSEquipamentoAplicacaoVS
Id: agrosus-equipamento-aplicacao
Title: "Equipamentos utilizados na aplicação"
Description: "Tipos de equipamento utilizados na aplicação de defensivos agrícolas."

* ^status = #active
* ^experimental = false

* AgroSUSExposicaoCS#pulverizador-costal-manual
* AgroSUSExposicaoCS#pulverizador-costal-motorizado
* AgroSUSExposicaoCS#trator-com-barra


ValueSet: AgroSUSViaExposicaoVS
Id: agrosus-via-exposicao
Title: "Vias de exposição"
Description: "Vias mais comuns de exposição aos defensivos agrícolas."

* ^status = #active
* ^experimental = false

* AgroSUSExposicaoCS#cutanea
* AgroSUSExposicaoCS#respiratoria
* AgroSUSExposicaoCS#ocular
* AgroSUSExposicaoCS#digestiva-oral
* AgroSUSExposicaoCS#multiplas-vias


ValueSet: AgroSUSResponsavelAplicacaoVS
Id: agrosus-responsavel-aplicacao
Title: "Responsável pela aplicação"
Description: "Pessoas ou organizações que realizam a aplicação dos defensivos agrícolas."

* ^status = #active
* ^experimental = false

* AgroSUSExposicaoCS#proprio-produtor
* AgroSUSExposicaoCS#familiar
* AgroSUSExposicaoCS#trabalhador-contratado
* AgroSUSExposicaoCS#empresa-terceirizada
* AgroSUSExposicaoCS#outro