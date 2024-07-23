# FROM quay.io/sampandey001/secktor

# Use a Node.js image that meets the requirements for npm@10.8.2
FROM node:20-alpine

RUN git clone https://github.com/themzysparks/Sparks-WhatsAppMd-V1 /root/Sparks

# Clear npm cache and remove node_modules directories
RUN npm cache clean --force
RUN rm -rf /root/Sparks/node_modules

# Update npm to the latest version
RUN npm install -g npm@10.8.2

# Install dependencies
WORKDIR /root/Sparks
RUN npm install

# Add additional Steps To Run...
EXPOSE 3000
CMD ["npm","start" ]
