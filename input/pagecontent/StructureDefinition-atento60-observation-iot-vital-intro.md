**Uso.** Registra um **sinal vital coletado por dispositivo IoT** (esfigmomanômetro, glicosímetro,
oxímetro, balança, estadiômetro, termômetro), integrado ao app de coleta.

**Escopo.** PA sistólica/diastólica, glicemia capilar, SpO₂, frequência cardíaca, peso, estatura→IMC e
temperatura (§7.3). Aplicável à triagem inicial e ao monitoramento contínuo. Fora de escopo: sinais
sem origem em dispositivo (entrada manual de exames laboratoriais segue outros recursos/perfis).

**Identificadores.** `category` = `vital-signs`; `code` ligado (*extensible*) ao ValueSet
`atento60-vital-loinc-vs` (**LOINC**); `subject` (1..1) → `Atento60PatientElderly`;
`effective[x]` e `valueQuantity` (UCUM) *must-support*. O campo `device` aponta o dispositivo de
origem (preferencialmente certificado ANVISA, via BLE).

**Extensões.** **Sem extensões próprias.** Sinais que exigem estrutura de painel (ex.: pressão
arterial sistólica + diastólica como componentes) devem usar os perfis padrão de *vital signs* do
FHIR; este perfil cobre medições de valor único por dispositivo.

*Fonte L1: Protocolo mareIA WP1, §7.3 (p.12), §12 (interoperabilidade).*
