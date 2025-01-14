FROM node:12-alpine

RUN apk add --update bash

# Setting working directory. 
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json ./
RUN npm install

# Copying source files
COPY . .

# Give permission to run script
RUN chmod +x ./wait-for-it.sh ./entrypoint.sh

RUN npx browserslist@latest --update-db

# Build files
RUN npm run build

EXPOSE 3000

# entrypoint
ENTRYPOINT [ "./entrypoint.sh" ]

# Running the app
CMD [ "npm", "start" ]
