
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
  jarvis_android_device_start &

  sleep 3

  echo "Android Device IP: ${android_device_ip}"
  echo

  #echo "Starting scrcpy terminal over USB..."
  #scrcpy --bit-rate 4M --max-size 1480 && true
}

jarvis_android_device_start() {
  local android_device_ip
  local adb_port

  android_device_ip="${JARVIS_IP}"
  adb_port=5555

  scrcpy --serial "${android_device_ip}:${adb_port}" --bit-rate 4M --max-size 1480 && true
}

jarvis_android_device_setup() {
  local android_device_ip
  local adb_port

  android_device_ip="${JARVIS_IP}"
  adb_port=5555

  adb --serial "${android_device_ip}:${adb_port}" shell locksettings set-disabled true && true
}

jarvis_android_device_visit() {
  local android_device_ip
  local adb_port
  local url

  android_device_ip="${JARVIS_IP}"
  adb_port=5555
  url="$1"

  adb -s "${android_device_ip}:${adb_port}" shell am start -a android.intent.action.VIEW -d "${url}" && true
}

jarvis_android_device_log() {
  local android_device_ip
  local adb_port
  local url

  android_device_ip="${JARVIS_IP}"
  adb_port=5555

  adb -s "${android_device_ip}:${adb_port}" logcat
}

jarvis_android_device_play_sound() {
  local android_device_ip
  local adb_port
  local sound_file

  android_device_ip="${JARVIS_IP}"
  adb_port=5555
  sound_file="$1"

  adb -s "${android_device_ip}:${adb_port}" shell am start -a android.intent.action.VIEW -d "file:///sdcard/Menu/Menu.m3u" -t "audio/mp3"
}

jarvis_android_device_list_files() {
  local android_device_ip
  local adb_port
  local sound_file

  android_device_ip="${JARVIS_IP}"
  adb_port=5555
  sound_file="$1"

  adb -s "${android_device_ip}:${adb_port}" shell 'ls /sdcard/Menu' && true
}