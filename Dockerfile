# BUILD PHASE
FROM  node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# After this, the build folder will be at /app/build

#RUN PHASE
FROM  nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
