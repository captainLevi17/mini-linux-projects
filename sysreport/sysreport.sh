#!/bin/bash

BOLDBLUE='\033[1;34m'
BLUE='\033[0;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color


echo -e "${BOLDBLUE} ==========  MLSG's custom system report  ========== ${NC}"
echo -e "${BLUE}Generated on:${NC} $(date)"
echo -e "${GREEN} ======= System Information Report ======= ${NC}"
echo -e "${BLUE}Hostname:${NC} $(hostname)"
echo -e "${BLUE}Kernel:${NC} $(uname -r)"
echo -e "${BLUE}Distribution:${NC} $(grep '^PRETTY_NAME=' /etc/os-release | cut -d '"' -f 2)"
echo -e "${BLUE}Uptime:${NC} $(uptime -p)"
echo -e "${GREEN} =======  Memory Usage ======= ${NC}"
free -h
echo -e "${GREEN} =======  Disk Usage ${NC} ======= ${NC}"
df -h
