#!/bin/bash
#Portable DEB build script; DDCToolbox binary needs to be in working directory
version=1.4
revision=0
debname="ddc-toolbox_"$version-$revision
mkdir $debname
mkdir $debname"/DEBIAN"
mkdir -p $debname"/usr/local/bin"
mkdir -p $debname"/usr/share/applications"
mkdir -p $debname"/usr/share/pixmaps"
cp "DDCToolbox" $debname"/usr/local/bin/ddc-toolbox"

wget -O ddc-toolbox.png "https://raw.githubusercontent.com/ThePBone/DDCToolbox/master/img/icon.png" -q --show-progress
mv ddc-toolbox.png $debname"/usr/share/pixmaps"

cat <<EOT >> $debname"/usr/share/applications/ddc-toolbox.desktop"
[Desktop Entry]
Name=DDC Toolbox
GenericName=DDC Editor
Comment=Create and edit DDCs on Linux
Keywords=editor
Categories=AudioVideo;Audio;Editor
Exec=ddc-toolbox
Icon=/usr/share/pixmaps/ddc-toolbox.png
StartupNotify=false
Terminal=false
Type=Application
EOT

cat <<EOT >> $debname"/DEBIAN/control"
Package: ddc-toolbox
Version: $version-$revision
Section: sound
Priority: optional
Architecture: amd64
Depends: libqt5core5a (>= 5.9.5), libqt5network5 (>= 5.9.5), libqt5widgets5 (>= 5.9.5), libqt5gui5 (>= 5.9.5), libqt5core5a (>= 5.9.5), libgl1-mesa-dev
Maintainer: ThePBone <thebone.main@gmail.com>
Description: Create and edit DDCs on Linux
Homepage: https://github.com/ThePBone/DDCToolbox
EOT

dpkg-deb --build $debname
