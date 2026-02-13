#!/usr/bin/env bash
TARGET="$(realpath "$1")"

for pid in $(pgrep thunar); do
    CWD="$(readlink -f /proc/$pid/cwd 2>/dev/null)"
    if [ "$CWD" = "$TARGET" ]; then
        exit 0
    fi
done

thunar "$TARGET" &

