#!/bin/bash
ps -A -o %cpu | awk -v cores="$(sysctl -n hw.logicalcpu)" '{s+=$1} END {printf "%.1f%%", s/cores}'
