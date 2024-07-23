# Use a Node.js image that meets the requirements for npm@10.8.2
FROM node:20-alpine

# Install git and python3
RUN apk add --no-cache git python3 make g++

# Clone the repository
RUN git clone https://github.com/themzysparks/Sparks-WhatsAppMd-V1 /root/Sparks

# Clear npm cache and remove node_modules directories
RUN npm cache clean --force
RUN rm -rf /root/Sparks/node_modules

# Update npm to the latest version
RUN npm install -g npm@10.8.2

# Set the working directory
WORKDIR /root/Sparks

# Install dependencies
RUN npm install

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
