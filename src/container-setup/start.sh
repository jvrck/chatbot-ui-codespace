#!/bin/bash
set -e

# Start Nginx
# nginx

# Check if .env.local exists, if not, create it
if [ ! -f /app/chatbot-ui/.env.local ]; then
  echo "Creating .env.local file..."
  cat <<EOF > /app/chatbot-ui/.env.local
# Supabase Public
NEXT_PUBLIC_SUPABASE_URL=https://nfuzyclelveoiyhjadyb.supabase.co/
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5mdXp5Y2xlbHZlb2l5aGphZHliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU1MTUxNDMsImV4cCI6MjA0MTA5MTE0M30.TbC_ZHeCkKrf3XhJUfDSq5BxO3AZ68c6S2h5MqybIFY
# Supabase Private
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5mdXp5Y2xlbHZlb2l5aGphZHliIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyNTUxNTE0MywiZXhwIjoyMDQxMDkxMTQzfQ.Dmg8Tg7Zbb-3od3cW5JOWn3SrUV9lVyfRrqUK3U3ARA
NEXT_PUBLIC_USER_FILE_SIZE_LIMIT=10485760
EOF
  echo ".env.local file created."
fi

# Change directory to /app/chatbot-ui/ and run npm
cd /app/chatbot-ui/ && source /usr/local/share/nvm/nvm.sh && exec npm run dev