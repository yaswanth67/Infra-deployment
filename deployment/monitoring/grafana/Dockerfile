# Use the official Grafana image
FROM grafana/grafana:latest

# Set the user Grafana runs as
USER 472:472

# Copy provisioning files into the container
COPY provisioning /etc/grafana/provisioning

ENV GF_SERVER_ROOT_URL="/grafana"

# Optional: create a directory to match volume mount for persistence
RUN mkdir -p /var/lib/grafana

# Expose Grafana default port
EXPOSE 3000

# Default CMD is already grafana-server, so no need to override
