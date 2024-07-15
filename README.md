# Diane - AI voice assistant

Diane is a self-hosted AI voice assistant you can run form your computer or (if I get it working) microcontroller.

## Getting started - WIP
* Check `./controller/server.py` and adjust the ips accordingly
* Navigate to `./docker`
* Check `./docker/compose.yml` and adjust the ips accordingly
* Create a docker subnet
* Build and start the containers
```bash
docker compose build
docker compose up -d
```
* Check `./ask.sh` and change the IP accordingly
* Make sure aplay is installed
* Run `./ask.sh`
```bash
./ask.sh "Your prompt" [speaker] [model]
```
* Use [ollamas API](https://github.com/ollama/ollama/blob/main/docs/api.md) to configure models
