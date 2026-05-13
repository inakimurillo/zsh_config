#!/usr/bin/env bash
set -euo pipefail

# Resolve script dir through symlinks without relying on GNU `readlink -f`
# (not available on stock macOS).
source_path="${BASH_SOURCE[0]}"
while [[ -L "$source_path" ]]; do
    dir="$(cd -P "$(dirname "$source_path")" >/dev/null 2>&1 && pwd)"
    source_path="$(readlink "$source_path")"
    [[ "$source_path" != /* ]] && source_path="$dir/$source_path"
done
SCRIPT_DIR="$(cd -P "$(dirname "$source_path")" >/dev/null 2>&1 && pwd)"

SOURCE_FILE="$SCRIPT_DIR/.zshrc"
TARGET_FILE="$HOME/.zshrc"
BACKUP_DIR="$SCRIPT_DIR/backup"

case "$(uname -s)" in
    Darwin) os_name="macOS" ;;
    Linux)  os_name="Linux" ;;
    *)      os_name="$(uname -s)" ;;
esac

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: source file not found at $SOURCE_FILE" >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR"

if [[ -e "$TARGET_FILE" ]]; then
    timestamp="$(date +%Y%m%d-%H%M%S)"
    backup_path="$BACKUP_DIR/.zshrc.$timestamp.bak"
    cp -p "$TARGET_FILE" "$backup_path"
    echo "Backed up existing $TARGET_FILE -> $backup_path"
else
    echo "No existing $TARGET_FILE found; skipping backup."
fi

cp "$SOURCE_FILE" "$TARGET_FILE"
echo "Installed $SOURCE_FILE -> $TARGET_FILE ($os_name)"
