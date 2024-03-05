
jarvis_sleep() {
  echo -n "Sleep Jarvis... "
  curl -X POST "${JARVIS_SLEEP_WEBHOOK}"

  echo " Confirming Jarvis is asleep..."
}
