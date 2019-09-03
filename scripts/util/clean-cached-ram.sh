#!/bin/bash

clear

echo "Cleaning cached memory"

sync; echo 1 > /proc/sys/vm/drop_caches
#sync; echo 2 > /proc/sys/vm/drop_caches
#sync; echo 3 > /proc/sys/vm/drop_caches

free -g
