FROM node:buster-slim

RUN apt update && apt upgrade -y
RUN apt install -y git-core vim npm

WORKDIR /app
RUN git clone https://github.com/timqian/star-history.git

RUN npm install -g parcel-bundler
RUN npm install semver

WORKDIR /app/star-history
ENTRYPOINT ["/usr/bin/npm", "run", "startWebsite"]
