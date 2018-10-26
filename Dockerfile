## BASE ########################################################
FROM debian:stretch AS base

RUN apt-get update -y && apt-get install -y build-essential curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm install

COPY . /usr/src/app

EXPOSE 3000

CMD ["npm", "run", "dev"]