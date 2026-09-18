#!/bin/bash
# Smoke test for the bigdl formula. Run from inside the tap repo root.
set -euo pipefail

FORMULA="bigdl"
TAP="repasscloud/tap"
TAP_FORMULA="${TAP}/${FORMULA}"
TAP_REMOTE_URL="git@github.com:repasscloud/homebrew-tap.git"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

restore_tap() {
  echo "==> restoring $TAP to normal remote"
  brew untap "$TAP" 2>/dev/null || true
  brew tap "$TAP" "$TAP_REMOTE_URL"
}
trap restore_tap EXIT

echo "==> pointing $TAP at local checkout"
brew untap "$TAP" 2>/dev/null || true
brew tap --custom-remote "$TAP" "$REPO_ROOT"

echo "==> brew style"
brew style "$TAP_FORMULA"

echo "==> brew audit"
brew audit --online "$TAP_FORMULA"

echo "==> brew install"
brew install "$TAP_FORMULA"

echo "==> verifying binary is installed"
BIN_PATH="$(brew --prefix)/bin/${FORMULA}"
if [[ ! -x "$BIN_PATH" ]]; then
  echo "FAIL: $BIN_PATH not found after install"
  exit 1
fi

echo "==> verifying formula version"
FORMULA_VERSION=$(grep -m1 'v[0-9]\+\.[0-9]\+\.[0-9]\+' "Formula/${FORMULA}.rb" | sed -E 's/.*v([0-9]+\.[0-9]+\.[0-9]+).*/\1/')
BIN_VERSION_OUTPUT="$("$BIN_PATH" --version 2>&1)"
if [[ "$BIN_VERSION_OUTPUT" != *"$FORMULA_VERSION"* ]]; then
  echo "FAIL: formula declares $FORMULA_VERSION but binary reports: $BIN_VERSION_OUTPUT"
  exit 1
fi

echo "==> brew test"
brew test "$FORMULA"

echo "==> brew uninstall"
brew uninstall "$FORMULA"

if [[ -x "$BIN_PATH" ]]; then
  echo "FAIL: $BIN_PATH still present after uninstall"
  exit 1
fi

echo "All checks passed."
