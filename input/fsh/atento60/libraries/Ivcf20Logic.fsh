// Fonte L1: Anexo 15.6.3, §8, §10. L2: 6-decision-logic. REVISAR ADR-0004/0005.
Instance: Atento60Ivcf20Logic
InstanceOf: Library
Usage: #definition
* status = #active
* experimental = false
* type = http://terminology.hl7.org/CodeSystem/library-type#logic-library
* name = "Atento60Ivcf20Logic"
* title = "Lógica de decisão do IVCF-20 (ATENTO 60+)"
* description = """
Regras de decisão do pathway ATENTO 60+ (humano-legíveis; implementação em CQL prevista para fase L4):

1) ESCORE: soma das pontuações (ordinalValue) das respostas dos 20 itens do IVCF-20, respeitando os
   tetos de grupo — AVD Instrumental (q03–q05) máx 4 pts; item q14 máx 2 pts; item q20 máx 4 pts.
   Resultado: ivcfScore (0–40). REVISAR ADR-0004.

2) FAIXA DE RISCO: ivcfScore 0–6 = robusto; 7–14 = risco-fragilizacao; >=15 = fragil. REVISAR ADR-0004.

3) PERIODICIDADE (REVISAR ADR-0005): fragil -> 3 meses; risco-fragilizacao -> 2 meses; robusto -> 1 mês.

4) GATILHOS DE ALERTA (independem da faixa): queda (qualquer); internação <6 meses; sinal vital IoT
   fora de referência crítica (PA, FC, oximetria); perda de peso não intencional; IMC < 22; humor
   alterado; autopercepção piorando em visitas consecutivas.
"""
