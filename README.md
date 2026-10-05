# AnthonyAttard.com

This repo contains the code running on the root domain for [anthonyattard.com](https://anthonyattard.com/).

Go to [anthonyattard.com](https://anthonyattard.com/) to see it live.

Special thanks to the [Dev Portfolio](https://github.com/RyanFitzgerald/devportfolio) project.

## Deployment

The site is served as static files by Nginx in a Docker container.

```sh
docker compose up -d --build          # serves on port 80
HOST_PORT=8080 docker compose up -d   # or pick another host port
```

Nginx config lives in [nginx/default.conf](nginx/default.conf) (www → non-www redirect, legacy `/resume` and `/contact` redirects, custom 404, caching). The container speaks plain HTTP; terminate TLS in front of it (e.g. Caddy, Traefik, or a host Nginx with Certbot) and forward `X-Forwarded-Proto` so redirects keep `https`.

After editing `scss/` or `js/scripts.js`, run `npm run watch` (gulp) to regenerate `css/styles.css` and `js/scripts.min.js` before rebuilding the image.

## License

Completely free (MIT)! See [LICENSE.md](LICENSE.md) for more.
