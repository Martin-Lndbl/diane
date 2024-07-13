curl -s -X POST -H "Content-Type: application/json" -d '{
  "system_message": "short answers",
  "user_message": "Tell me a joke",
  "max_tokens": 100
}' http://172.19.0.50 | \
  jq '.choices[0].text'
