FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# Everything we require will go into /app/build
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Default command of nginx starts up nginx anyway