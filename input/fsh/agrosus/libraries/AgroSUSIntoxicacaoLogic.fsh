// Fonte L1: NR-7 item 7.4 (Quadro I); NR-31 item 31.8; Nota Informativa nº 16/2019-CGLAB/DAEVS/SVS/MS,
// Anexos I e III. L2: 6-decision-logic.csv. REVISAR ADR-0002 (não há escore composto validado).
Instance: AgroSUSIntoxicacaoLogic
InstanceOf: Library
Usage: #definition
* status = #active
* experimental = true
* type = $library-type#logic-library
* name = "AgroSUSIntoxicacaoLogic"
* title = "Lógica de decisão da vigilância de intoxicação por defensivos agrícolas (AgroSUS)"
* description = """
Regras de decisão do pathway AgroSUS (humano-legíveis; implementação em CQL prevista para fase L4).
Fundamentadas em NR-7, NR-31 e na Nota Informativa nº 16/2019-CGLAB/DAEVS/SVS/MS. Não há, nessas
fontes, um escore composto de risco — ver ADR-0002. A lógica combina um indicador biológico
objetivo (colinesterase) com gatilhos de alerta discretos e independentes.

1) VALOR BASAL DA COLINESTERASE: obtido no exame admissional, antes do início do manuseio de
   organofosforados/carbamatos. Se ausente, afastar o trabalhador por 30 dias e realizar o exame
   (idealmente 2 análises com 7–15 dias de intervalo). Repetir a obtenção a cada 2 anos.
   Fonte: NR-7 item 7.4.1; Nota Informativa 16/2019, Anexo I item 1 e 3.

2) PERCENTUAL DE INIBIÇÃO: % inibição = (atividade basal − atividade obtida) / atividade basal × 100.
   Fonte: Nota Informativa 16/2019, Anexo I item 4.

3) CLASSIFICAÇÃO DO RESULTADO:
   - Colinesterase PLASMÁTICA: até 50% de inibição = Normal; acima de 50% = Alterado (excede o
     Índice Biológico Máximo Permitido — IBMP).
   - Colinesterase de SANGUE TOTAL/ERITROCITÁRIA: até 25% de inibição = Normal; acima de 25% =
     Alterado (excede o IBMP).
   - PRECAUÇÃO: redução de 20% ou no mínimo 30% (mesmo sem atingir o IBMP) → alerta de atenção,
     reforçar práticas de proteção (EPI/técnica de aplicação), sem afastamento automático.
   Fonte: NR-7 Quadro I; Nota Informativa 16/2019, Anexo I item 4 e Quadro 1.

4) PERIODICIDADE DO MONITORAMENTO BIOLÓGICO: no mínimo SEMESTRAL em rotina (podendo ser reduzida
   por critério do médico coordenador do PCMSO ou negociação coletiva). Gatilhos adicionais,
   independentes da rotina: exame admissional; retorno ao trabalho após afastamento > 30 dias;
   mudança de função; sintomático (a qualquer tempo, mediante solicitação médica); após aplicações
   em surto/bloqueio; retestagem após resultado alterado.
   Fonte: NR-7 itens 7.4.2.1 e 7.4.3.3; Nota Informativa 16/2019, Anexo III item 1.1.

5) CONDUTA FRENTE A RESULTADO ALTERADO: afastar o trabalhador do contato com o agrotóxico por 30
   dias; encaminhar para avaliação clínica e laboratorial no serviço de saúde do trabalhador;
   repetir o exame após 30 dias; investigar outras causas de depressão enzimática antes de
   concluir pela exposição ocupacional.
   Fonte: Nota Informativa 16/2019, Anexo III item 3.

6) CONTRAINDICAÇÃO AO MANUSEIO: trabalhadores com hepatopatia, cardiopatia, pneumopatia,
   desnutrição, gestação, lactação, câncer, imunossupressão, neuropatia, ou uso de medicamento
   colinesterase-inibidor não devem manusear organofosforados/carbamatos.
   Fonte: Nota Informativa 16/2019, Anexo III item 2.2.

7) GATILHOS DE ALERTA INDEPENDENTES (não pontuados, não compõem escore):
   - Sintoma agudo compatível com intoxicação (Seção 13 da anamnese) → ALERTA crítico.
   - Manuseio de defensivo de categoria toxicológica 1 ou 2 (AgroSUSClassificacaoToxicologicaVS)
     sem EPI adequado registrado (Seção 9) → ALERTA crítico.
   - Histórico de intoxicação aguda prévia (Seção 14) → ALERTA de acompanhamento prioritário.
   - Colinesterase alterada (regra 3) → ALERTA crítico; colinesterase em precaução → ALERTA de
     atenção.
   Conduta comum a qualquer ALERTA: priorizar avaliação clínica na UBS e considerar antecipação do
   plano de acompanhamento (`AgroSUSPlanoAcompanhamento`). Suporte à decisão — não substitui o
   julgamento clínico do profissional assistencial.

8) REGISTRO: eventos de exame, afastamento e conduta devem ser mantidos no prontuário/registro
   individual por, no mínimo, 40 anos após o desligamento do trabalhador (exceção de substância
   cancerígena da NR-7 item 7.4.5, aplicada de forma geral por decisão clínica de 22/07/2026 — ver
   ADR-0006; regra geral sem essa exceção seria 20 anos, item 7.4.5.1).

DECISÃO REGISTRADA (ADR-0002, aceito em 22/07/2026): os gatilhos acima permanecem discretos e
independentes — não existe, nas fontes L1 adotadas, uma fórmula de escore composto de risco
ocupacional validada. Não inferir pesos ou combinação entre os gatilhos sem validação clínica.
"""
