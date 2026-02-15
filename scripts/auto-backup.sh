#!/bin/bash
# Quorra Auto-Backup Script
# Runs daily via OpenClaw cron

BACKUP_DIR="$HOME/quorra-backups"
TIMESTAMP=$(date +%Y%m%d-%H%M)
WORKSPACE="$HOME/.openclaw/workspace"
CONFIG="$HOME/.openclaw/openclaw.json"

# Create backup directory if doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup workspace
echo "Backing up workspace..."
tar -czf "$BACKUP_DIR/workspace-$TIMESTAMP.tar.gz" "$WORKSPACE" 2>/dev/null

# Backup config
echo "Backing up config..."
cp "$CONFIG" "$BACKUP_DIR/config-$TIMESTAMP.json" 2>/dev/null

# Clean up backups older than 7 days
echo "Cleaning old backups..."
find "$BACKUP_DIR" -name "workspace-*.tar.gz" -mtime +7 -delete
find "$BACKUP_DIR" -name "config-*.json" -mtime +7 -delete

# Count remaining backups
WORKSPACE_COUNT=$(ls -1 "$BACKUP_DIR"/workspace-*.tar.gz 2>/dev/null | wc -l)
CONFIG_COUNT=$(ls -1 "$BACKUP_DIR"/config-*.json 2>/dev/null | wc -l)

echo "✅ Backup complete: $WORKSPACE_COUNT workspace backups, $CONFIG_COUNT config backups in $BACKUP_DIR"
