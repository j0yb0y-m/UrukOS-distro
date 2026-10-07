# Upstream provenance

- Upstream repo: https://forge.fedoraproject.org/releng/kiwi-descriptions.git
- Branch: `f44` (Fedora 44 release)
- Commit: `dfc49a5a10f69941179fdadd96aa6a5984f7c677`
- License: GPL-3.0-or-later (see `COPYING` in this directory)

## Our changes (initially none)

- (none yet — branding swap starts at M4 step 3)

To update upstream later:

```bash
git fetch https://forge.fedoraproject.org/releng/kiwi-descriptions.git f44
git diff <old>..<new> -- kiwi/ | review
# re-sync, update this file, list new changes under "Our changes"
```
