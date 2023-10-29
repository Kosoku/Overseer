#!/bin/sh

PLATFORM="$1"
PASSWORD=$2

if [ -z $PLATFORM ]
then
    echo "First argument (platform ios/android) is empty"
    exit 1
fi

if [ -z $PASSWORD ]
then
    echo "Second argument (openssl password) is empty"
    exit 1
fi

FILES=""

case $PLATFORM in
    "android") 
        FILES=(`find . -name "*.pepk" -o -name "*.secrets"`)
        ;;
    "ios") 
        FILES=(`find . -name "*.p12" -o -name "*.mobileprovision"`)
        ;;
    *)
        echo "Invalid platform $PLATFORM, use ios or android"
        exit 1
        ;;
esac

for FILE in ${FILES[@]}
do
    FILE_ENCRYPTED="${FILE}.enc"

    openssl enc -aes-256-cbc -salt -pbkdf2 -pass pass:$PASSWORD -in $FILE -out $FILE_ENCRYPTED
    echo "Encrypted $FILE_ENCRYPTED"
done