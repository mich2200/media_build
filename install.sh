#!/bin/bash
./patch-kernel.sh
make distclean
# Enable some staging drivers
make stagingconfig
echo "V4L drivers building..."
make -j5
echo "V4L drivers installing..."
#sudo rm -rf /lib/modules/$(uname -r)/kernel/drivers/media
sudo find /lib/modules/$(uname -r)/kernel/drivers/media/*  | grep -v cec | grep -v rc | xargs rm -rf
sudo rm -rf /lib/modules/$(uname -r)/kernel/drivers/staging/media
sudo rm -rf /lib/modules/$(uname -r)/kernel/drivers/linux
sudo rm -rf /lib/modules/$(uname -r)/extra
sudo make install
echo "V4L drivers installation done"
echo "You need to reboot..."

