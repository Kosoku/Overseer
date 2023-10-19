#!/bin/sh

PLIST_BUDDY_PATH="/usr/libexec/PlistBuddy"
KEY=$1
VALUE=$2
INFO_PLIST=$3

if [ -z $KEY ]
then
    echo "First argument (info plist key to set) is empty"
    exit 1
fi

if [ -z $VALUE ]
then
    echo "Second argument (new value for info plist key) is empty"
    exit 1
fi

if [ -z $INFO_PLIST ]
then
    echo "Third argument (info plist path) is empty"
    exit 1
fi

$PLIST_BUDDY_PATH -c "Set :$KEY $VALUE" $INFO_PLIST