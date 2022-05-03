FROM ubuntu:22.04
RUN apt update && apt install git vim npm -y && npm i -g typescript pm2
