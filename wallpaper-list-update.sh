#!/bin/bash

set -e

for f in /usr/share/backgrounds/aryalinux/*; do
	echo -e "\t<wallpaper deleted=\"false\">" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml
	echo -e "\t\t<name>$(echo $f | rev | cut -d/ -f1 | rev)</name>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml
	echo -e "\t\t<filename>$f</filename>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml;
	echo -e "\t\t<options>zoom</options>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml
	echo -e "\t\t<pcolor>#ffffff</pcolor>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml
	echo -e "\t\t<scolor>#000000</scolor>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml;
	echo -e "\t</wallpaper>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml;
done

sed -i "s@</wallpapers>@@g" /usr/share/gnome-background-properties/gnome-backgrounds.xml
echo "</wallpapers>" >> /usr/share/gnome-background-properties/gnome-backgrounds.xml
