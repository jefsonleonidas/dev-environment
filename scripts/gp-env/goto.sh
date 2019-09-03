#!/bin/bash

clear

WS_GP=/home/jefson/Furukawa/dev/workspace-gp/profilemanager/backend

GoToGP() {
cd /home/jefson/Furukawa/dev/workspace-gp/profilemanager/backend
}

case $1 in
gp) GoToGP ;;
*) echo "Invalid option." ;;
esac