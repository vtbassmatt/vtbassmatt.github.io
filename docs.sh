#!/usr/bin/env bash

ROOT=$(cd `dirname $0` && pwd)
SRC_DIR=$ROOT/src
DEST_DIR=$ROOT

NOW=$(date)

# if we don't have any HTML files, don't do anything
shopt -s nullglob
for f in $SRC_DIR/*.html
do
    echo Processing $f
    DEST_FILE=$DEST_DIR/$(basename $f)
    # replace "{{ NOW }}" with the time this script started
    sed "s/{{ NOW }}/$NOW/g" <$f >$DEST_FILE
done