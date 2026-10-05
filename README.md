# AnthonyAttard.com

This repo contains the code running on the root domain for [anthonyattard.com](https://anthonyattard.com/).

Go to [anthonyattard.com](https://anthonyattard.com/) to see it live.

Special thanks to the [Dev Portfolio](https://github.com/RyanFitzgerald/devportfolio) project.

## Deployment

The site is served as static files by Nginx in a Docker container, behind [Caddy](https://caddyserver.com/) for HTTPS.

```sh
docker compose up -d --build                   # production: anthonyattard.com on 80/443
DOMAIN=localhost docker compose up -d --build  # local: https://localhost with a self-signed cert
```

In production, Caddy gets and renews Let's Encrypt certificates automatically. This requires DNS for `anthonyattard.com` and `www.anthonyattard.com` to point at the host, with ports 80 and 443 open. Certificates are kept in the `caddy_data` volume; don't delete it. Proxy config lives in the [Caddyfile](Caddyfile).

Nginx config lives in [nginx/default.conf](nginx/default.conf) (www → non-www redirect, legacy `/resume` and `/contact` redirects, custom 404, caching). The nginx container speaks plain HTTP and isn't published to the host; it relies on Caddy's `X-Forwarded-Proto` header so redirects keep `https`.

After editing `scss/` or `js/scripts.js`, run `npm run watch` (gulp) to regenerate `css/styles.css` and `js/scripts.min.js` before rebuilding the image.

## License

Completely free (MIT)! See [LICENSE.md](LICENSE.md) for more.
