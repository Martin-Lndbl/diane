ARG DIST_VERSION=22.04
FROM ubuntu:${DIST_VERSION}

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && apt-get install -y git libstdc++6 g++

#
# PREPARE ENVIRONMENT
#

WORKDIR /
ARG GIT_ORG_OR_USER="CoderLSF"
RUN git clone https://github.com/${GIT_ORG_OR_USER}/fast-llama.git
WORKDIR /fast-llama/
RUN chmod +x ./build.sh
RUN ./build.sh
CMD
