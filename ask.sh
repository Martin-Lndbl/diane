#! /bin/sh -eux

# text=$(curl -s -X POST -H "Content-Type: application/json" -d "{
#   \"user_message\": \"${1}\",
#   \"max_tokens\": 100
# }" http://172.19.0.50 | \
#   jq '.choices[0].text' | \
#   sed 's/\\//g' | \
#   jq -sRr @uri)

# echo "$text"
curl -H 'Content-Type: application/json' \
     -d '{"contents":[
            {"role": "user",
              "parts":[{"text": "Give me five subcategories of jazz?"}]}]}' \
     "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=${GEMINI}"


# curl -s "http://172.19.0.51/api/tts?text=${text}&speaker_id=p231&style_wav=&language_id=" | aplay
