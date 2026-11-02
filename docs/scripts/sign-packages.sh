#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -z "${GPG_KEY_ID:-}" ]]; then
    echo "ERROR: Set GPG_KEY_ID first."
    exit 1
fi

shopt -s nullglob

for RPM in "$ROOT_DIR"/docs/repo/*/packages/*.rpm; do

    echo "Signing $(basename "$RPM")"

    rpm --define "_gpg_name $GPG_KEY_ID" --addsign "$RPM"

done

echo "Package signing completed."