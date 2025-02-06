# Stage 1: Build Angular application
FROM node:latest as builder

WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build --output-path=dist/frontend

# Stage 2: Serve with Nginx
FROM nginx:latest

COPY --from=builder /app/dist/frontend /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

