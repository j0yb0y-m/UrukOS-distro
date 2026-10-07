# Testing

## What CI checks (never build ISOs in GitHub Actions)

- `xmllint --noout` on `kiwi/*.kiwi` and `kiwi/components/*.xml`
- `shellcheck scripts/*.sh`
- `python3 -m json.tool` / TOML validation where applicable

## Manual checks after every change

```bash
for f in kiwi/*.kiwi kiwi/components/*.xml; do xmllint --noout "$f"; done
shellcheck scripts/*.sh
./scripts/verify-iso.sh kiwi/outdir/*.iso   # after a build
```

## Boot test checklist

- [ ] VM boots to KDE Plasma (Wayland session at login)
- [ ] Live session user can open applications
- [ ] `cat /etc/os-release` matches expected identity
- [ ] Installer runs (Anaconda) — at least up to partitioning
- [ ] Post-install: `systemctl status firewalld` and SELinux enforcing
