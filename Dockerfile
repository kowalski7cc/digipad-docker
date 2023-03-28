FROM node:19.0-bullseye-slim
WORKDIR /app
RUN apt update && apt install -y wget
ENV VERSION 1.0.4
ENV URL https://codeberg.org/ladigitale/digipad/archive/$VERSION.tar.gz
RUN wget -O - $URL | tar -xz --strip-components=1
RUN npm install
RUN npm run build
CMD [ "npm", "run", "start" ]