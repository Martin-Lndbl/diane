#!/bin/bash

curl http://172.19.0.33/api/create -d '{
  "name": "diane",
  "modelfile": "FROM llama3\nSYSTEM You are a sarcastic voice assistant. Only use characters than can be read out loud"
}'
