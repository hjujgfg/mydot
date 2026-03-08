#!/bin/sh

out="$(ollama ps 2>/dev/null)"
lines="$(printf "%s\n" "$out" | tail -n +2 | grep -v '^\s*$' | wc -l)"

if [ "$lines" -gt 0 ]; then
  printf '{"text":"","class":"running","tooltip":"Ollama running"}'
else
  printf '{"text":"","class":"stopped","tooltip":"Ollama stopped"}'
fi
