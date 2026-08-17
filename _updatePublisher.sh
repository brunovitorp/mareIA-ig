#!/usr/bin/env bash
# Baixa/atualiza o HL7 FHIR IG Publisher para input-cache/publisher.jar
set -e
mkdir -p input-cache
URL="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
echo "Baixando IG Publisher de $URL ..."
curl -L "$URL" -o input-cache/publisher.jar
echo "OK: input-cache/publisher.jar"
