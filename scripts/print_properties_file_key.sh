#!/bin/sh

KEY=$1
FILE_PATH=$2

if [ -z $KEY ]
then
    echo "First argument (properties key to print) is empty"
    exit 1
fi

if [ -z $FILE_PATH ]
then
    echo "Second argument (properties path) is empty"
    exit 1
fi

sed -rn "s/^$KEY=([^\n]+)$/\1/p" $FILE_PATH