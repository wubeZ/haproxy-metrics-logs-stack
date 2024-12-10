FROM node:12
WORKDIR /app
COPY package*.json /app/
COPY ./ /app/
RUN npm install
CMD ["npm", "run", "start"]
EXPOSE 9999