// Fonte L1: DAK §5.3 (campo tipo) e §6.3 (regras RA). L2: 5-data-dictionary, 6-decision-logic.
CodeSystem: FamiliarAtivaAlertTypeCS
Id: familiarativa-alert-type
Title: "Tipos de alerta clínico (FamilIAr_Ativa)"
Description: "Tipos de alerta gerados pelo sistema, mapeados para Flag.code."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #esas-alto "ESAS_ALTO" "Soma ESAS > 50 (RA-01): alerta + notificação ao profissional + mensagem ao cuidador."
* #zarit-severa "ZARIT_SEVERA" "Pontuação Zarit >= 41 (RA-02): alerta + notificação ao profissional."
* #adesao-baixa "ADESAO_BAIXA" "Dias sem registro acima da janela esperada (RA-03): sinalização no painel do Gestor."
