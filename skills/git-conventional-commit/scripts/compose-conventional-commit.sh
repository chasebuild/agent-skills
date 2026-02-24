#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <type> <scope> <summary> [body] [footer]" >&2
  exit 1
fi

type="$1"
scope="$2"
summary="$3"
body="${4:-}"
footer="${5:-}"

header="${type}(${scope}): ${summary}"
printf '%s\n' "$header"

if [ -n "$body" ]; then
  printf '\n%s\n' "$body"
fi

if [ -n "$footer" ]; then
  printf '\n%s\n' "$footer"
fi
