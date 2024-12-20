FROM node:18-alpine

# Set working directory
WORKDIR /var/www/html

# Install dependencies
COPY package*.json ./
RUN npm install

RUN apk add --no-cache bash

# Copy application code
COPY . .

# Expose port for development server
EXPOSE 4200

# Start Angular development server
CMD ["npm", "start", "--", "--host", "0.0.0.0"]
