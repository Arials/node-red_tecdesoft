# Dockerfile for Node-RED - pulls latest master code from git

# Use the node.js v14.16.1-alpine3.13
FROM node:14.16.1-alpine3.13


RUN mkdir -p /root/.node-red
WORKDIR /root/.node-red
 
# download latest stable node-red
RUN npm install -g --unsafe-perm node-red@1.2.7

# add modules
RUN npm install node-red-contrib-kafka-manager
#RUN npm install -g --save node-red/node-red-dashboard node-red-contrib-web-worldmap node-red-node-random

# use external storage for the user directory
VOLUME /root/.node-red

# expose port
EXPOSE 1880
 
# Set the default command to execute
# when creating a new container
CMD ["node-red"]


# Comandos para crear la imagen del docker, estando en la ruta de este archivo
# docker build -t adriel/node-red:cool .
# docker run -d -p 1880:1880 adriel/node-red:cool
