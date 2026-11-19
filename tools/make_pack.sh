#!/bin/bash
# Zip one pack, hash it, update packs/manifest.json. Usage: tools/make_pack.sh prathmik
set -euo pipefail
LEVEL="${1:?usage: make_pack.sh <level>}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VER=$(python3 -c "import json;print(json.load(open('$ROOT/packs/$LEVEL/manifest.json'))['version'])")
ZIP="pack-$LEVEL-v$VER.zip"
cd "$ROOT/packs/$LEVEL" && zip -qr "../../$ZIP" . -x "*.DS_Store"
cd "$ROOT" && sha256sum "$ZIP" > "$ZIP.sha256"
echo "Built $ZIP ($(stat -c%s "$ZIP") bytes) — attach to Release tag pack-$LEVEL-v$VER"
