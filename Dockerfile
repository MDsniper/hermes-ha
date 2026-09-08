FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates git && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir hermes-agent
# Copy memory export for the new instance to ingest
COPY memory-export.md /root/.hermes/MIGRATION.md
WORKDIR /root/.hermes
ENV HERMES_HOME=/root/.hermes
EXPOSE 8377
CMD ["hermes", "gateway", "run"]
