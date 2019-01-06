#!/bin/bash

LINK="https://raw.githubusercontent.com/koliberr136a1/rpidownloader/master/download.list"
FOLDER=$(pwd)"/flash"
DEVICE="/dev/sda1"
PASSWORD=""

# install requirements
sudo apt install aria2 <<EOF
$PASSWORD
EOF

# init download folder
mkdir $FOLDER
sudo mount $DEVICE $FOLDER

# start download
for LINE in $(wget -O- -q $LINK);
do
	aria2c --dir=$FOLDER $LINE
done

# uninit download folder
sudo umount $DEVICE
rmdir $FOLDER
