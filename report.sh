#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory> <ERROR|WARN> [--top N]"
    exit 1
fi

DIR="$1"
LEVEL="$2"

if [ ! -d "$DIR" ]; then
    echo "Error: directory '$DIR' does not exist"
    exit 1
fi

if [ "$LEVEL" != "ERROR" ] && [ "$LEVEL" != "WARN" ]; then
    echo "Error: level must be ERROR or WARN"
    exit 1
fi

TOP=""

if [ "$3" = "--top" ]; then
    if [ -z "$4" ]; then
        echo "Error: --top requires a number"
        exit 1
    fi
    TOP="$4"
fi

RESULT=$(grep -h " $LEVEL " "$DIR"/* 2>/dev/null \
    | grep -o 'module=[^ ]*' \
    | cut -d= -f2 \
    | sort \
    | uniq -c \
    | sort -nr)

printf "%-20s %s\n" "MODULE" "COUNT"
printf "%-20s %s\n" "------" "-----"

if [ -n "$TOP" ]; then
    echo "$RESULT" | head -n "$TOP" | awk '{printf "%-20s %s\n", $2, $1}'
else
    echo "$RESULT" | awk '{printf "%-20s %s\n", $2, $1}'
fi

