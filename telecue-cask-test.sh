#!/bin/bash
# Smoke test for the telecue cask. Run from inside the tap repo root.
set -euo pipefail

CASK="telecue"
TAP_CASK="repasscloud/tap/${CASK}"

echo "==> brew style"
brew style --cask "$TAP_CASK"

echo "==> brew audit"
brew audit --cask --online "$TAP_CASK"

echo "==> brew install"
brew install --cask "$TAP_CASK"

APP="/Applications/TeleCue.app"

# The app isn't codesigned/notarized yet, so Gatekeeper would otherwise
# refuse to launch it. Homebrew's --no-quarantine install flag no longer
# exists, so strip the quarantine attribute manually.
xattr -dr com.apple.quarantine "$APP" 2>/dev/null || true

echo "==> verifying app is installed"
if [[ ! -d "$APP" ]]; then
  echo "FAIL: $APP not found after install"
  exit 1
fi

echo "==> verifying bundle identifier"
BUNDLE_ID=$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$APP/Contents/Info.plist")
if [[ "$BUNDLE_ID" != "com.repasscloud.TeleCue" ]]; then
  echo "FAIL: expected bundle id com.repasscloud.TeleCue, got $BUNDLE_ID"
  exit 1
fi

echo "==> verifying bundle version"
CASK_VERSION=$(grep -m1 '^\s*version ' "Casks/${CASK}.rb" | sed -E 's/.*version "([^"]+)".*/\1/')
BUNDLE_VERSION=$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$APP/Contents/Info.plist")
if [[ "$BUNDLE_VERSION" != "$CASK_VERSION" ]]; then
  echo "FAIL: cask declares $CASK_VERSION but bundle reports $BUNDLE_VERSION"
  exit 1
fi

echo "==> brew uninstall (with zap)"
brew uninstall --cask --zap "$CASK"

if [[ -d "$APP" ]]; then
  echo "FAIL: $APP still present after uninstall"
  exit 1
fi

echo "All checks passed."
