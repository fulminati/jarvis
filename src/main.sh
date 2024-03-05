
module android_device
module sleep
module wakeup

main() {
  echo "Hello World!"

  local env_file

  if [ -f .jarvis ]; then
    env_file="$PWD/.jarvis"
  else
    env_file="$HOME/.jarvis"
  fi

  echo "Loading environment variables from $env_file"

  # shellcheck disable=SC1090
  source "$env_file"

  case "$1" in
    wakeup)
      jarvis_wakeup "$2"
      ;;
    sleep)
      jarvis_sleep "$2"
      ;;
    open-android-device)
      jarvis_android_device_open "$2"
      ;;
    *)
      echo "Unknown command: $1"
      ;;
  esac
}
