#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <spec.tla>" >&2
  exit 1
fi

SPEC="$1"
echo "Checking proofs with TLAPS: $SPEC"
tlapm --clean --force --toolbox "$SPEC"


