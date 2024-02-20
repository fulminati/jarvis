#!/bin/bash

adb --serial "${ANDROID_DEVICE_IP}:${ADB_PORT}" shell locksettings set-disabled true && true

