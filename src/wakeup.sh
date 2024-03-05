
jarvis_wakeup() {
  echo -n "Waking up Jarvis... "
  curl -X POST "${JARVIS_WAKEUP_WEBHOOK}"

  echo " Confirming Jarvis is awake..."
}
