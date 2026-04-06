#!/bin/bash
vm_stat | awk '
  /Pages active/     { gsub(/\./, "", $NF); a = $NF }
  /Pages wired down/ { gsub(/\./, "", $NF); w = $NF }
  END { printf "%.1fG", (a + w) * 4096 / 1073741824 }
'
