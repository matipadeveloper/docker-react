FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]
#/app/build is where the build will be stored

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
