@ECHO OFF
REM Baixa/atualiza o HL7 FHIR IG Publisher para input-cache\publisher.jar
IF NOT EXIST input-cache MKDIR input-cache
SET URL=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
ECHO Baixando IG Publisher de %URL% ...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile 'input-cache\publisher.jar'"
ECHO OK: input-cache\publisher.jar
