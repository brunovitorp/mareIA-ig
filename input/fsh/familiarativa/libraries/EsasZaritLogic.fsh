// Fonte L1: DAK §4.2 (etapas 4–5), §6.1–6.3 e Componente 7. L2: 6-decision-logic. REVISAR ADR-0004.
Instance: FamiliarAtivaEsasZaritLogic
InstanceOf: Library
Usage: #definition
* status = #active
* experimental = false
* type = http://terminology.hl7.org/CodeSystem/library-type#logic-library
* name = "FamiliarAtivaEsasZaritLogic"
* title = "Lógica de decisão ESAS + Zarit (FamilIAr_Ativa)"
* description = """
Regras de decisão do pathway FamilIAr_Ativa (humano-legíveis; implementação em CQL prevista para fase L4):

1) SOMA ESAS: soma dos 6 domínios (dor, dispneia, ansiedade, cansaço, apetite, bem-estar; 0–10 cada),
   com timestamp imutável. Resultado: somaEsas. As faixas do DAK vão até 70, mas o máximo aritmético
   com 6 domínios é 60 — REVISAR ADR-0004.

2) NÍVEL DE RISCO ESAS: somaEsas 0–30 = baixo; 31–50 = moderado; 51–70 = alto. REVISAR ADR-0004.
   Risco alto → orientação ao cuidador + alerta + notificação ao profissional vinculado (RA-01/RA-05).

3) PONTUAÇÃO ZARIT: soma dos 22 itens (0–4 cada) → 0–88.
   CLASSIFICAÇÃO: 0–20 = leve; 21–40 = moderada; 41–88 = severa (severa → notificar profissional, RA-02).

4) REGRAS DE ALERTA ATIVAS: RA-01 somaEsas > 50 → ESAS_ALTO; RA-02 zarit >= 41 → ZARIT_SEVERA;
   RA-03 dias_sem_registro > janela_esperada → ADESAO_BAIXA (painel Gestor); RA-04 alerta aberto →
   'requer atenção' no painel; RA-05 nível de risco alto → mensagem bidirecional cuidador+profissional.

5) AGENDAMENTO (ServiceRequest.occurrence[x]): ESAS diário (2×/dia se risco alto recente); Zarit
   mensal (semanal se severa); notificação de adesão semanal (imediata se taxa < 80% em 7 dias);
   dashboard do Gestor a cada hora (tempo real para alertas abertos).
"""
