#!/bin/bash

set -e

export INSTALL_LANGUAGE=en-US
yes | alps install firefox-bin
yes | alps install xdg-user-dirs plank
yes | alps install aryalinux-wallpapers aryalinux-fonts aryalinux-themes aryalinux-icons
yes | alps install arc-gtk-theme paper-gtk-theme adapta-gtk-theme flat-remix-icons numix-icons aryalinux-gnome-settings

wget https://raw.githubusercontent.com/FluidIdeas/utils/master/wallpaper-list-update.sh -O /sources/udpate-wallpapers.sh
chmod a+x /sources/udpate-wallpapers.sh
/sources/udpate-wallpapers.sh

sudo systemctl disable gdm
sudo systemctl enable lightdm

sudo systemctl disable smbd
sudo systemctl disable nmbd
sudo systemctl disable winbindd

sudo systemctl disable krb5-kadmind.service 
sudo systemctl disable krb5-kdc.service
sudo systemctl disable krb5-kpropd.service

sudo ccache -c
sudo ccache -C
ccache -c
ccache -C

rm -rf ~/.cargo
sudo rm -rf ~/.cargo
