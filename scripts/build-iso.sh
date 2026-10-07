#!/bin/bash
# Human-run wrapper: build the UrukOS ISO.
# Usage: sudo ./scripts/build-iso.sh [profile] [image-type]
# Defaults: KDE live iso (see kiwi/VARIANTS.md).
set -euo pipefail
profile="${1:-KDE-Desktop-Live}"
imagetype="${2:-iso}"

command -v kiwi-build >/dev/null || { dnf -y install kiwi kiwi-systemdeps distribution-gpg-keys; }

cd "$(dirname "$0")/../kiwi"
sudo ./kiwi-build --kiwi-file=Fedora.kiwi --image-type="${imagetype}" \
	--image-profile="${profile}" --output-dir ./outdir
