#!/bin/bash
echo "🔄 Restarting n8n Docker containers..."

# Navigate to the directory where your docker-compose.yml is located
cd "$(dirname "$0")" || exit

# Stop existing containers
sudo docker compose down

# Start them back up in detached mode
sudo docker compose up -d

# Show container status
echo "✅ Containers restarted successfully!"
sudo docker ps | grep n8n
