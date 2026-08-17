# Pathway 2: ATENTO 60+ (Telemonitoramento da Pessoa Idosa)

- **População-Alvo:** Pessoas idosas (>= 60 anos) cadastradas e acompanhadas na Atenção Primária à Saúde (APS / Estratégia Saúde da Família).
- **Instituições Líderes:** UFPE (Universidade Federal de Pernambuco) e UFPB.
- **ID Canônico FHIR:** `br.gov.mareia.atento60`
- **Fonte L1:** *Protocolo Clínico Geral mareIA / Linha de Cuidado do Idoso (UFPE/UFPB)*.

---

## 1. Justificativa Clínica e Escopo

O envelhecimento populacional exige ferramentas ágeis de identificação precoce da fragilidade clínico-funcional para prevenção de quedas, perda de autonomia e hospitalizações evitáveis. O ATENTO 60+ fundamenta-se em:
1. **Instrumento IVCF-20 (Índice de Vulnerabilidade Clínico-Funcional):** 20 questões multidimensionais cobrindo idade, autopercepção de saúde, atividades da vida diária (AVDs), cognição, humor, mobilidade, comunicação e comorbidades múltiplas.
2. **Estratificação em 3 Níveis:**
   - **Robusto (0 a 6 pontos):** Acompanhamento anual ou semestral de rotina na APS.
   - **Em Risco de Fragilização (7 a 14 pontos):** Intervenção preventiva com plano de cuidado compartilhado e telemonitoramento trimestral.
   - **Frágil (>= 15 pontos):** Avaliação Geriátrica Ampla (AGA), visita domiciliar prioritária e teleintervenção mensal.
3. **Detecção de Quedas e Sarcopenia:** Monitoramento ativo de eventos sentinela e força de preensão/velocidade de marcha.
4. **Resiliência Offline-First:** Coleta em tablets por Agentes Comunitários de Saúde (ACS) em domicílio sem necessidade de sinal de celular constante.

---

## 2. Artefatos FHIR R4 Principais

- **Perfis:** `Atento60PatientElderly`, `ObservationIvcfScore`, `ObservationIotVital`.
- **Formulários:** `QuestionnaireIvcf20` (com scoring automatizado HL7 SDC).
- **Lógica e Suporte:** `PlanDefinitionAtento60`, `Library/Ivcf20Logic`.
- **Indicadores (Measures):** `MeasureAtento60CoberturaIVCF`, `MeasureAtento60PlanoCuidadoFragil`.
