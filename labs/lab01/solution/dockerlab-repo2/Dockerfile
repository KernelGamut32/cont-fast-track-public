# Grabs NodeJS image upon which the new image will be based
FROM node:current-alpine

# Creates a new target folder in image
RUN mkdir -p /usr/src/NodeApp

# Switches working directory in image to app folder
WORKDIR /usr/src/NodeApp

# Copies current directory contents to newly created folder
COPY . .

# Install app dependencies
RUN npm install

# Executes new NodeJS app
CMD ["node", "server.js"]
