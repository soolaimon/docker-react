FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["yarn", "build"]

FROM nginx:stable
COPY --from=builder /app/build /usr/share/nginx/html
