# Use the official Nginx image based on Alpine Linux (a lightweight version of Nginx)
FROM nginx:alpine

# Copy the 'index.html' file from the local directory to the Nginx HTML directory in the container
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to make the application accessible on this port
EXPOSE 80
