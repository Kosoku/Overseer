#!/bin/sh

VERSION=$1
PODSPEC=$2

if [ -z $VERSION ]
then
    echo "First argument (podspec version) is empty"
    exit 1
fi

if [ -z $PODSPEC ]
then
    echo "Second argument (podspec path) is empty"
    exit 1
fi

sed -i "" "s/\(s.version = '\).*\('\)/\1$VERSION\2/" $PODSPEC