#!/bin/sh

KEY=$1
VALUE=$2
FILE_PATH=$3

if [ -z $KEY ]
then
    echo "First argument (properties key to set) is empty"
    exit 1
fi

if [ -z $VALUE ]
then
    echo "Second argument (new value for properties key) is empty"
    exit 1
fi

if [ -z $FILE_PATH ]
then
    echo "Third argument (properties path) is empty"
    exit 1
fi

sed -i "" -r "s/^[#]*\s*$KEY=.*/$KEY=$VALUE/" $FILE_PATH