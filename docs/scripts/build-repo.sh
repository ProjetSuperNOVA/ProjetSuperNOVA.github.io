#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_DIR="$ROOT_DIR/docs/repo"

ARCHITECTURES=("x86_64")

if ! command -v createrepo_c &>/dev/null; then
    echo "ERROR: createrepo_c is not installed."
    exit 1
fi

for ARCH in "${ARCHITECTURES[@]}"; do

    DIR="$REPO_DIR/$ARCH"

    mkdir -p "$DIR/packages"

    echo "Generating repository metadata: $ARCH"

    createrepo_c --update "$DIR"

done

echo "Repository metadata generated successfully."