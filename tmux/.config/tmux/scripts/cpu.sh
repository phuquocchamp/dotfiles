#!/bin/bash
cores=$(sysctl -n hw.logicalcpu)
ps -A -o %cpu | awk -v cores="$cores" '{s+=$1} END {printf "%.1f%%", s/cores}'
