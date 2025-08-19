#!/usr/bin/env bash
set -euo pipefail

LOGFILE="/var/log/tor-blocklist.log"
TMP=$(mktemp)

{
  echo "[$(date '+%F %T')] Starting TOR blocklist refresh..."

  if curl -s https://check.torproject.org/exit-addresses | awk '/^ExitAddress/ {print $2}' | sort -u > "$TMP"; then
    COUNT=$(wc -l < "$TMP")
    echo "[$(date '+%F %T')] Downloaded $COUNT TOR exit node IPs."
  else
    echo "[$(date '+%F %T')] ERROR: Failed to fetch TOR exit addresses!"
    rm -f "$TMP"
    exit 1
  fi

  sudo firewall-cmd --permanent --delete-ipset=tor || true
  sudo firewall-cmd --permanent --new-ipset=tor --type=hash:ip

  while read -r ip; do
    [[ -n "$ip" ]] && sudo firewall-cmd --permanent --ipset=tor --add-entry="$ip"
  done < "$TMP"

  sudo firewall-cmd --reload
  rm -f "$TMP"

  echo "[$(date '+%F %T')] Refreshed TOR blocklist successfully."
} >> "$LOGFILE" 2>&1
