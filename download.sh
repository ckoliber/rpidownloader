#!/bin/bash

LINK="https://raw.githubusercontent.com/koliberr136a1/rpidownloader/master/download.list"
FOLDER="/home/koliber/flash"

# init download folder
mkdir $FOLDER
mount /dev/sda1 $FOLDER

# start download
for LINE in $(wget -O- -q $LINK);
do
	echo $LINE
done
