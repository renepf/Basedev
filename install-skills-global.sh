#!/usr/bin/env bash
#
# install-skills-global.sh
# ------------------------------------------------------------------
# Promotes the project-scoped Claude assets in Basedev/.claude/ to the
# USER-GLOBAL location (~/.claude/), so every project and Cowork session
# can see them — skills, agents (agency + ecc), commands, and rules.
#
# Installs EVERYTHING (dev + non-dev). Non-destructive: existing files
# are only overwritten with --force. Run a dry run first.
#
# Usage:
#   ./install-skills-global.sh --dry-run     # show what would copy, change nothing
#   ./install-skills-global.sh               # install, skip files that already exist
#   ./install-skills-global.sh --force       # install and overwrite existing
# ------------------------------------------------------------------
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.claude"
DEST="${HOME}/.claude"

MODE="safe"          # safe = don't overwrite existing
case "${1:-}" in
  --dry-run) MODE="dry" ;;
  --force)   MODE="force" ;;
  "")        MODE="safe" ;;
  *) echo "Unknown flag: $1"; echo "Use --dry-run | --force | (no flag)"; exit 1 ;;
esac

# Assets to promote from project scope -> user-global scope.
ASSETS=(skills agents commands rules)

echo "Source : $SRC"
echo "Target : $DEST"
echo "Mode   : $MODE"
echo

if [[ ! -d "$SRC" ]]; then
  echo "ERROR: $SRC not found. Run this from the Basedev folder." >&2
  exit 1
fi

# Prefer rsync (clean, reports, respects excludes); fall back to cp.
have_rsync=0; command -v rsync >/dev/null 2>&1 && have_rsync=1

for asset in "${ASSETS[@]}"; do
  [[ -d "$SRC/$asset" ]] || { echo "skip: $asset (not present)"; continue; }
  echo ">> $asset"
  mkdir -p "$DEST/$asset"

  if [[ $have_rsync -eq 1 ]]; then
    OPTS=(-a --exclude '.DS_Store' --exclude '.git')
    [[ "$MODE" == "dry"   ]] && OPTS+=(-n -v)
    [[ "$MODE" == "safe"  ]] && OPTS+=(--ignore-existing)
    # force = default rsync overwrite behavior
    rsync "${OPTS[@]}" "$SRC/$asset/" "$DEST/$asset/"
  else
    if [[ "$MODE" == "dry" ]]; then
      find "$SRC/$asset" -type f ! -name '.DS_Store' | sed "s#$SRC#[would copy] #"
    elif [[ "$MODE" == "force" ]]; then
      cp -R "$SRC/$asset/." "$DEST/$asset/"
    else
      cp -Rn "$SRC/$asset/." "$DEST/$asset/" 2>/dev/null || true
    fi
  fi
  echo
done

if [[ "$MODE" == "dry" ]]; then
  echo "DRY RUN complete — nothing was written."
else
  echo "Done. Installed to $DEST"
  echo "Skills: $(find "$DEST/skills" -maxdepth 1 -type d | tail -n +2 | wc -l | tr -d ' ')  |  Agents: $(find "$DEST/agents" -name '*.md' | wc -l | tr -d ' ')"
  echo "Restart Claude / reopen Cowork to pick them up."
fi
