#!/bin/bash

tmpdir=$(mktemp -d)
bgfile="/usr/share/gnome-background-properties/gnome-backgrounds.xml"

function list_wall()
{
	name=`echo $1 | rev | cut -d/ -f1 | rev | sed "s/.$2//g"`
cat >> $tmpdir/gnome-backgrounds.xml <<EOF
	<wallpaper deleted="false">
		<name>$name</name>
		<filename>$3/$name.$2</filename>
		<options>zoom</options>
		<pcolor>#ffffff</pcolor>
		<scolor>#000000</scolor>
	</wallpaper>
EOF
}

touch $tmpdir/gnome-backgrounds.xml
cat > $tmpdir/gnome-backgrounds.xml <<"EOF"
<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
EOF
dirname="/usr/share/backgrounds/aryalinux"
for ext in $(echo "jpeg"); do
	for img in $(find $dirname -name *.$ext); do
		list_wall $img $ext $dirname
	done
done
dirname="/usr/share/backgrounds/gnome"
for ext in $(echo "jpg"); do
	for img in $(find $dirname -name *.$ext); do
		list_wall $img $ext $dirname
	done
done
cat >> $tmpdir/gnome-backgrounds.xml <<"EOF"
echo '</wallpaper>'
EOF

sudo mv $bgfile $bgfile.old
sudo mv $tmpdir/gnome-backgrounds.xml $bgfile

