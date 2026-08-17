# mareIA — CardioRemoto

**Implementation Guide FHIR R4 (WHO SMART Guidelines L3)** para o telemonitoramento ativo de pacientes com **Diabetes Mellitus (DM)** e **Hipertensão Arterial Sistêmica (HAS)** com fatores de risco cardiovascular aterosclerótico, no âmbito do **Ambulatório de Telessaúde do Hospital Universitário Lauro Wanderley (HULW / UFPB)**, João Pessoa/PB.

---

### Contexto e Justificativa Clínica

O Diabetes Mellitus e a Hipertensão Arterial Sistêmica são as principais doenças crônicas não transmissíveis (DCNT) no Brasil, com elevado impacto na morbimortalidade cardiovascular. O acompanhamento convencional na atenção ambulatorial especializada frequentemente sofre com longos intervalos entre consultas e ausência de dados longitudinais.

O **CardioRemoto** estrutura o telemonitoramento contínuo por meio da plataforma mareIA, integrando:
1. **Dispositivos IoT:** Aferição de Pressão Arterial (sistólica/diastólica), Frequência Cardíaca e Glicemia Capilar com equipamentos certificados ANVISA e transmissão via Bluetooth.
2. **Dados Antropométricos:** Peso, Altura, IMC e Circunferência Abdominal.
3. **Exames Laboratoriais Especializados:** Hemoglobina Glicada (HbA1c), Perfil Lipídico (Colesterol Total, HDL, LDL, Triglicerídeos), Creatinina e Taxa de Filtração Glomerular (CKD-EPI).
4. **Lógica de Suporte à Decisão:** Estratificação em 3 níveis de controle de risco (Verde, Amarelo, Vermelho) e sistema de alertas em 4 níveis (Vermelho, Laranja, Amarelo e Sem disparo).
5. **Integração Hospitalar:** Interoperabilidade FHIR com o sistema AGHUX (EBSERH/SUS).

---

### Camadas SMART Guidelines

| Camada | Descrição | Onde encontrar neste IG |
|---|---|---|
| **L1** | Protocolo Clínico Geral e Metodologia HULW/UFPB | `sources/CardioRemoto/` |
| **L2** | DAK (Digital Adaptation Kit) — 9 componentes estruturados | Menu **Componentes DAK (L2)** acima |
| **L3** | Artefatos FHIR R4 (Perfis, Questionários, PlanDefinition, Measures) | Menu **Artefatos (L3)** acima |

---

### Navegação Rápida

* [1. Intervenções e Recomendações](l2-interventions.html)
* [2. Personas Genéricas](l2-personas.html)
* [3. Cenários de Uso](l2-user-scenarios.html)
* [4. Processos de Negócio e Workflows](l2-business-process.html)
* [5. Elementos de Dados (Dicionário)](l2-data-dictionary.html)
* [6. Lógica de Suporte à Decisão](l2-decision-logic.html)
* [7. Indicadores de Programa](l2-indicators.html)
* [8. Requisitos Funcionais e Não-Funcionais](l2-requirements.html)
* [9. Cenários de Teste](l2-test-scenarios.html)
