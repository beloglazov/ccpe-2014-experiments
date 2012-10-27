#!/bin/sh

cat $1 | egrep 'GET.*200' | cut -d ' ' -f 1 | sort -u | wc -l