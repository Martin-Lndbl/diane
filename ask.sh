#!/bin/bash -eux

# Prompt is the first command line argument
PROMPT=$1

# Default model
SPEAKER_ID=diane
if [ $# -ge 2 ]; then
  SPEAKER_ID=$2
fi

# Default speaker_id
SPEAKER_ID=p336
if [ $# -ge 3 ]; then
  SPEAKER_ID=$3
fi

# Check if prompt is provided
if [ -z "$PROMPT" ]; then
  echo "Usage: $0 <prompt> [speaker_id]"
  exit 1
fi

# Execute the curl command
curl -X POST http://172.19.0.32/generate \
     -H "Content-Type: application/json" \
     -d "{\"prompt\": \"$PROMPT\", \"speaker_id\": \"$SPEAKER_ID\"}" \
     --output /tmp/output.wav &&

aplay < /tmp/output.wav
