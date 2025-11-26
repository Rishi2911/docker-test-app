FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies first (better layer caching)
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# App config
ENV PORT=5050
ENV MONGO_DB_USERNAME=admin
ENV MONGO_DB_PASSWORD=qwerty

# Document the port
EXPOSE 5050

# Start the server
CMD ["node", "server.js"]
