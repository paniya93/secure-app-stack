# Setup Guide

This document walks through the full setup of the Secure App Stack.

## Task 0 — Prerequisites
- Two VMs: Jump host + App host
- Domain names: demo.example.com, keycloak.example.com
- SSH keypair prepared

## Task 1 — OS Hardening
(steps for updates, sudo user, disable root ssh, history logging, auditd)

## Task 2 — Restrict SSH
(jumphost → app host only)

## Task 3 — Install Apache/PHP/Postgres
(install, create db, demo app)

## Task 4 — Run Keycloak
(containerized, DB config, reverse proxy)

## Task 5 — SSL with Let's Encrypt
(certbot, redirect 80→443)

## Task 6 — Configure Keycloak Realm & Client
(realm: demo, client: demo-app, redirect URI)

## Task 7 — Protect App with OIDC
(Apache mod_auth_openidc, Require valid-user)

## Task 8 — Block TOR
(ipset, firewalld, cron job)

## Task 9 — Final Checks
(app login flow, valid SSL, ssh access, tor block)
