#!/usr/bin/env bash
# Delete dated morning-brief HTML older than 7 days (by filename date).
set -euo pipefail
DIR="$(cd "$(dirname "$0")/../docs/morning-briefs" && pwd)"
CUTOFF=$(date -u -d '7 days ago' +%Y-%m-%d 2>/dev/null || date -u -v-7d +%Y-%m-%d)
for f in "$DIR"/*-20[0-9][0-9]-[0-9][0-9]-[0-9][0-9].html; do
  [ -e "$f" ] || continue
  base=$(basename "$f")
  # closer-YYYY-MM-DD.html
  d=$(echo "$base" | grep -oE '20[0-9]{2}-[0-9]{2}-[0-9]{2}')
  if [ -n "$d" ] && [[ "$d" < "$CUTOFF" ]]; then
    echo "purge $base (date $d < $CUTOFF)"
    rm -f "$f"
  fi
done
