# Use an official Node.js image as a base
FROM node:18-alpine

# Set working directory to /app
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy package.json and package-lock.json first to install dependencies
COPY app/package*.json ./

# Install dependencies
RUN pnpm install

# Now copy the rest of the app's source code
COPY app /app

# Expose port 3000
EXPOSE 3000

# Start the React development server
CMD ["pnpm", "start"]