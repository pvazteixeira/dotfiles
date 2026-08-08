#!/usr/bin/env bash
# Mirrors the icon-selection behavior of waybar's built-in temperature
# module (percentage of a critical threshold), so custom/gpu picks from
# the same format-icons array as temperature.
t=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
crit=90
pct=$(( t * 100 / crit ))
(( pct > 100 )) && pct=100
printf '{"text": "%s°C", "percentage": %d, "tooltip": "GPU: %s°C"}\n' "$t" "$pct" "$t"
