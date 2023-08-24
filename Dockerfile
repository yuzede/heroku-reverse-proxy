FROM nginx:latest

# Install Node.js
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install laravel-echo-server globally
RUN npm install -g laravel-echo-server

# Copy nginx configuration
COPY nginx.conf.template /nginx.conf.template

# Copy Laravel Echo Server configuration
COPY laravel-echo-server.json /laravel-echo-server.json
COPY extract_env.sh /extract_env.sh
RUN touch .env



# Copy the shell script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80
CMD ["/start.sh"]
