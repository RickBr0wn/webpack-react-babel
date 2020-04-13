# pull official base image
FROM node:10

# A directory within the virtualized Docker environment
# Becomes more relevant when using Docker Compose later
WORKDIR /usr/src/app

# Copies package.json and package-lock.json to Docker environment
COPY package*.json ./

# Installs all node packages
RUN npm install

# Copies everything over to Docker environment
COPY . .

# Build the project
RUN npm run build

# Uses port which is used by the actual application
EXPOSE 3000

# Finally runs the application
CMD [ "npm", "start" ]