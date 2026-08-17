# 8. Requisitos Funcionais e Não-Funcionais

O ecossistema **mareIA** estabelece requisitos de software transversais e específicos para garantir conformidade técnica, segurança e usabilidade no SUS.

---

## 8.1 Requisitos Funcionais (RF)

| ID | Requisito Funcional | Descrição | Aplicabilidade |
|---|---|---|---|
| **RF001** | Autenticação Segura | Login com controle de acesso baseado em papéis (RBAC). | Transversal |
| **RF002** | Cadastro com TCLE e CNS | Cadastro de cidadão com validação de CNS, CPF e aceite de TCLE. | Transversal |
| **RF003** | Coleta com IoT Homologado | Conexão Bluetooth com esfigmomanômetros e glicosímetros ANVISA. | CardioRemoto / ATENTO |
| **RF004** | Aplicação de Questionários | Renderização de questionários dinâmicos com scoring automatizado (SDC).| Todos os Pathways |
| **RF005** | Estratificação e Alertas | Motor de regras computável que gera alertas em tempo real. | Todos os Pathways |
| **RF006** | Sincronização Offline-First | Armazenamento local de coletas e reconciliação automática na rede. | Transversal (ACS) |
| **RF007** | Linha do Tempo Longitudinal | Gráficos de evolução temporal de parâmetros vitais, scores e labs. | Todos os Pathways |
| **RF008** | Interoperabilidade Hospitalar | Exportação e consumo de dados via FHIR REST API com AGHUX/EBSERH. | Transversal |

---

## 8.2 Requisitos Não-Funcionais (RNF)

| ID | Requisito Não-Funcional | Descrição e Métrica |
|---|---|---|
| **RNF001**| Conformidade com LGPD | Criptografia em trânsito (TLS 1.3) e em repouso (AES-256) para dados sensíveis. |
| **RNF002**| Padrão FHIR R4 e SMART Guidelines | 100% dos recursos semânticos compatíveis com FHIR R4 e guias da OMS. |
| **RNF003**| Desempenho e Tempo de Resposta | Tempo de processamento da inferência de regras clínicas < 500 ms. |
| **RNF004**| Responsividade e Acessibilidade | Interface adaptável para celulares, tablets e desktops (WCAG 2.1 AA). |
| **RNF005**| Rastreabilidade e Auditoria | Registro imutável de logs de acesso e alterações via recurso `AuditEvent`. |
