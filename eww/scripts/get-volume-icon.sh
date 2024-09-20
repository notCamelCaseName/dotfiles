vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if grep MUTED <<< "$vol" >/dev/null; then
  echo 
else
  echo 
fi
