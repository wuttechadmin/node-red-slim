FROM node:18-slim as base
#
LABEL AUTHOR="Robert <ProfessorX> Burkhall <robert.burkhall@weunderstandtechnology.com>"
#
ARG DEBIAN_FRONTEND noninteractive
#
RUN apt update -y;  apt install -y apt-utils 
RUN apt install -y -q \
            nodejs>18.14.0 \
            python3 \
            npm && \
    mkdir -p /usr/src/node-red /data && \
    adduser --home /usr/src/node-red --disabled-password --no-create-home --gecos "" node-red --firstuid 1000 && \
    chown -R node-red:node-red /data && \
    chown -R node-red:node-red /usr/src/node-red

FROM nodered/node-red:latest-18-minimal AS build

COPY package.json .

RUN npm install  --unsafe-perm --no-update-notifier --no-audit --only=production

FROM base as prod

COPY --from=build --chown=node-red:node-red /data/ /data/

WORKDIR /usr/src/node-red
COPY settings.js /data/settings.js
COPY flows-prod.json  /data/flows.json

COPY --from=build --chown=node-red:node-red /usr/src/node-red/  /usr/src/node-red/
USER node-red

CMD ["npm", "start"]