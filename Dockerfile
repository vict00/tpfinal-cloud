# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY mon-app/package*.json ./

# Install dependencies
RUN npm install

# Set build arguments and environment
ARG BUILD_ID=local
ENV VITE_BUILD_ID=$BUILD_ID

# Copy application code
COPY mon-app/ .

# Build the application
RUN npm run build

# Stage 2: Production
FROM nginx:alpine

# Copy built application from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
