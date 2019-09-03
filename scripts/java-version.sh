#!/bin/bash

clear

java -version 2> jv.txt

JAVA_VERSION=`head -n 1 jv.txt`

echo $JAVA_VERSION > jv.txt

JAVA_VERSION=`cut -c 14- jv.txt`

echo $JAVA_VERSION > jv.txt

tr -d '\"' <jv.txt> java-version.txt

rm -rf jv.txt

JAVA_VERSION=`cat java-version.txt`

echo $JAVA_VERSION

rm -rf java-version.txt
