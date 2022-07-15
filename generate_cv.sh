#!/bin/bash

# This file intend to generate a html resume (maybe cn or en),
# then copy it to the blog root/static/cv folder.

PYTHON_EXE=$(which python)
TARGET_DIR="${HOME}/Documents/BlogHugo/static/"

notify()
{
    echo "--- $1"
}

gen_resume()
{
    md_file=$1
    $PYTHON_EXE resume.py $md_file --no-pdf
    basename=${md_file%.md}
    notify "copy $basename.html to $TARGET_DIR"
    cp ${basename}.html $TARGET_DIR
    notify "done"
}

if [ -z $1 ]; then
    notify "Usage: $0 <resume.md>"
    exit 1
fi

gen_resume $1
