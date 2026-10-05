FROM nginx:stable-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*

# Only ship the public site, not build tooling or sources.
COPY index.html 404.html favicon.ico sitemap.xml Anthony-Attard-Resume.pdf ./
COPY css/ css/
COPY js/ js/
COPY images/ images/
COPY libs/font-awesome/css/ libs/font-awesome/css/
COPY libs/font-awesome/fonts/ libs/font-awesome/fonts/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
