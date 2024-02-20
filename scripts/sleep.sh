#!/usr/bin/env bash

source .env

echo -n "Sleep Jarvis... "
curl -X POST "${JARVIS_SLEEP_WEBHOOK}"

echo
