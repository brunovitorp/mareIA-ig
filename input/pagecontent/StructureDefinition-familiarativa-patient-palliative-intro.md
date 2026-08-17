**Uso.** Representa o **paciente em cuidados paliativos domiciliares** acompanhado no
FamilIAr_Ativa. É o `subject` das observações de sintomas ESAS, da soma/risco e dos alertas
clínicos (`Flag`).

**Escopo.** Paciente com condição paliativa acompanhado em domicílio, nos dois cenários do DAK:
**A** — autocuidado (opera o sistema) e **B** — com cuidador (é a fonte de dados clínicos,
registrados pelo cuidador). Fora de escopo: demais públicos dos outros pathways da mareIA.

**Identificadores.** `identifier` (*must-support*) — identificadores do SUS (ex.: CNS/CPF,
conforme política da unidade); `name`, `birthDate`, `gender` e `address` *must-support*
(`address` reflete o contexto domiciliar do cuidado). `contact` *must-support* aponta o cuidador
familiar; o vínculo formal usa o perfil `RelatedPerson` (cuidador).

**Extensões.** Este perfil **não define extensões próprias**; restringe e marca como
*must-support* elementos do recurso base `Patient`. Extensões nacionais (ex.: raça/cor, município
IBGE) poderão ser adotadas em iteração futura, alinhadas à RNDS.

*Fonte L1: DAK FamilIAr_Ativa, Componente 2 (Personas 1–2) e §5.3.*
