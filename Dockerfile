# Use Node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app
RUN npm run build

# Install a simple static server
RUN npm install -g serve

# Set the command to run the app
CMD ["serve", "-s", "build", "-l", "3000"]