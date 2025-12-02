# Use the official Loki image as base
FROM grafana/loki:2.9.0

# Copy local config into the container
COPY local-config.yaml /etc/loki/local-config.yaml

# Optional: create a directory to match volume mount
RUN mkdir -p /tmp/loki
RUN mkdir -p /tmp/loki/chunks
RUN mkdir -p /tmp/loki/rules

# Expose Loki port
EXPOSE 3100

# Set default command to use the config
CMD ["-config.file=/etc/loki/local-config.yaml"]
