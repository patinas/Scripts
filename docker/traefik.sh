#!/bin/sh

docker network create web

mkdir /etc/traefik -p
tee /etc/traefik/traefik.yml <<EOF
global:
  checkNewVersion: true
  sendAnonymousUsage: false  # true by default

# (Optional) Log information
# ---
# log:
#  level: ERROR  # DEBUG, INFO, WARNING, ERROR, CRITICAL
#   format: common  # common, json, logfmt
#   filePath: /var/log/traefik/traefik.log

# (Optional) Accesslog
# ---
# accesslog:
  # format: common  # common, json, logfmt
  # filePath: /var/log/traefik/access.log

# (Optional) Enable API and Dashboard
# ---
api:
  dashboard: true  # true by default
  insecure: true  # Don't do this in production!

# Entry Points configuration
# ---
entryPoints:
  web:
    address: :80
    # (Optional) Redirect to HTTPS
    # ---
    # http:
    #   redirections:
    #     entryPoint:
    #       to: websecure
    #       scheme: https

  websecure:
    address: :443

# Configure your CertificateResolver here...
# ---
# certificatesResolvers:
#   staging:
#     acme:
#       email: your-email@example.com
#       storage: /etc/traefik/certs/acme.json
#       caServer: "https://acme-staging-v02.api.letsencrypt.org/directory"
#       httpChallenge:
#         entryPoint: web
#
#   production:
#     acme:
#       email: your-email@example.com
#       storage: /etc/traefik/certs/acme.json
#       caServer: "https://acme-v02.api.letsencrypt.org/directory"
#       httpChallenge:
#         entryPoint: web

# (Optional) Overwrite Default Certificates
# tls:
#   stores:
#     default:
#       defaultCertificate:
#         certFile: /etc/traefik/certs/cert.pem
#         keyFile: /etc/traefik/certs/cert-key.pem
# (Optional) Disable TLS version 1.0 and 1.1
#   options:
#     default:
#       minVersion: VersionTLS12

providers:
  docker:
    exposedByDefault: false  # Default is true
  file:
    # watch for dynamic configuration changes
    directory: /etc/traefik
    watch: true
EOF



tee /etc/traefik/docker-compose.yml <<EOF
version: '3'

services:
  traefik:
    image: "traefik:v2.5"
    container_name: "traefik"
    ports:
      - "80:80"
      - "443:443"
      # (Optional) Expose Dashboard
      - "8080:8080"  # Don't do this in production!
    volumes:
      - /etc/traefik:/etc/traefik
      - /var/run/docker.sock:/var/run/docker.sock:ro
EOF

cd /etc/traefik/
docker-compose up -d
cd

