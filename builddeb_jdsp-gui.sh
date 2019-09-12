#!/bin/bash
#Portable DEB build script; jdsp-gui binary needs to be in working directory
version=0.1
revision=0
debname="jdsp4linux-gui_"$version-$revision
mkdir $debname
mkdir $debname"/DEBIAN"
mkdir -p $debname"/usr/local/bin"
mkdir -p $debname"/usr/share/applications"
mkdir -p $debname"/usr/share/pixmaps"
cp "jdsp-gui" $debname"/usr/local/bin/jdsp-gui"

wget -O jdsp-gui.png "https://raw.githubusercontent.com/ThePBone/JDSP4Linux-GUI/master/icons/icon.png" -q --show-progress
mv jdsp-gui.png $debname"/usr/share/pixmaps"

cat <<EOT >> $debname"/usr/share/applications/jdsp-gui.desktop"
[Desktop Entry]
Name=JDSP4Linux
GenericName=Equalizer
Comment=User Interface for JDSP4Linux
Keywords=equalizer
Categories=AudioVideo;Audio;
Exec=jdsp-gui
Icon=/usr/share/pixmaps/jdsp-gui.png
StartupNotify=false
Terminal=false
Type=Application
EOT

cat <<EOT >> $debname"/DEBIAN/control"
Package: jdsp4linux-gui
Version: $version-$revision
Section: sound
Priority: optional
Architecture: amd64
Depends: libqt5core5a (>= 5.9.5), libqt5widgets5 (>= 5.9.5), libqt5multimedia5 (>= 5.9.5), libqt5gui5 (>= 5.9.5), libqt5core5a (>= 5.9.5), libqt5xml5 (>= 5.9.5), libgl1-mesa-dev,git
Maintainer: ThePBone <thebone.main@gmail.com>
Description: Graphical User Interface for JDSP4Linux
Homepage: https://github.com/ThePBone/JDSP4Linux-GUI
EOT

dpkg-deb --build $debname