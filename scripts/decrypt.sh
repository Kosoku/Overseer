#!/bin/sh

PASSWORD=$1

if [ -z $PASSWORD ]
then
    echo "First argument (openssl password) is empty"
    exit 1
fi

FILES=(`find . -name "*.enc"`)

for FILE in ${FILES[@]}
do
    FILE_DECRYPTED=${FILE%.*}

    openssl enc -d -aes-256-cbc -salt -pbkdf2 -pass pass:$PASSWORD -in $FILE -out $FILE_DECRYPTED
    echo "Decrypted $FILE_DECRYPTED"
done