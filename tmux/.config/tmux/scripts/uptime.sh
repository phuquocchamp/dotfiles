#!/bin/bash
e=$(( $(date +%s) - $1 ))
(( e < 0 )) && e=0
d=$(( e / 86400 ))
h=$(( (e % 86400) / 3600 ))
m=$(( (e % 3600) / 60 ))
s=$(( e % 60 ))

if   (( d > 0 )); then printf "%dd %dh %02dm"    $d $h $m
elif (( h > 0 )); then printf "%dh %02dm %02ds"  $h $m $s
elif (( m > 0 )); then printf "%dm %02ds"         $m $s
else                   printf "%ds"               $s
fi
