# 8. Requisitos de Sistema e Arquitetura (DAK L2 — Requisitos)

A especificação de requisitos da **Plataforma mareIA** define as capacidades funcionais, regulatórias, de interoperabilidade e segurança necessárias para a implementação de sistemas de telecuidado no SUS.

---

## 8.1 Requisitos Funcionais Transversais e por Pathway

| ID | Requisito Funcional | Descrição Detalhada da Implementação | Critério de Aceite / Padrão | Módulos Aplicáveis |
|---|---|---|---|---|
| **RF-001** | **Gestão de Identidade SUS** | Validação sintática e semântica de CNS (15 dígitos) e CPF (11 dígitos com dígito verificador), além de vínculo com CNES e CBO dos profissionais. | Conformidade com Portaria GM/MS n.º 2.073 e RFC do CPF. | Todos os Pathways |
| **RF-002** | **Consentimento Digital (LGPD)** | Registro imutável do aceite do Termo de Consentimento Livre e Esclarecido (TCLE) com carimbo de data/hora e versão do termo. | Mapeamento no recurso FHIR `Consent`. | Todos os Pathways |
| **RF-003** | **Coleta Offline-First com UUID** | O aplicativo móvel deve permitir coleta completa em áreas sem internet, gerando identificador UUID v4 e garantindo sincronização transacional idempotente. | Sem duplicação de registros após restabelecimento de sinal. | ATENTO 60+, AgroSUS |
| **RF-004** | **Pareamento e Coleta IoT Bluetooth** | Conectividade direta via Bluetooth Low Energy (BLE) com esfigmomanômetros, glicosímetros e oxímetros certificados pela ANVISA. | Captura direta sem digitação manual de valores vitais. | CardioRemoto, ATENTO 60+ |
| **RF-005** | **Formulários Estruturados (HL7 SDC)** | Renderização dinâmica de formulários (`Questionnaire`) com suporte a cálculo automático de escores via extensão `ordinalValue` e `calculatedExpression`. | Conformidade com HL7 Structured Data Capture (SDC) 3.0. | Todos os Pathways |
| **RF-006** | **Estratificação Computável de Risco** | Execução de regras de inferência clínica e tabelas de decisão DMN via motores CQL (`Library`) com emissão de estrato de risco. | Resposta de estratificação em tempo $< 200\text{ ms}$. | Todos os Pathways |
| **RF-007** | **Triagem e Disparo de Alertas** | Geração automática de `FlagClinicalAlert` e `CommunicationRequest` categorizados em 4 níveis de severidade (Informativo a Emergência). | Notificação em tempo real (Push/WebSocket/SMS). | Todos os Pathways |
| **RF-008** | **Interoperabilidade com AGHUX (EBSERH)** | Exportação e sincronização bidirecional de laudos de teleconsultoria e dados de acompanhamento com o prontuário hospitalar AGHUX. | Protocolo FHIR REST API / HL7 v2 / JSON. | CardioRemoto |
| **RF-009** | **IA com Explicabilidade Clínica (XAI)** | Modelos preditivos de descompensação devem retornar obrigatoriamente os atributos determinantes (valores SHAP) para inspeção do médico. | Bloqueio de decisões automatizadas de "caixa preta". | FamilIAr_Ativa |
| **RF-010** | **Exportação para SINAN / Notificação** | Geração automática da ficha estruturada de notificação de intoxicação exógena por agrotóxicos para o SINAN da Vigilância em Saúde. | Conformidade com campos da ficha SINAN (Portaria GM/MS 204). | AgroSUS |

---

## 8.2 Requisitos Não-Funcionais (RNF)

| ID | Categoria | Descrição Técnica | Métrica de Verificação |
|---|---|---|---|
| **RNF-001** | **Segurança & Privacidade** | Criptografia em trânsito com TLS 1.3 obrigatório e em repouso com algoritmo AES-256 para dados clínicos e identificadores. | Auditoria de segurança e testes de intrusão (Pentest). |
| **RNF-002** | **Conformidade FHIR R4** | 100% dos dados clínicos transitados e persistidos devem aderir aos perfis FHIR R4 definidos no Master IG. | Validação sem erros pelo HL7 FHIR Core Validator. |
| **RNF-003** | **Disponibilidade e Resiliência** | Arquitetura de microsserviços tolerante a falhas com alta disponibilidade. | SLA de disponibilidade $\ge 99.5\%$ em produção. |
| **RNF-004** | **Usabilidade e Acessibilidade** | Interfaces projetadas para facilidade de uso por agentes comunitários de saúde e cuidadores idosos (tamanho de fonte adaptável, alto contraste). | Conformidade com diretrizes WCAG 2.1 nível AA. |
| **RNF-005** | **Rastreabilidade e Auditoria** | Registro imutável de todas as operações de leitura, criação e atualização de registros sensíveis através do recurso `AuditEvent`. | Retenção mínima de logs por 5 anos (LGPD / CFM). |
