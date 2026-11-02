#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Building RPM repository..."

"$ROOT_DIR/scripts/build-repo.sh"

echo "Adding files to Git..."

git -C "$ROOT_DIR" add docs/

echo
echo "Repository is ready."
echo "Review changes, commit and push when satisfied."