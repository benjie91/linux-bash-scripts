#!/bin/bash
# Download of fedora packages from internet connected environment
echo "Package = $1"
DOWNLOADDIR=~/Downloads/Packages
ZIPDIR=~/Downloads
sudo rm "$ZIPDIR/Packages.zip"
mkdir -p $DOWNLOADDIR
sudo dnf download --resolve --arch x86_64 --arch noarch --downloaddir $DOWNLOADDIR $1
echo "Zipping files for transfer to disconencted environment"
zip -j "$ZIPDIR/Packages.zip" $DOWNLOADDIR/*
echo "CHECKSUM: $(cksum "$ZIPDIR/Packages.zip")"
sudo rm -rf $DOWNLOADDIR
xdg-open $ZIPDIR
