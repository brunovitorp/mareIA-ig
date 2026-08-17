// Fonte L1: ADR-0001; ADR-0002. L2: 6-decision-logic (conduta-alerta-geral).
CodeSystem: AgroSUSPrioridadeAlertaCS
Id: agrosus-prioridade-alerta
Title: "Prioridade de Alerta AgroSUS"
Description: "Níveis de prioridade clínica para os alertas gerados pela lógica de decisão do AgroSUS (colinesterase alterada, sintoma agudo, produto categoria 1/2 sem EPI, histórico de intoxicação)."
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true

* #critica "Crítica" "Achado com indicação de afastamento imediato do contato com o defensivo e avaliação assistencial prioritária (ex.: colinesterase alterada; sintoma agudo compatível com intoxicação)."
* #atencao "Atenção" "Achado que exige verificação ou reforço de medidas de proteção, sem indicação de afastamento imediato (ex.: precaução de colinesterase entre 20% e 50%/25%)."
* #informativa "Informativa" "Achado registrado para acompanhamento longitudinal, sem conduta imediata associada."


ValueSet: AgroSUSPrioridadeAlertaVS
Id: agrosus-prioridade-alerta
Title: "Prioridade de Alerta AgroSUS"
Description: "Níveis de prioridade permitidos para os alertas da lógica de decisão do AgroSUS."
* ^status = #draft
* ^experimental = true

* include codes from system AgroSUSPrioridadeAlertaCS
