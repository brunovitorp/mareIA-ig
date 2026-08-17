const fs = require('fs');
const path = require('path');
const https = require('https');

const srcDir = path.join(__dirname, 'input', 'images-source');
const outDir = path.join(__dirname, 'input', 'images');
const incDir = path.join(__dirname, 'input', 'includes');

if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });
if (!fs.existsSync(incDir)) fs.mkdirSync(incDir, { recursive: true });

async function renderPlantUml(inputFile, outputFile) {
  const content = fs.readFileSync(inputFile, 'utf8');
  return new Promise((resolve, reject) => {
    const req = https.request('https://kroki.io/plantuml/svg', {
      method: 'POST',
      headers: {
        'Content-Type': 'text/plain; charset=utf-8',
        'Content-Length': Buffer.byteLength(content)
      }
    }, (res) => {
      if (res.statusCode !== 200) {
        return reject(new Error(`Failed with HTTP ${res.statusCode} for ${inputFile}`));
      }
      const fileStream = fs.createWriteStream(outputFile);
      res.pipe(fileStream);
      fileStream.on('finish', () => {
        fileStream.close();
        console.log(`Rendered: ${outputFile}`);
        resolve();
      });
    });

    req.on('error', reject);
    req.write(content);
    req.end();
  });
}

async function main() {
  const files = fs.readdirSync(srcDir).filter(f => f.endsWith('.plantuml'));
  for (const file of files) {
    const srcFile = path.join(srcDir, file);
    const outFile = path.join(outDir, file.replace('.plantuml', '.svg'));
    const incFile = path.join(incDir, file.replace('.plantuml', '.svg'));
    try {
      await renderPlantUml(srcFile, outFile);
      // Also copy to includes so Liquid {% include %} works if used
      fs.copyFileSync(outFile, incFile);
    } catch (err) {
      console.error(`Error rendering ${file}:`, err.message);
    }
  }

  // Copy additional reference images if available
  const atentoJpg = 'D:/Bruno/Documentos/atento/MAREIA-UFPE-atento60_fluxo.jpg';
  if (fs.existsSync(atentoJpg)) {
    fs.copyFileSync(atentoJpg, path.join(outDir, 'MAREIA-UFPE-atento60_fluxo.jpg'));
    console.log('Copied MAREIA-UFPE-atento60_fluxo.jpg to input/images');
  }
}

main();
