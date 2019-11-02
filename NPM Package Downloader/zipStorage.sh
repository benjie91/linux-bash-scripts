#!/bin/bash
# This script will only zip the files required to be uploaded to own private artifactory server
echo "Verdaccio Path = $1"
if [[ $1 == *"verdaccio"* ]]
then
    echo "Deleting .json files and empty folder in verdaccio storage folder"
    find $1 -name \*.json -type f -delete
    find $1 -type d -empty -print
    # Removing empty folder logic here
    echo "Zipping files for transfer"
    cd $1/storage
    zip -rv "Storage.zip" ./*
    echo -e "CHECKSUM: \e[93m$(cksum Storage.zip)\e[39m"
    mv ./Storage.zip ../Storage.zip
    # Remove storage dir logic here
    rm -rf ./*
    # xdg-open .
else
    echo "Check storage path argument - must end with storage"
fi
