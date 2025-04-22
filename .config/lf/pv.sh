#!/bin/sh

file="$1"
mime=$(file --mime-type -Lb "$file")

case "$mime" in
  image/*)
    chafa -f sixel -s "$2x$3" --animate off --polite on "$file"
    ;;
  text/*|application/json|application/xml)
    bat --theme=ansi --style=plain --color=always "$file"
    ;;
  *)
    file -h "$file"
    ;;
esac

