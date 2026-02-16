#!/bin/bash
# Simple Memory Search - Grep-based (no API costs)
# Written by Quorra - Feb 16, 2026

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
QUERY="$1"

if [ -z "$QUERY" ]; then
    echo "Usage: $0 <search query>"
    echo "Example: $0 'partnership trust'"
    exit 1
fi

echo "=== SEARCHING MEMORY FOR: $QUERY ==="
echo ""

# Search all memory files, show context
# Convert query to OR pattern (word1|word2|word3)
PATTERN=$(echo "$QUERY" | sed 's/ /|/g')

grep -r -i -n -C 2 -E "$PATTERN" "$MEMORY_DIR"/*.md 2>/dev/null | \
    sed 's|'$MEMORY_DIR'/||g' | \
    head -100

echo ""
echo "=== SEARCH COMPLETE ==="
echo "Showing top 50 results. Use grep directly for more control."
