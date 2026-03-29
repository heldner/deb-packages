# deb-packages

Debian packages built from upstream binaries. Each package lives in its own directory under `packages/`.

## Available packages

| Package | Description |
|---------|-------------|
| [sthp](packages/sthp) | SOCKS5 to HTTP proxy ([upstream](https://github.com/KaranGauswami/socks-to-http-proxy)) |

## Repository structure

```
packages/
  <name>/
    debian/          # standard Debian packaging files
    <name>.service   # systemd unit (if applicable)
    <name>.default   # /etc/default config (if applicable)
build.sh             # local build helper
```

## Building locally

Requirements: `fakeroot`, `dpkg-dev`, `debhelper`, `curl`.

```bash
./build.sh <package> [version]
```

Example:

```bash
./build.sh sthp 0.5.0
```

The resulting `.deb` will be placed in `packages/`.

## CI / Releases

Pushing a tag in the format `<package>/<version>` triggers a GitHub Actions build and creates a release.

```bash
git tag sthp/0.5.0
git push origin sthp/0.5.0
```

## Adding a new package

1. Create `packages/<name>/debian/` with standard Debian packaging files (`control`, `rules`, `changelog`, etc.).
2. Add service/config files alongside `debian/` if needed.
3. Push a tag `<name>/<version>` to build and release.
