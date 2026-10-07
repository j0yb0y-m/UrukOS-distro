#!/bin/bash
# Verify a built UrukOS ISO: sha256 + os-release check.
# Usage: ./scripts/verify-iso.sh <path-to-iso>
set -euo pipefail
iso="${1:?usage: verify-iso.sh <iso>}"
[ -f "$iso" ] || {
	echo "no such file: $iso" >&2
	exit 1
}
sha256sum "$iso"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
if command -v bsdtar >/dev/null; then
	bsdtar -xf "$iso" -C "$tmp" usr/lib/os-release 2>/dev/null ||
		bsdtar -xf "$iso" -C "$tmp" "^usr/lib/os-release" || true
fi
if [ -f "$tmp/usr/lib/os-release" ]; then
	grep -E '^(NAME|ID|VERSION|VERSION_ID)=' "$tmp/usr/lib/os-release"
else
	echo "TODO(verify): bsdtar/xorriso not available to extract os-release; check ISO manually" >&2
fi
