#!/bin/bash

quit(){
	clear
	echo "Quiting usbmount. Bye!"
	exit 0
}

mountUsb(){
	clear
	mkdir -p /media/usb
	fdisk -l | grep dev/sd
	echo -e "Please select desired device to mount:\c"
	read usbDevice
	mount /dev/${usbDevice} /media/usb
}

unmountUsb(){
	clear
	umount /media/usb
}

clear
while :
do
	echo "----------------------------------"
	echo "    welcome to use usb manager    "
	echo "----------------------------------"
	echo "     1-MOUNT USB                  "
	echo "     2-UNMOUNT USB                "
	echo "     0-EXIT                       "
	echo "----------------------------------"
	echo -e "Please enter your choice (0--2):\c"
	
read CHOICE
case $CHOICE in
	1)mountUsb ;;
	2)unmountUsb ;;
	0)quit ;;
	*)echo "Invalid choice."
clear ;;
esac
done
