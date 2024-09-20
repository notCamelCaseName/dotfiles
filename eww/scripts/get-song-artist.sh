while true; do
  if !(playerctl metadata artist); then
    echo "is playing"
  fi
  sleep 5
done 2>/dev/null
