# Building

## Prereqs (Fedora 44 host)

```bash
sudo dnf5 install kiwi kiwi-systemdeps distribution-gpg-keys
```

Optional for verify-iso.sh:

```bash
sudo dnf5 install libarchive-tools xorriso
```

## Build the ISO

From the distro repo root:

```bash
sudo ./scripts/build-iso.sh            # default: KDE-Desktop-Live, iso
# or a different profile/type (see kiwi/VARIANTS.md):
sudo ./scripts/build-iso.sh KDE-Desktop-Disk oem
```

First build downloads a lot (package metadata + RPMs); expect 30-60 min.
Output goes to `kiwi/outdir/`.

## Verify

```bash
./scripts/verify-iso.sh kiwi/outdir/*.iso
```

Expected output: a sha256 line and `NAME="UrukOS"` (after M4 step 4; before that `Generic`/Fedora is expected).

## Boot in a VM

- Create a VM (VirtualBox/libvirt) with the ISO as the live CD, enable EFI, 4 GB+ RAM.
- Expected: live session boots to KDE Plasma on Wayland, os-release shows the distro name.

## Milestone 4 sequence (per AGENT_README.md)

1. Vendoring upstream (done — see `kiwi/UPSTREAM.md`).
2. Build the **unmodified** Fedora KDE live ISO; confirm it boots in a VM.
3. Replace branding with `generic-*` packages; human re-tests.
4. Swap `generic-*` for `urukos-*`; human re-tests.

If package conflicts appear at step 4, do NOT use `--allowerasing` in the image; record the exact dnf error in `docs/STATUS.md`.
