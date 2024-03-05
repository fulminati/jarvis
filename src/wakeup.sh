#!/usr/bin/env bash

source .env

echo -n "Waking up Jarvis... "
curl -X POST "${JARVIS_WAKEUP_WEBHOOK}"

echo
