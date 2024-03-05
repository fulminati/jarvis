
module android_device
module sleep
module wakeup

main() {
  echo "Hello World!"

  local env_file

  if [ -f .env ]; then
    env_file="$PWD/.env"
  else
    env_file="$HOME/.jarvis"
  fi

  # shellcheck disable=SC1090
  source "$env_file"

  case "$1" in
    "wakeup")
      lanspeed "$2"
      ;;
    "sleep")
      settings-daemon
      ;;
    "open-android-device")
      linepush "$2"
      ;;
    *)
      echo "Unknown command: $1"
      ;;
  esac

}
