FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
# Everything we require will go into /app/build
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# Default command of nginx starts up nginx anyway