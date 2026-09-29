# Imagem estática do IG mareIA: nginx servindo o site gerado pelo IG Publisher.
# O conteúdo de output/ é produzido pelo workflow build-and-publish.yml;
# esta imagem não compila o IG.
FROM nginx:1.27-alpine

LABEL org.opencontainers.image.source="https://github.com/brunovitorp/mareIA-ig" \
      org.opencontainers.image.description="Guia de Implementação FHIR R4 da Plataforma mareIA (site estático)"

COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY output/ /usr/share/nginx/html/

EXPOSE 80
