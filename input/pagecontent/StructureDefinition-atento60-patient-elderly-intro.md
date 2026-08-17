**Uso.** Representa a **pessoa idosa** (pessoa cuidada) acompanhada no telemonitoramento ATENTO 60+.
É o `subject` das observações de escore IVCF-20 e dos sinais vitais coletados por IoT.

**Escopo.** Pessoa com **≥ 60 anos**, cadastrada na USF e residente na área de abrangência da equipe
ESF (critérios de inclusão do protocolo, §4). A verificação de idade ocorre no fluxo de cadastro
(`birthDate`). Fora de escopo: demais públicos dos outros pathways da mareIA.

**Identificadores.** `identifier` (*must-support*) — identificadores do SUS (ex.: CNS/CPF, conforme
política da unidade); `name` e `birthDate` *must-support*. `gender` e `address` *must-support*
(`address` apoia o georreferenciamento de risco e a área de abrangência).

**Extensões.** Este perfil **não define extensões próprias**; restringe e marca como *must-support*
elementos do recurso base `Patient`. Extensões nacionais (ex.: raça/cor, município IBGE) poderão ser
adotadas em iteração futura, alinhadas à RNDS.

*Fonte L1: Protocolo mareIA WP1, §4 (elegibilidade), §5 (perfis).*
