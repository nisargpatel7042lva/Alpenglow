#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <spec.tla> [config.cfg] [extra TLC args...]" >&2
  exit 1
fi

SPEC="$1"; shift || true
CFG=""
if [ $# -ge 1 ] && [[ "$1" == *.cfg ]]; then
  CFG="-config $1"; shift
fi

JAVA_OPTS=${JAVA_OPTS:-"-Xms1g -Xmx4g"}
TLC_OPTS=${TLC_OPTS:-"-workers 4"}

echo "Running TLC on $SPEC $CFG $TLC_OPTS $@"
tlc2.TLC $TLC_OPTS $CFG "$SPEC" "$@"


