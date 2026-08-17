# 8. Requisitos Funcionais e Não-Funcionais

Especificação de requisitos do **CardioRemoto** baseada no Documento de Requisitos V2 (UFPB / HULW):

---

### Requisitos Funcionais (RF)

| ID | Nome | Descrição | Prioridade |
|---|---|---|---|
| `RF001` | Logar no sistema | Autenticação segura do usuário com bloqueio temporário após 5 tentativas inválidas. | Essencial |
| `RF002` | Cadastrar paciente | Registro de dados cadastrais, fatores de risco cardiovascular, tabagismo e atividade física. | Essencial |
| `RF003` | Filtrar pacientes por risco | Exibição de listas filtradas por estrato de risco (Todos, Verde, Amarelo, Vermelho). | Importante |
| `RF004` | Ordenar por prioridade de visita | Ordenação inteligente da fila de pacientes por dias de atraso e proximidade de visita. | Essencial |
| `RF005` | Inserir nova visita | Registro de dados antropométricos, vitais IoT e laboratoriais com cálculo automático de IMC. | Essencial |
| `RF006` | Visualizar evolução temporal | Apresentação em formato de tabela e gráficos de tendência dos parâmetros coletados. | Essencial |
| `RF007` | Sincronizar dados manualmente | Disparo manual da sincronização de registros locais offline com o servidor central. | Importante |
| `RF008` | Encerrar sessão | Finalização segura da sessão de trabalho do usuário. | Importante |

---

### Requisitos Não-Funcionais (RNF)

| ID | Nome | Descrição | Prioridade |
|---|---|---|---|
| `RNF001` | Funcionamento Offline-First | Armazenamento local seguro e sincronização passiva/ativa com o banco central. | Importante |
| `RNF002` | Interface Responsiva | Adaptação para telas mobile (320–767px) e tablets (768–1024px) sem rolagem horizontal. | Desejável |
| `RNF003` | Proteção de Dados Sensíveis (LGPD) | Criptografia em repouso e em trânsito (HTTPS/TLS) e minimização de dados sensíveis. | Essencial |
| `RNF004` | Controle de Acesso Baseado em Papéis | Restrição de visualização de dados clínicos apenas a perfis autorizados. | Essencial |
| `RNF005` | Trilha de Auditoria | Registro imutável de data, hora e usuário responsável por qualquer inclusão ou alteração. | Essencial |
