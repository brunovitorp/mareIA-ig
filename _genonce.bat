@ECHO OFF
REM Gera o IG uma vez: compila FSH (SUSHI) e executa o IG Publisher.
IF NOT EXIST input-cache\publisher.jar (
  ECHO publisher.jar nao encontrado — execute _updatePublisher.bat primeiro.
  EXIT /B 1
)
ECHO == SUSHI ==
CALL sushi .
ECHO == IG Publisher ==
java -jar input-cache\publisher.jar publisher -ig . %*
ECHO Saida em output\index.html
