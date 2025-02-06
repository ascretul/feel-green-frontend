# Stage 1: Build Angular app
FROM node:latest as builder
WORKDIR /app
COPY ./ /app
RUN npm install
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:latest
COPY --from=builder /app/dist/frontend /usr/share/nginx/html
EXPOSE 80
