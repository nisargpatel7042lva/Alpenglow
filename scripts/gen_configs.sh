#!/usr/bin/env bash
set -euo pipefail

for N in 4 6 8 10; do
  cat > specs/tla/configs/Alpenglow_${N}.cfg <<EOF
SPECIFICATION Spec
CONSTANTS 
  N = ${N}
  STAKE_TOTAL = 100
  THRESH_FAST = 80
  THRESH_SLOW = 60
  MaxDelay = 2

INVARIANT Safety_NoConflictingFinalization
INVARIANT Safety_CertUniq
EOF
  echo "Wrote specs/tla/configs/Alpenglow_${N}.cfg"
done


