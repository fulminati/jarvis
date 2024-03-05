
#ANDROID_DEVICE_IP=192.168.144.7
#ADB_PORT=5555

jarvis_android_device_open() {
  local android_device_ip
  local adb_port

  android_device_ip="${JARVIS_IP}"
  adb_port=5555

  echo "Starting adb server..."
  adb tcpip "${adb_port}" && true
  adb connect "${android_device_ip}:${adb_port}" && true
  adb shell locksettings set-disabled true && true

  echo "Starting scrcpy terminal over WiFi..."
  scrcpy --serial "${android_device_ip}:${adb_port}" --bit-rate 4M --max-size 1480 && true

  #echo "Starting scrcpy terminal over USB..."
  #scrcpy --bit-rate 4M --max-size 1480 && true
}

jarvis_android_device_setup() {
  local android_device_ip
  local adb_port

  android_device_ip="${JARVIS_IP}"
  adb_port=5555

  adb --serial "${android_device_ip}:${adb_port}" shell locksettings set-disabled true && true
}
