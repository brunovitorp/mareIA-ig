#!/usr/bin/env bash
# Gera o IG uma vez: compila FSH (SUSHI) e executa o IG Publisher.
set -e
if [ ! -f input-cache/publisher.jar ]; then
  echo "publisher.jar não encontrado — execute ./_updatePublisher.sh primeiro."
  exit 1
fi
echo "== SUSHI =="
sushi .
echo "== IG Publisher =="
java -jar input-cache/publisher.jar publisher -ig . "$@"
echo "Saída em output/index.html"
