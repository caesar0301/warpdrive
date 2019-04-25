#!/bin/bash

sudo grub2-mkconfig > /dev/null 

# If windows apprears in the list, run following commands
sudo cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.old
sudo grub2-mkconfig -o /boot/grub2/grub.cfg 
