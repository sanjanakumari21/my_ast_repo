# Use AST Base image
FROM checkmarx/ast-cli:2.3.36@sha256:bb2cc2dd3f24bf19f8a02aae8d7d1dd00baf3e8b...
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh

# --- Debug Section: Check environment before entrypoint runs ---
RUN echo "=== Debug Info: Inside Docker build ===" && \
    pwd && \
    ls -la /app && \
    echo "PATH: $PATH" && \
    which ScaResolver || echo "ScaResolver not found in PATH" && \
    echo "=== End Debug Info ==="
# ------------------------------------------------------------

HEALTHCHECK NON