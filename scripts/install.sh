#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skills_root="$repo_root/skills"
dest="${CODEX_HOME:-$HOME/.codex}/skills"
mode="copy"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --symlink)
      mode="symlink"
      shift
      ;;
    --copy)
      mode="copy"
      shift
      ;;
    --dest)
      dest="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

mkdir -p "$dest"

for skill_dir in "$skills_root"/*; do
  [[ -d "$skill_dir" ]] || continue
  skill_name="$(basename "$skill_dir")"
  target="$dest/$skill_name"

  rm -rf "$target"

  if [[ "$mode" == "symlink" ]]; then
    ln -s "$skill_dir" "$target"
    echo "symlinked $skill_name -> $target"
  else
    cp -R "$skill_dir" "$target"
    echo "copied $skill_name -> $target"
  fi
done

echo "Installed skills into $dest"
