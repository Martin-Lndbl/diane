#! /bin/sh -eux

curl -X POST http://172.19.0.32/generate \
     -H "Content-Type: application/json" \
     -d '{"prompt": "How are you?", "speaker_id": "p231"}' | \
aplay

