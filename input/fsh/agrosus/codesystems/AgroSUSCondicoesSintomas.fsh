CodeSystem: AgroSUSCondicoesSintomasCS
Id: agrosus-condicoes-sintomas
Title: "Condições de saúde e sintomas AgroSUS"
Description: "Terminologia dos itens de condições de saúde e sintomas referidos no formulário de anamnese AgroSUS. Os códigos representam respostas do instrumento e não diagnósticos clínicos confirmados."

* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// Condições de saúde referidas
* #condicao-hipertensao
    "Hipertensão"

* #condicao-diabetes
    "Diabetes"

* #condicao-doenca-hepatica
    "Doença hepática"

* #condicao-doenca-renal
    "Doença renal"

* #condicao-doenca-neurologica
    "Doença neurológica"

* #condicao-cancer
    "Câncer"

* #condicao-gestante-lactante
    "Gestante ou lactante"

* #condicao-nenhuma
    "Nenhuma condição referida"

// Sinais e sintomas dos últimos 30 dias
* #sintoma-cefaleia-frequente
    "Dor de cabeça (cefaleia) frequente"

* #sintoma-tontura-vertigem
    "Tontura ou vertigem"

* #sintoma-nauseas
    "Náuseas"

* #sintoma-vomitos
    "Vômitos"

* #sintoma-diarreia-colicas-abdominais
    "Diarreia ou cólicas abdominais"

* #sintoma-tremores-contracoes-involuntarias
    "Tremores ou contrações musculares involuntárias"

* #sintoma-fraqueza-cansaco-extremo
    "Fraqueza ou cansaço extremo"

* #sintoma-diaforese
    "Suor excessivo (diaforese)"

* #sintoma-hipersalivacao
    "Salivação excessiva (hipersalivação)"

* #sintoma-irritacao-ocular
    "Irritação nos olhos, lacrimejamento ou hiperemia"

* #sintoma-irritacao-dermatite-pele
    "Irritação ou dermatite na pele"

* #sintoma-dispneia
    "Falta de ar ou dispneia"

* #sintoma-tosse-frequente
    "Tosse seca ou produtiva frequente"

* #sintoma-palpitacoes
    "Palpitações ou batimentos irregulares"

* #sintoma-alteracao-visual
    "Alteração visual ou visão turva"

* #sintoma-confusao-desorientacao
    "Confusão mental ou desorientação"

* #sintoma-dificuldade-memoria-concentracao
    "Dificuldade de memória ou concentração"

* #sintoma-disturbios-sono
    "Distúrbios do sono, insônia ou hipersonia"

* #sintoma-formigamento-membros
    "Formigamento nos membros"

* #sintoma-irritabilidade-alteracoes-humor
    "Irritabilidade ou alterações de humor"


ValueSet: AgroSUSCondicaoSaudeReferidaVS
Id: agrosus-condicao-saude-referida
Title: "Condições de saúde referidas"
Description: "Condições de saúde preexistentes declaradas pelo trabalhador durante a anamnese."

* ^status = #active
* ^experimental = false

* AgroSUSCondicoesSintomasCS#condicao-hipertensao
* AgroSUSCondicoesSintomasCS#condicao-diabetes
* AgroSUSCondicoesSintomasCS#condicao-doenca-hepatica
* AgroSUSCondicoesSintomasCS#condicao-doenca-renal
* AgroSUSCondicoesSintomasCS#condicao-doenca-neurologica
* AgroSUSCondicoesSintomasCS#condicao-cancer
* AgroSUSCondicoesSintomasCS#condicao-gestante-lactante
* AgroSUSCondicoesSintomasCS#condicao-nenhuma


ValueSet: AgroSUSSintomaUltimos30DiasVS
Id: agrosus-sintoma-ultimos-30-dias
Title: "Sinais e sintomas dos últimos 30 dias"
Description: "Sinais e sintomas investigados pelo formulário AgroSUS, sem significado diagnóstico isolado."

* ^status = #active
* ^experimental = false

* AgroSUSCondicoesSintomasCS#sintoma-cefaleia-frequente
* AgroSUSCondicoesSintomasCS#sintoma-tontura-vertigem
* AgroSUSCondicoesSintomasCS#sintoma-nauseas
* AgroSUSCondicoesSintomasCS#sintoma-vomitos
* AgroSUSCondicoesSintomasCS#sintoma-diarreia-colicas-abdominais
* AgroSUSCondicoesSintomasCS#sintoma-tremores-contracoes-involuntarias
* AgroSUSCondicoesSintomasCS#sintoma-fraqueza-cansaco-extremo
* AgroSUSCondicoesSintomasCS#sintoma-diaforese
* AgroSUSCondicoesSintomasCS#sintoma-hipersalivacao
* AgroSUSCondicoesSintomasCS#sintoma-irritacao-ocular
* AgroSUSCondicoesSintomasCS#sintoma-irritacao-dermatite-pele
* AgroSUSCondicoesSintomasCS#sintoma-dispneia
* AgroSUSCondicoesSintomasCS#sintoma-tosse-frequente
* AgroSUSCondicoesSintomasCS#sintoma-palpitacoes
* AgroSUSCondicoesSintomasCS#sintoma-alteracao-visual
* AgroSUSCondicoesSintomasCS#sintoma-confusao-desorientacao
* AgroSUSCondicoesSintomasCS#sintoma-dificuldade-memoria-concentracao
* AgroSUSCondicoesSintomasCS#sintoma-disturbios-sono
* AgroSUSCondicoesSintomasCS#sintoma-formigamento-membros
* AgroSUSCondicoesSintomasCS#sintoma-irritabilidade-alteracoes-humor