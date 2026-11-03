#!/bin/bash

BLUE='\033[0;34m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${BLUE}=============================================================="
echo  "============= Welcome to MLSG's system report  ============="
echo -e "==============================================================${NC}"

echo -e "${GREEN}Generated on:${NC} $(date)"
echo -e "${BLUE} ======= System Information Report ======= ${NC}"
echo -e "${GREEN}Hostname:${NC} $(hostname)"
echo -e "${GREEN}Kernel:${NC} $(uname -r)"
echo -e "${GREEN}Distribution:${NC} $(grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f 2)"
echo -e "${GREEN}Uptime:${NC} $(uptime -p)"
echo -e "${BLUE} =======  Memory Usage ======= ${NC}"
free -h
echo -e "${BLUE} =======  Disk Usage  ======= ${NC}"
df -h
