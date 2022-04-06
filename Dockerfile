FROM ubuntu:18.04

RUN apt-get update && apt-get install -y software-properties-common

RUN apt-get update \
    && apt-get install -y \
        g++ \
        make \
        cmake \
        unzip \
        dh-autoreconf \
        libcurl4-openssl-dev

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get install -y \
        nodejs

WORKDIR /app

COPY package.json /app/
RUN npm install
COPY index.js script.sh /app/

ENTRYPOINT ["node", "node_modules/aws-lambda-ric/bin/index.js"]
CMD ["index.handler"]