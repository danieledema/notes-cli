#!/usr/bin/env bash

# Default note base directory (can be overridden by $NOTES_DIR)
base="${NOTES_DIR:-$HOME/zettli}"
mkdir -p "$base"

# Default editor (can be overridden by $EDITOR or $NOTES_EDITOR)
editor="${NOTES_EDITOR:-${EDITOR:-nvim}}"

notes_new() {
  dir="$base"

  while true; do
    shortdir=$(realpath --relative-to="$base" "$dir")
    menu=$( 
      (
        echo "+ New Subfolder"
        echo "+ Done"
        find "$dir" -mindepth 1 -maxdepth 1 -type d -printf "%P\n" 2>/dev/null
      ) | fzf --prompt="> " --header="Current: $shortdir"
    )

    [ -z "$menu" ] && exit 0

    case "$menu" in
      "+ New Subfolder")
        echo -n "New subfolder name: "
        read newsub
        dir="$dir/$newsub"
        mkdir -p "$dir"
        ;;
      "+ Done")
        break
        ;;
      *)
        dir="$dir/$menu"
        ;;
    esac
  done

  if [ $# -gt 0 ]; then
    notetitle="$*"
  else
    echo -n "Note title (optional): "
    read notetitle
  fi

  timestamp=$(date +"%Y%m%d%H%M")
  iso_date=$(date --iso-8601=seconds)

  if [ -n "$notetitle" ]; then
    clean_title=$(echo "$notetitle" | tr ' ' '-')
    filename="$dir/${timestamp}-${clean_title}.md"
    front_title="$notetitle"
  else
    filename="$dir/$timestamp.md"
    front_title="Note $timestamp"
  fi

  if [ ! -f "$filename" ]; then
cat > "$filename" <<EOF
---
id: $timestamp
title: $front_title
date: $iso_date
tags: []
---

# $timestamp - $front_title

EOF
  fi

  "$editor" "$filename"
}

notes_open() {
  cd "$base" || exit 1

  relfile=$(find . -type f -name "*.md" -printf "%P\n" \
    | fzf \
      --prompt="Open note: " \
      --preview 'bat --style=numbers --color=always {} | head -100' \
      --preview-window=up:40%)

  [ -z "$relfile" ] && exit 0
  "$editor" "$relfile"
}

notes_search() {
  if [ $# -eq 0 ]; then
    echo "Usage: notes search <keyword>"
    exit 1
  fi
  rg --hidden --glob '*.md' "$*" "$base"
}

case "$1" in
  new)
    shift
    notes_new "$@"
    ;;
  open)
    notes_open
    ;;
  search)
    shift
    notes_search "$@"
    ;;
  *)
    echo "Usage:"
    echo "  notes new [title...]    # create new note"
    echo "  notes open              # browse & open existing note"
    echo "  notes search <keyword>  # search text inside notes"
    exit 1
    ;;
esac
