#!/bin/sh

PLIST_BUDDY_PATH="/usr/libexec/PlistBuddy"
KEY=$1
INFO_PLIST=$2

if [ -z $KEY ]
then
    echo "First argument (info plist key to print) is empty"
    exit 1
fi

if [ -z $INFO_PLIST ]
then
    echo "Second argument (info plist path) is empty"
    exit 1
fi

$PLIST_BUDDY_PATH -c "Print :$KEY" $INFO_PLIST