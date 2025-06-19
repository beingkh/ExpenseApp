FROM node:20.0
WORKDIR /opt/backend
COPY *.js .
COPY *.json .
RUN npm install
ENV DB_HOST="mysql"
CMD ["node", "index.js"]