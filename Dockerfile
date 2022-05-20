FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN apt-get update && \
    apt-get install tzdata git vim npm -y

WORKDIR /usr/local
RUN git init && \
    git remote add -f origin https://github.com/kookmin-sw/capstone-2022-43.git && \
    git config core.sparseCheckout true && \
    echo "server/" >> .git/info/sparse-checkout && \
    git pull origin master && \
    rm -rf .git

WORKDIR /usr/local/server
RUN npm i && \
    npm i -g pm2 && \
    touch .env && \
    echo "PORT=" > .env && \
    echo "JWT_OWNER_SECRET=" >> .env && \
    echo "JWT_FORWARDER_SECRET=" >> .env && \
    echo "HSCODE_SERVER_HOST=" >> .env && \
    echo "MYSQL_SERVER_HOST=" >> .env && \
    echo "MYSQL_SERVER_PORT=" >> .env && \
    echo "MYSQL_SERVER_USER=" >> .env && \
    echo "MYSQL_SERVER_PASSWORD=" >> .env && \
    echo "MYSQL_SERVER_DATABASE=" >> .env && \
    echo "1. Execute the \"vi .env\" command and Write your server environment variable\n" > README.txt && \
    echo "2. For typescript build, use the \"npm run build\" command\n" >> README.txt && \
    echo "3. For start server, use the \"npm run deploy\" command\n" >> README.txt && \
    echo "4. If you want to watch server logs, Use \"pm2 log\" or \"pm2 monit\"" >> README.txt