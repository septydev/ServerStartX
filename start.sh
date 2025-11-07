#!/bin/bash
# ServerStartX - Minecraft server startup script

JAR="server.jar"
RAM_MIN="1G"
RAM_MAX="2G"
LOG_FILE="logs/latest.log"

echo "Starting Minecraft server..."
sleep 1

if [ ! -f "$JAR" ]; then
  echo "Error: $JAR not found!"
  exit 1
fi

if ! command -v java &> /dev/null; then
  echo "Error: Java is not installed!"
  exit 1
fi

mkdir -p logs

while true; do
  echo "----------------------------------------"
  echo "Launching server at $(date)"
  echo "----------------------------------------"
  java -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR nogui | tee -a $LOG_FILE
  echo "Server stopped at $(date)"
  echo "Restarting in 10 seconds..."
  sleep 10
done
