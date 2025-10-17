#!/bin/bash
BACKUP_FILE="$1"
if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: ./restore_n8n.sh <backup-file>"
  exit 1
fi

echo "♻️ Restoring from $BACKUP_FILE..."
sudo docker compose down
sudo tar -xzf "$BACKUP_FILE" -C .
sudo docker compose up -d
echo "✅ Restore complete!"
