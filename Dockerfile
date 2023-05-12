# Use the NGINX base image
FROM nginx

# Copy the NGINX configuration file
#COPY nginx.conf /etc/nginx/nginx.conf

# Expose the necessary ports
EXPOSE 80

# Set the working directory to /app
WORKDIR /app

# Copy the Laravel Echo Server configuration
COPY . .

# Install Node.js and dependencies
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN apt-get update && apt-get install -y supervisor

# Install Laravel Echo Server globally
RUN npm install -g laravel-echo-server

# Run the Laravel Echo Server
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

# Start Supervisor to manage processes
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisor.conf"]
