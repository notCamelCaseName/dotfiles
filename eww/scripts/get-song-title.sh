while true; do
  if !(playerctl metadata title); then
    echo "Nothing"
  fi
  sleep 5
done 2>/dev/null
