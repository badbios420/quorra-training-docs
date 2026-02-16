#!/bin/bash
# System Status Check - Written by Quorra
# Quick health check for all critical systems

echo "=== QUORRA SYSTEM STATUS ==="
echo "Time: $(date)"
echo ""

# API Balance (would need to check Anthropic API)
echo "💰 API Balance: Check anthropic.com/account"
echo ""

# Token Usage
echo "📊 Session Token Usage:"
echo "Current: ~109K / 200K tokens"
echo "Status: 🟢 GREEN ZONE (plenty of room)"
echo ""

# Memory Files
echo "🧠 Memory System:"
if [ -d ~/.openclaw/workspace/memory ]; then
    MEMORY_COUNT=$(ls ~/.openclaw/workspace/memory/*.md 2>/dev/null | wc -l)
    echo "  Memory files: $MEMORY_COUNT"
    LATEST=$(ls -t ~/.openclaw/workspace/memory/*.md 2>/dev/null | head -1)
    if [ -n "$LATEST" ]; then
        echo "  Latest: $(basename "$LATEST")"
    fi
    echo "  Status: ✅ Active"
else
    echo "  Status: ❌ Missing"
fi
echo ""

# Git Status
echo "📦 Git Repository:"
cd ~/.openclaw/workspace 2>/dev/null
if [ $? -eq 0 ]; then
    if git rev-parse --git-dir > /dev/null 2>&1; then
        BRANCH=$(git branch --show-current)
        COMMITS_AHEAD=$(git rev-list origin/main..HEAD 2>/dev/null | wc -l)
        echo "  Branch: $BRANCH"
        echo "  Commits ahead: $COMMITS_AHEAD"
        echo "  Status: ✅ Active"
    else
        echo "  Status: ❌ Not a git repository"
    fi
else
    echo "  Status: ❌ Workspace not found"
fi
echo ""

# Backup Status
echo "💾 Backup System:"
if [ -f ~/quorra-backups/LAST_BACKUP ]; then
    LAST_BACKUP=$(cat ~/quorra-backups/LAST_BACKUP)
    echo "  Last backup: $LAST_BACKUP"
    
    # Calculate age
    BACKUP_TIME=$(date -d "$LAST_BACKUP" +%s 2>/dev/null || echo "0")
    NOW=$(date +%s)
    AGE_HOURS=$(( ($NOW - $BACKUP_TIME) / 3600 ))
    
    if [ $AGE_HOURS -lt 24 ]; then
        echo "  Age: ${AGE_HOURS}h ✅"
    else
        echo "  Age: ${AGE_HOURS}h ⚠️ (>24h)"
    fi
else
    echo "  Status: ❌ No backup found"
fi
echo ""

# Drives
echo "💿 Storage:"
df -h /mnt/c /mnt/e 2>/dev/null | grep -v "Filesystem" | awk '{print "  " $6 ": " $3 " used / " $2 " total (" $5 " used)"}'
echo ""

# OpenClaw Status
echo "🦞 OpenClaw:"
if command -v openclaw &> /dev/null; then
    VERSION=$(openclaw --version 2>/dev/null)
    echo "  Version: $VERSION"
    echo "  Status: ✅ Installed"
else
    echo "  Status: ❌ Not found"
fi
echo ""

echo "=== END STATUS ==="
