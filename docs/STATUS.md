# Status
Last updated: 2026-10-07
Milestone: M4

## Done
- Vendored upstream kiwi-descriptions branch f44 (commit dfc49a5a10f69941179fdadd96aa6a5984f7c677) into kiwi/, COPYING (GPL-3.0-or-later) included, kiwi/UPSTREAM.md written
- scripts/build-iso.sh (human wrapper for kiwi-build), scripts/verify-iso.sh (sha256 + os-release); shellcheck clean
- docs/BUILDING.md, TESTING.md, INSTALL.md, SECURITY.md; .github/workflows/lint.yml
- xmllint --noout passes on kiwi/Fedora.kiwi, Fedora-ELN.kiwi, components/*.xml, components/desktops/*.xml

## In progress
- M4 step 2: build the UNMODIFIED Fedora KDE live ISO and boot-test in a VM (human step)

## Blocked
- <none>

## Needs human
- Run the kiwi ISO build (see docs/BUILDING.md) and confirm VM boot, or authorize me to try

## TODO(verify)
- kiwi + kiwi-systemdeps + distribution-gpg-keys installed?
