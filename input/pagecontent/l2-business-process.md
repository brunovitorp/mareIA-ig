# 4. Processos de Negócio e Workflows

O fluxo de atendimento do **CardioRemoto** é estruturado em 7 macrofases contínuas:

---

### Macrofases do Processo Clínico

```
[M1: Entrada / TCLE] ──> [M2: Coleta / IoT / Labs] ──> [M3: Estratificação de Risco]
                                                                  │
                                                                  ▼
[M7: Integração AGHUX] <── [M6: Ação da Equipe] <── [M5: Alertas] <── [M4: Ciclo / Visitas]
```

1. **Macrofase 1 — Elegibilidade e Entrada do Paciente:**
   * Verificação de critérios de inclusão (DM e/ou HAS, idade ≥ 18 anos, risco aterosclerótico).
   * Coleta do Termo de Consentimento Livre e Esclarecido (TCLE digital ou impresso).
   * Registro cadastral e histórico cardiovascular prévio.

2. **Macrofase 2 — Triagem Inicial e Coleta:**
   * Aferição de peso, altura, cálculo automático de IMC e circunferência da cintura.
   * Aferição de sinais vitais IoT (Pressão Arterial em duplicata com repouso de 5 min, FC e Glicemia Capilar).
   * Encaminhamento para coleta laboratorial no HULW (HbA1c, Perfil Lipídico, Creatinina, TFG, EAS, Microalbuminúria).

3. **Macrofase 3 — Análise de Risco e Classificação:**
   * Classificação automatizada do controle clínico em:
     * **Verde (Controlado):** PA < 140/90, HbA1c < 7%, LDL < 130 mg/dL, sem evento CV nos últimos 12 meses.
     * **Amarelo (Moderado):** 1 a 2 parâmetros fora da meta e sem evento recente.
     * **Vermelho (Grave):** ≥ 3 parâmetros fora da meta OU evento cardiovascular nos últimos 12 meses.

4. **Macrofase 4 — Ciclo de Monitoramento Estratificado:**
   * Cálculo da periodicidade da próxima visita:
     * Pacientes Verdes: a cada **90 dias** (3 meses).
     * Pacientes Amarelos / Vermelhos: a cada **30 dias** (1 mês).
   * Ordenação automática da lista de pacientes por dias de atraso na visita.

5. **Macrofase 5 — Sistema de Alertas em 4 Níveis:**
   * **Vermelho (Imediato):** PA ≥ 180/120 ou < 90/60 mmHg; Glicemia ≥ 250 mg/dL c/ sintomas ou < 70 mg/dL; Sinais de SCA/AVC; FC > 100 ou < 50 bpm.
   * **Laranja (Semanal/Quinzenal):** Triglicerídeos > 1000 mg/dL; Perda de peso não intencional ≥ 5%.
   * **Amarelo (Quinzenal/Trimestral):** PA fora da meta não crítica; LDL ≥ 190 mg/dL; HbA1c ≥ 7%; Glicemia > 300 mg/dL.
   * **Sem disparo (Verde):** Parâmetros na meta.

6. **Macrofase 6 — Ações da Equipe Multiprofissional:**
   * Teleconsulta médica, prescrição e ajuste farmacológico.
   * Atendimento com nutricionista para controle metabólico/lipídico.
   * Envio de orientações de autocuidado e educação em saúde para DCNT.

7. **Macrofase 7 — Integração Hospitalar (AGHUX) e Ciclo Contínuo:**
   * Sincronização FHIR de observações e relatórios de consulta com o prontuário AGHUX do HULW.
