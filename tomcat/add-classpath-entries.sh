#!/bin/bash
set -e
if [[ "$CLASSPATH" == *"*"* ]]; then
    printf "Err: classpath with wildcard not supported: '%s'\n" "$path"
    exit 1
fi

mkdir -p "{{.libDir}}"
(
    IFS=:
    for path in $(printf '%s' "$CLASSPATH"); do
        printf "Linking %s to '{{.libDir}}/$(basename "$path")'\n" "$path"
        ln -s "$path" "{{.libDir}}/$(basename "$path")"
    done
)
