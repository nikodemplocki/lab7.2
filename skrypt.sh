#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if docker exec my_database_container ping -c 1 my_backend_container &> /dev/null; then
    echo -e "${GREEN}Success:${NC} Database can connect to backend."
else
    echo -e "${RED}Failure:${NC} Database cannot connect to backend."
fi

if docker exec my_database_container ping -c 1 my_frontend_container &> /dev/null; then
    echo -e "${RED}Failure:${NC} Database should not connect to frontend."
else
    echo -e "${GREEN}Success:${NC} Database cannot connect to frontend (as expected)."
fi

if docker exec my_frontend_container ping -c 1 my_backend_container &> /dev/null; then
    echo -e "${GREEN}Success:${NC} Frontend can connect to backend."
else
    echo -e "${RED}Failure:${NC} Frontend cannot connect to backend."
fi

if docker exec my_frontend_container ping -c 1 my_database_container &> /dev/null; then
    echo -e "${RED}Failure:${NC} Frontend should not be able to connect to database."
else
    echo -e "${GREEN}Success:${NC} Frontend cannot connect to database (as expected)."
fi
