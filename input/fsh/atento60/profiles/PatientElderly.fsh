// Fonte L1: §4 (elegibilidade). L2: 2-personas, 5-data-dictionary.
Profile: Atento60PatientElderly
Parent: PatientMareIABase
Id: atento60-patient-elderly
Title: "Paciente — Pessoa Idosa (ATENTO 60+)"
Description: "Perfil da pessoa idosa (>= 60 anos) acompanhada no telemonitoramento ATENTO 60+. A elegibilidade de idade é verificada no fluxo de cadastro."
* ^status = #active
* identifier MS
* name MS
* birthDate MS
* birthDate ^short = "Data de nascimento (usada para verificar idade >= 60 anos)"
* gender MS
* address MS
* address ^short = "Endereço — usado para georreferenciamento de risco e área de abrangência da ESF"
