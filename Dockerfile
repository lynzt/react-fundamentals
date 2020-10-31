FROM node:12.19-alpine

# set working directory
WORKDIR /usr/src/app
COPY . /usr/src/app

# install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
# COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.1 -g

# add app
COPY . ./
