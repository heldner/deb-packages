---
globs:
alwaysApply: false
---

- repository contains multiple deb packages, each under `packages/<name>/`
- each package is a self-contained source package root with a `debian/` directory
- package structure: `packages/<name>/debian/` with files `control`, `rules`, `changelog`, `preinst`, `postinst`, `prerm`, `postrm`, `source/format`
- `rules` file must include these variables:
  ```shell
  export DEB_BUILD_MAINT_OPTIONS = hardening=+all
  export DEB_BUILD_OPTIONS=noautodbgsym
  ```
- build is invoked via `./build.sh <name> <version>` from the repository root
- CI is triggered by tags in the format `<name>/<version>` (e.g. `sthp/0.5.0`)
- [documentation](https://www.debian.org/doc/manuals/maint-guide/dreq.en.html) for `control`, `rules`, `changelog`
