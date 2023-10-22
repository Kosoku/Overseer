#!/bin/sh

PASSWORD=$1

if [ -z $PASSWORD ]
then
    echo "First argument (openssl password) is empty"
    exit 1
fi

FILES=(`find . -name "*.p12" -o -name "*.mobileprovision"`)

for FILE in ${FILES[@]}
do
    FILE_ENCRYPTED="${FILE}.enc"

    openssl enc -aes-256-cbc -salt -pass pass:$PASSWORD -in $FILE -out $FILE_ENCRYPTED
    echo "Encrypted $FILE_ENCRYPTED"
done