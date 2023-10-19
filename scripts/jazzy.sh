#!/bin/sh

MODULE=$1
INFO_PLIST=$2

if [ -z $MODULE ]
then
    echo "First argument (module name) is empty"
    exit 1
fi

if [ -z $INFO_PLIST ]
then
    echo "Second argument (info plist path) is empty"
    exit 1
fi

bundle exec jazzy --clean --author Kosoku --author_url http://kosoku.com/ --source-host github --source-host-url https://github.com/Kosoku/$MODULE --module-version $(./Overseer/scripts/print_info_plist_key.sh "CFBundleShortVersionString" $INFO_PLIST) --build-tool-arguments -scheme,$MODULE --module $MODULE --root-url https://kosoku.github.io/$MODULE/ --output docs --theme fullwidth --skip-undocumented