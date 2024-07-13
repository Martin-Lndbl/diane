ARG DIST_VERSION=22.04
FROM ubuntu:${DIST_VERSION}

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && apt-get install -y git python3.11 python3-pip libstdc++6 rustc cargo libsndfile-dev espeak

#
# PREPARE ENVIRONMENT
#

WORKDIR /
ARG GIT_ORG_OR_USER="Martin-Lndbl"
RUN git clone https://github.com/${GIT_ORG_OR_USER}/TTS.git
WORKDIR /TTS/
RUN pip install -U pip setuptools
RUN pip install -e .
CMD python3 TTS/server/server.py --port 80 --model_name tts_models/en/vctk/vits
