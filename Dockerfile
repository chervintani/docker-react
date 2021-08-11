
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build
 
FROM nginx
#copy in FROM then the folder we wil copy up to the directory of nginx
COPY --from=0 /app/build /usr/share/nginx/html 