# 1. Base image
FROM node:20-slim

# 2. Set environment variables
ENV NODE_ENV=production

# 3. Set the working directory inside the container
WORKDIR /app

# 4. Copy package.json and package-lock.json into the container
COPY package*.json ./

# 5. Install the application dependencies
RUN npm ci --only=production

# 6. Copy the rest of the application code into the container
COPY . .

# 7. Expose the port the application will run on
EXPOSE 443

# 8. Start the application
CMD ["npm", "start"] 