// Fonte L1: Metodologia §7.4 e §7.6.3.1. Requisitos RF002.
Profile: PatientCardio
Parent: Patient
Id: atento-cardio-patient
Title: "CardioRemoto — Perfil de Paciente Cardiopata / Diabético"
Description: "Perfil do paciente com Diabetes Mellitus e/ou Hipertensão Arterial acompanhado no Ambulatório de Telessaúde do HULW."
* identifier 1..* MS
* name 1..* MS
* gender 1..1 MS
* birthDate 1..1 MS
