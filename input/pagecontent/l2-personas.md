# 2. Personas Genéricas

O ecossistema **mareIA** mapeia atores e papéis clínicos transversais e específicos para cada linha de cuidado no SUS.

---

## 2.1 Matriz de Personas da Plataforma

```
                                  ┌────────────────────────────────┐
                                  │      Personas no SUS           │
                                  └───────────────┬────────────────┘
                  ┌───────────────────────────────┼───────────────────────────────┐
                  ▼                               ▼                               ▼
       ┌──────────────────────┐        ┌──────────────────────┐        ┌──────────────────────┐
       │   Usuários / Cuidado │        │  Profissionais APS   │        │ Especialistas/Gestão │
       ├──────────────────────┤        ├──────────────────────┤        ├──────────────────────┤
       │ • Paciente Crônico   │        │ • Agente de Saúde/ACS│        │ • Médico Especialista│
       │ • Pessoa Idosa (60+) │        │ • Técnico de Coleta  │        │ • Equipe Telessaúde  │
       │ • Paciente Paliativo │        │ • Enfermeiro(a) UBS  │        │ • Nutricionista      │
       │ • Cuidador Familiar  │        │ • Médico da Família  │        │ • Gestor Municipal   │
       │ • Trabalhador Rural  │        │ • Técnico Enfermagem │        │ • Pesquisador RNP    │
       └──────────────────────┘        └──────────────────────┘        └──────────────────────┘
```

---

## 2.2 Detalhamento por Pathway

### 🫀 CardioRemoto (UFPB / HULW)
1. **Paciente Cardiopata / Diabético (Adulto ou Idoso):** Usuário do SUS com DM2 e/ou HAS acompanhado no ambulatório do HULW. Realiza automonitoramento com IoT ou comparece às visitas periódicas.
2. **Técnico de Coleta / Agente de Telessaúde:** Profissional que executa a triagem com esfigmomanômetro Bluetooth, glicosímetro e balança digital, registrando no aplicativo móvel.
3. **Médica Endocrinologista / Cardiologista do HULW:** Responsável pela análise dos alertas, teleconsultorias, ajuste de posologia medicamentosa e emissão de laudos integrados ao AGHUX.
4. **Nutricionista da Equipe Multiprofissional:** Conduz orientações alimentares para controle glicêmico e lipídico com base na evolução longitudinal.

<div style="text-align: center; margin: 20px 0;">
  <img src="actors-cardio.svg" alt="Atores CardioRemoto" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 🧓 ATENTO 60+ (UFPE / UFPB)
1. **Pessoa Idosa na Comunidade:** Cidadão com 60 anos ou mais acompanhado pela ESF, respondente do IVCF-20.
2. **Agente Comunitário de Saúde (ACS):** Aplica o questionário IVCF-20 em visita domiciliar via tablet/celular com funcionamento offline.
3. **Enfermeira da ESF / Médico de Família:** Analisa o escore de fragilidade (Robusto / Risco / Frágil) e elabora o Projeto Terapêutico Singular (PTS).

<div style="text-align: center; margin: 20px 0;">
  <img src="actors-atento60.svg" alt="Atores ATENTO 60+" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 🏡 FamilIAr_Ativa (UFPel / CUIDATIVA)
1. **Paciente em Cuidados Paliativos Domiciliares:** Pessoa portadora de doença crônica ameaçadora da vida, focada no alívio de sintomas e qualidade de vida.
2. **Cuidador(a) Familiar Principal:** Parente ou responsável pelo suporte diário, que responde a escala de sobrecarga de Zarit e registra a escala ESAS quando o paciente não puder fazê-lo.
3. **Equipe Interdisciplinar de Cuidados Paliativos:** Médicos, enfermeiros e psicólogos que recebem notificações de piora de sintomas ou sobrecarga do cuidador.

<div style="text-align: center; margin: 20px 0;">
  <img src="actors-familiarativa.svg" alt="Atores FamilIAr_Ativa" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>

### 🌾 AgroSUS (FATEC Ferraz)
1. **Trabalhador Rural / Agricultor Familiar:** Produtor rural exposto a defensivos agrícolas em pequenas e médias propriedades rurais.
2. **Agente Comunitário de Saúde Rural (ACS Rural):** Realiza a anamnese ocupacional e orienta sobre agendamento de exames periódicos de colinesterase.
3. **Profissional da UBS / Vigilância em Saúde do Trabalhador:** Avalia laudos laboratoriais, investiga casos suspeitos de intoxicação e notifica agravos no SINAN.

<div style="text-align: center; margin: 20px 0;">
  <img src="actors-agrosus.svg" alt="Atores AgroSUS" style="max-width: 100%; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; background: #fff;" />
</div>
