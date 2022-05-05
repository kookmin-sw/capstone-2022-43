FROM ubuntu:22.04
RUN apt update && apt install git vim npm -y

WORKDIR /usr/local
RUN git clone https://github.com/ASak1104/baetaverse.git

WORKDIR /usr/local/baetaverse/server
RUN npm i && npm i -g typescript pm2 && touch .env