#!/bin/bash
BACKUP_DIR="./backups"
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/n8n_backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

echo "📦 Creating backup: $BACKUP_FILE"
sudo docker compose down

if [ -f ".env" ]; then
  sudo tar -czf "$BACKUP_FILE" ./n8n_data ./mysql_data ./docker-compose.yml .env
else
  echo "⚠️  .env not found, skipping it..."
  sudo tar -czf "$BACKUP_FILE" ./n8n_data ./mysql_data ./docker-compose.yml
fi

sudo docker compose up -d
echo "✅ Backup complete!"
