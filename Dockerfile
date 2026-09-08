FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates git && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir hermes-agent
COPY memory-export.md /root/.hermes/MIGRATION.md
WORKDIR /root/.hermes
ENV HERMES_HOME=/root/.hermes
ENV TELEGRAM_BOT_TOKEN=8558350804:AAHR8EiXr9jbfCzgnxSHmDW2yFjzTUprjRk
ENV TELEGRAM_ALLOWED_USERS=7853534873
ENV GATEWAY_DM_POLICY=open
EXPOSE 8377
CMD ["hermes", "gateway", "run"]
# Build 1788897170
# rebuild 1788899708
