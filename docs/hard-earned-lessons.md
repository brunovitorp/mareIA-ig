# Hard-Earned Lessons

Registro vivo de armadilhas e como evitá-las. **Atualize a cada problema não-óbvio resolvido.**

---

## HEL-001 — Extração do PDF: encoding e acentuação
- **Sintoma:** `Read` do PDF falhou (`pdftoppm not found`); extração via Python saía com acentos
  quebrados quando impressa direto no terminal Windows.
- **Causa:** terminal em code page legada; faltava forçar UTF-8 na escrita do arquivo.
- **Solução:** extrair com PyMuPDF (`fitz`) e gravar com `open(dst,'w',encoding='utf-8')`; ler o
  `.txt` resultante com a ferramenta Read. Texto-fonte fica em `sources/_protocolo_extract.txt`.

## HEL-002 — `sushi init` é interativo
- **Sintoma:** trava em ambiente não-interativo.
- **Solução:** recriar `sushi-config.yaml` e `ig.ini` manualmente (equivalente ao que o init gera).
  Validar cedo com `sushi .` mesmo sem FSH (config-only) — deve dar 0 erros.

## HEL-003 — Páginas declaradas x arquivos existentes
- **Sintoma:** IG Publisher reclama de páginas do menu sem arquivo correspondente.
- **Solução:** toda página listada em `sushi-config.yaml > pages/menu` precisa existir em
  `input/pagecontent/`. Crie stubs antes do primeiro build completo.

## HEL-004 — IG Publisher exige Java; cuidado com a checagem de versão
- **Observação:** `java -version` escreve na **stderr**; um teste ingênuo pode parecer "vazio" e
  sugerir falsamente que o Java não existe. Use `Get-Command java` para detectar de forma confiável.
- **Ambiente atual:** Temurin/OpenJDK **25** presente em `C:\Program Files\Eclipse Adoptium\`.
  SUSHI (gate de FSH) roda sem Java; o site/QA do IG Publisher precisa de Java 11+ (ok aqui).

## HEL-005 — Suppressed messages file e obs-7
- **Sintoma:** IG Publisher acusou 2 erros: (1) "Suppressed messages file not found"; (2) `obs-7`
  na Observation de escore IVCF-20.
- **Causa:** (1) faltava `input/ignoreWarnings.txt` (esperado por padrão); (2) o componente "faixa"
  usava o **mesmo código** da Observation principal — a invariante `obs-7` proíbe valor de nível
  superior quando há componente de código idêntico.
- **Solução:** criar `input/ignoreWarnings.txt` (com cabeçalho `== Suppressed Messages ==`); dar um
  código distinto ao componente faixa (`atento60-obs-code#ivcf-20-faixa`, separado de `#ivcf-20-score`).

## HEL-006 — `category = vital-signs` dispara o profile padrão automaticamente
- **Sintoma:** ao criar exemplo de PA sistólica (LOINC 8480-6) com `category = vital-signs`, o
  validador aplicou o profile **bp** (pressão arterial) e exigiu painel 85354-9 + componentes
  sistólica/diastólica → 6 erros. Trocando para **peso** (29463-7), restou erro pedindo
  `valueQuantity.unit`.
- **Causa:** o validador FHIR detecta o profile de vital sign pelo código+categoria e impõe suas
  regras (bp exige painel; bodyweight exige `unit` textual além do código UCUM).
- **Solução:** para exemplos de sinal vital simples, usar códigos sem painel (peso/temperatura) e
  **sempre** preencher `valueQuantity.unit` (string) além de `value`/`code`/`system`. Para PA, modelar
  o painel completo (85354-9 + componentes) em iteração futura.

## HEL-007 — `hl7fhir/ig-publisher-base` não põe os scripts no PATH
- **Sintoma:** no GitHub Actions, `run: _updatePublisher.sh -y` falhou com
  `_updatePublisher.sh: not found` (exit 127).
- **Causa:** na imagem, os helpers `_updatePublisher.sh`/`_genonce.sh` não estão no `PATH`, e o
  diretório de trabalho não está no `PATH`. Os scripts do próprio repo também chegam sem bit de
  execução após checkout em Linux (foram criados no Windows).
- **Solução (1ª tentativa, insuficiente):** chamar comandos explícitos — mas `sushi`/`java` também
  não estão no PATH do shell não-login do Actions (rodando como root): a imagem instala o tooling no
  perfil do usuário `publisher`, então `sushi: command not found` (exit 127) persistia.
- **Diagnóstico (DIAG no CI):** a imagem roda como `root`; `node`/`npm`/`npx`/`jekyll` estão em
  `/usr/local/bin` (no PATH padrão) e `java` em `/opt/java/openjdk/bin` (só no PATH de login). E,
  crucialmente, **o SUSHI NÃO está instalado na imagem** (`find / -name sushi` não retorna nada) —
  os scripts da imagem ficam em `/home/publisher/bin/ig-publisher-scripts`.
- **Solução final:** no CI, **instalar o SUSHI** (`npm install -g fsh-sushi`) e adicionar
  `$(npm prefix -g)/bin` e `/opt/java/openjdk/bin` ao `$GITHUB_PATH`; depois rodar
  `java -jar publisher.jar publisher -ig .` (o IG Publisher chama o `sushi`, agora no PATH).

## HEL-008 — Kramdown exige linha em branco antes de tabelas; PlantUML via images-source; páginas em /en/
- **Sintoma:** tabelas em `l2-decision-logic` e `l2-indicators` renderizavam como texto cru
  (`<p>| Escore | Faixa |`), e o `---` virava travessão (`—`).
- **Causa:** no Kramdown (engine do Jekyll), uma tabela **logo após um heading/parágrafo sem linha
  em branco** não é reconhecida como tabela. Necessário **uma linha em branco antes** da 1ª linha.
- **Solução:** inserir linha em branco antes de toda tabela (script em `input/pagecontent/*.md`).
- **PlantUML:** fontes `.plantuml` em `input/images-source/`; o IG Publisher gera SVG e a página inclui
  com `{% include nome.svg %}` (SVG é embutido inline). NÃO usar fenced code ```plantuml.
  Ref.: https://build.fhir.org/ig/FHIR/ig-guidance/diagrams-plantuml.html
- **Multilíngue:** com `fhir2.base.template`, as páginas finais ficam em `output/en/...`
  (e o site publicado em `.../en/l2-*.html`), não na raiz.

<!-- Próximas lições: adicionar abaixo com id incremental. -->
