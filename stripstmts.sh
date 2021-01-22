#!/bin/bash

PAGES=`pdfinfo $1.pdf | grep Pages | cut -d: -f 2`

RS=$PAGES
TS=`echo $PAGES - 1 | bc`
LAST=`echo $PAGES - 2 | bc`

pdfseparate -f $RS -l $RS $1.pdf research.pdf
pdfseparate -f $TS -l $TS $1.pdf teaching.pdf
pdfjam -o $1_ns.pdf -- $1.pdf "1-$LAST" 
