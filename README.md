# UrukOS-distro

KIWI-based ISO build for UrukOS, plus optional unattended Anaconda kickstart and post-install docs.

## How it fits

Part of the UrukOS project:

- [UrukOS-assets](https://github.com/j0yb0y-m/UrukOS-assets) — branding source
- [UrukOS-repo](https://github.com/j0yb0y-m/UrukOS-repo) — RPM specs/COPR
- [UrukOS-distro](https://github.com/j0yb0y-m/UrukOS-distro) — this repo

## Quick start

Builds require a Fedora host with `kiwi kiwi-systemdeps distribution-gpg-keys`. Building the ISO is a human step — see `docs/BUILDING.md`.

```bash
# validate the optional kickstart
ksvalidator kickstart/urukos-unattended.ks
# verify a built ISO (sha256 + os-release check)
scripts/verify-iso.sh outdir/*.iso
```

## Directory map

```
kiwi/             copy of upstream kiwi-descriptions (branch for FEDORA_RELEASE) + UPSTREAM.md
kickstart/        urukos-unattended.ks (optional, validate with ksvalidator)
anaconda/         product.d / conf.d overrides
scripts/          build-iso.sh (wrapper, HUMAN runs it), verify-iso.sh
docs/             STATUS.md, BUILDING.md, TESTING.md, INSTALL.md, SECURITY.md
```

## Contributing

See the UrukOS agent guide in the parent folder. Conventional Commits, English docs. CI lints only — never build ISOs in GitHub Actions.

## License

MIT. Copyright (c) 2026 Mahdi (J0yB0y). See [LICENSE](LICENSE). Files under `kiwi/` copied from upstream `kiwi-descriptions` keep their original license (GPL-3.0-or-later); see the upstream license text beside them once added.

UrukOS is an independent project based on Fedora Linux. It is not affiliated with or endorsed by the Fedora Project or Red Hat. Fedora and the Infinity design logo are trademarks of Red Hat, Inc.
