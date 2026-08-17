# PRD — IG CardioRemoto (mareIA / WHO SMART Guidelines)

- **Produto:** Implementation Guide FHIR R4 da linha de cuidado CardioRemoto.
- **Versão:** 0.1.0 (WP1 / UFPB) · **Status:** draft · **Data:** 2026-06
- **Fonte L1:** `sources/CardioRemoto/CardioRemoto-Metodologia-HULW-UFPB.docx` e `sources/CardioRemoto/CardioRemotoDocumentoRequisitosV2.docx`

## 1. Problema
Pacientes com Diabetes Mellitus (DM) e/ou Hipertensão Arterial Sistêmica (HAS) acompanhados em ambulatórios de telessaúde especializados (como no Hospital Universitário Lauro Wanderley — HULW/UFPB) frequentemente enfrentam longos intervalos entre consultas, invisibilidade clínica de parâmetros vitais/laboratoriais e atrasos na identificação de descompensações cardiometabólicas agudas. Para viabilizar interoperabilidade com o SUS Digital e sistemas hospitalares (AGHUX/EBSERH), a diretriz clínica precisa ser formalizada nas camadas L2 (DAK) e L3 (FHIR R4).

## 2. Objetivo
Entregar um IG FHIR R4 que represente fielmente o fluxo do CardioRemoto: elegibilidade e cadastro → triagem clínica e antropométrica com IoT → exames laboratoriais no HULW → classificação de risco cardiovascular (Controlado / Moderado / Grave) → sistema de alertas em 4 níveis (Vermelho, Laranja, Amarelo, Sem disparo) → periodicidade de monitoramento e integração com AGHUX.

## 3. Escopo
- **Inclui:** Pathway CardioRemoto (DM e HAS), sinais vitais IoT (PA, FC, Glicemia), parâmetros antropométricos (Peso, Altura, IMC, Cintura), exames laboratoriais (HbA1c, Perfil Lipídico, Creatinina, TFG), lógica de risco e 4 níveis de alertas, regras de periodicidade de visitas (90 dias para verde, 30 dias para amarelo/vermelho), priorização de visitas por atraso, requisitos funcionais (RF001–RF008) e não-funcionais (RNF001–RNF005).
- **Exclui:** Demais pathways da mareIA (ATENTO 60+, FamilIAr_Ativa, AgroSUS), implementação do frontend mobile/web, código fonte da integração proprietária AGHUX além da especificação de endpoints FHIR.

## 4. Personas (resumo — ver L2 §2)
- Paciente com DM e/ou HAS (Adulto ou Idoso com risco cardiovascular aterosclerótico).
- Agente de Saúde / Técnico de Coleta (responsável pela coleta e sincronização offline-first).
- Médica Endocrinologista / Cardiologista do HULW (responsável pela teleconsulta e condutas clínicas).
- Nutricionista (apoio nas metas de controle lipídico e glicêmico).
- Gestor do Serviço de Telessaúde / Pesquisadores UFPB.

## 5. Requisitos-chave (ver L2 §8)
- **RF:** Logar no sistema (RF001); cadastrar paciente com fatores de risco (RF002); filtrar pacientes por risco (RF003); ordenar pacientes por prioridade/atraso de visita (RF004); inserir nova visita com dados IoT e laboratoriais (RF005); visualizar evolução temporal (RF006); sincronização manual/offline-first (RF007); encerrar sessão segura (RF008).
- **RNF:** Funcionamento offline-first (RNF001); interface responsiva (RNF002); criptografia e conformidade LGPD (RNF003); controle de acesso baseado em papéis (RNF004); logs de auditoria (RNF005).

## 6. Critérios de aceite
1. `sushi .` compila com **0 erros**.
2. IG Publisher gera site com 0 erros de QA.
3. Perfis FHIR para Sinais Vitais (PA com painel sistólica/diastólica, FC, Glicemia) e Laboratoriais (HbA1c, LDL, HDL, Triglicerídeos, Creatinina).
4. `PlanDefinition` e `Library` modelam a lógica de estratificação de risco (Verde, Amarelo, Vermelho), os gatilhos de alerta e a periodicidade de monitoramento.
5. Pelo menos 2 `Measures` cobrindo metas clínicas (PA controlada e HbA1c controlada).
6. Rastreabilidade L3→L1 presente em todos os artefatos.
