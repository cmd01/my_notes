#!/bin/bash
read -n 1 -p "Ты уверен, что хочешь запустить это (y/[a]): " AMSURE 
[ "$AMSURE" = "y" ] || exit
echo "" 1>&2

echo "запустил"
