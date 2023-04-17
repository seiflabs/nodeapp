FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY . .

EXPOSE 8082
CMD [ "node", "main.js" ]
