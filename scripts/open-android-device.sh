#!/usr/bin/env bash
set -e

ANDROID_DEVICE_IP=192.168.144.7
ADB_PORT=5555

echo "Starting adb server..."
adb tcpip "${ADB_PORT}" && true
adb connect "${ANDROID_DEVICE_IP}:${ADB_PORT}" && true

echo "Starting scrcpy terminal over WiFi..."
scrcpy --serial "${ANDROID_DEVICE_IP}:${ADB_PORT}" --bit-rate 4M --max-size 1480 && true

#echo "Starting scrcpy terminal over USB..."
#scrcpy --bit-rate 4M --max-size 1480 && true
