#!/usr/bin/env bash
set -euo pipefail

BASE="/home/laborant/sed_challenge"
CONFIG="$BASE/config"
LOGS="$BASE/logs"
DATA="$BASE/data"

# 1) Création arborescence
mkdir -p "$CONFIG" "$LOGS" "$DATA"

# 2) Fichiers config
cat >"$CONFIG/network.conf" <<"EOF"
# Network configuration
DEVICE=eth0
BOOTPROTO=dhcp
ONBOOT=no
IPADDR=10.0.1.10
NETMASK=255.255.255.0
GATEWAY=10.0.1.1
EOF

cat >"$CONFIG/hosts.conf" <<"EOF"
# Production Servers
10.0.1.10   app01.example.com app01
10.0.1.11   app02.example.com app02
10.0.1.20   db01.example.com db01
# Staging Servers
10.0.2.10   stg-app01.example.com stg-app01
10.0.2.20   stg-db01.example.com stg-db01
EOF

# 3) Fichiers logs
cat >"$LOGS/system.log" <<"EOF"
2025-12-27 08:00:00 INFO Starting services
2025-12-27 08:02:10 WARNING Low disk space
2025-12-27 08:05:42 ERROR Database connection failed
2025-12-27 08:10:05 INFO Retrying connection
2025-12-27 08:16:20 INFO Connection established
2025-12-27 08:20:55 WARNING High memory usage
2025-12-27 08:25:10 ERROR Cache miss threshold exceeded
2025-12-27 08:30:01 INFO Scaling up
2025-12-27 08:35:30 WARNING Slow response times
2025-12-27 08:40:44 ERROR Worker crash detected
2025-12-27 08:50:12 INFO Recovery complete
EOF

cat >"$LOGS/application.log" <<"EOF"
2025-12-27 09:00:00 DEBUG Starting debug mode
2025-12-27 09:00:01 INFO App init
2025-12-27 09:01:00 DEBUG Checking cache
2025-12-27 09:01:10 WARN Cache warmup delayed
2025-12-27 09:02:00 DEBUG Verbose trace
2025-12-27 09:03:00 ERROR Unhandled exception
2025-12-27 09:04:00 INFO Shutdown sequence
EOF

# 4) Fichiers data
cat >"$DATA/services.txt" <<"EOF"
# Service list (non-comment lines only should be reversed)
nginx:tcp:80
postgres:tcp:5432
redis:tcp:6379
nodeapp:tcp:3000
EOF

cat >"$DATA/users.txt" <<"EOF"
john.doe:x:1001:1001:John Doe,Developer,555-1234:/home/john:/bin/bash
jane.smith:x:1002:1002:Jane Smith,Product,555-5678:/home/jane:/bin/zsh
EOF

cat >"$DATA/services_extra.log" <<"EOF"
tcp 22 ssh
tcp 443 https
tcp 8080 http-alt
EOF

# 5) Nettoyage éventuel des sorties utilisateur
rm -f /home/laborant/q1_network.txt \
      /home/laborant/q2_services.txt \
      /home/laborant/q3_hosts.txt \
      /home/laborant/q4_filtered.txt \
      /home/laborant/q5_clean.log \
      /home/laborant/q6_modified.txt \
      /home/laborant/q7_transformed.txt \
      /home/laborant/q8_backup.txt \
      /home/laborant/q9_reformatted.txt \
      /home/laborant/q10_reversed.txt

echo "SED lab initialized in $BASE"
