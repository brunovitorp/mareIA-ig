# Cookbook — Publicação e Deploy do Ecossistema Unificado mareIA

Este guia explica como orquestrar e publicar o **Portal Central mareIA** juntamente com os **4 Guias de Implementação (IGs)** em um único domínio ou GitHub Pages.

---

## 1. Estrutura de Publicação de URLs

O deploy integrado deve disponibilizar a seguinte estrutura hierárquica de rotas:

```
https://mareia.saude.gov.br/ig/
├── index.html                   ← Portal Central (Hub de Diretrizes)
├── portal.css                   ← Estilos do Portal
├── cardio/                      ← IG CardioRemoto (UFPB / HULW)
│   ├── index.html
│   ├── artifacts.html
│   └── ...
├── atento60/                    ← IG ATENTO 60+ (UFPE / UFPB)
│   ├── index.html
│   ├── artifacts.html
│   └── ...
├── familiarativa/               ← IG FamilIAr_Ativa (UFPel / CUIDATIVA)
│   ├── index.html
│   ├── artifacts.html
│   └── ...
└── agrosus/                     ← IG AgroSUS (FATEC Ferraz)
    ├── index.html
    ├── artifacts.html
    └── ...
```

---

## 2. GitHub Actions Workflow para Deploy Unificado

Crie o arquivo `.github/workflows/deploy-portal-ecosystem.yml` no repositório principal da organização para orquestrar o build e agregação:

```yaml
name: Deploy mareIA Digital Guidelines Portal

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repositório Hub
        uses: actions/checkout@v4

      - name: Preparar Diretório de Publicação
        run: |
          mkdir -p public
          cp -r portal/* public/

      - name: Clonar e Compilar CardioRemoto
        run: |
          git clone https://github.com/brunovitorp/mareIA-ig.git cardio-src
          cd cardio-src
          npm install -g fsh-sushi
          sushi .
          # Gerar output do IG Publisher
          ./_genonce.sh -no-sushi
          cd ..
          mkdir -p public/cardio
          cp -r cardio-src/output/* public/cardio/

      - name: Clonar e Compilar ATENTO 60+
        run: |
          git clone https://github.com/italomacedo/mareIA-ig.git atento-src
          cd atento-src
          sushi .
          ./_genonce.sh -no-sushi
          cd ..
          mkdir -p public/atento60
          cp -r atento-src/output/* public/atento60/

      - name: Clonar e Compilar FamilIAr_Ativa
        run: |
          git clone https://github.com/cesarsperb/mareIA-ig.git familiar-src
          cd familiar-src
          sushi .
          ./_genonce.sh -no-sushi
          cd ..
          mkdir -p public/familiarativa
          cp -r familiar-src/output/* public/familiarativa/

      - name: Clonar e Compilar AgroSUS
        run: |
          git clone https://github.com/jefersonrl/AgroSUS-FHIR.git agrosus-src
          cd agrosus-src
          sushi .
          ./_genonce.sh -no-sushi
          cd ..
          mkdir -p public/agrosus
          cp -r agrosus-src/output/* public/agrosus/

      - name: Upload Artifact para GitHub Pages
        uses: actions/upload-pages-artifact@v3
        with:
          path: public

      - name: Deploy para GitHub Pages
        uses: actions/deploy-pages@v4
```

---

## 3. Benefícios da Abordagem

1. **Adesão ao WHO SMART Guidelines:** Cada pathway mantém seu DAK L2 e sua autonomia clínica e técnica.
2. **Visão Executiva Unificada:** Apresentação coesa e profissional para os avaliadores da RNP e do Ministério da Saúde.
3. **Consistência Semântica:** Compartilhamento dos perfis base do SUS Digital através do padrão `mareia-patient-base`.
