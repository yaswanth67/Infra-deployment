FROM nginx:latest

# Create directories for sites
RUN mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled

# Copy configs
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/default

# Enable site
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default