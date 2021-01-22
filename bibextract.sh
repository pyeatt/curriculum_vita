#!/bin/bash


PUBS=~/bibliography/LarryPubs


KEY="@Article{"
echo "\begin{citations}{Refereed Journal Articles}{$PUBS}" > journals.tex
for i in `grep @ $PUBS.bib | grep $KEY | sed -e "s/$KEY//g" -e "s/,//g"` ; do
    echo "\nocite{$i}" >> journals.tex
done
echo "\end{citations}"  >> journals.tex

KEY="@InProceedings{"
echo "\begin{citations}{Refereed Conference Papers}{$PUBS}" > conferences.tex
for i in `grep @ $PUBS.bib | grep $KEY | sed -e "s/$KEY//g" -e "s/,//g"` ; do
    echo "\nocite{$i}" >> conferences.tex
done
echo "\end{citations}"  >> conferences.tex

PUBS=~/bibliography/LarryUnref
KEY="@InProceedings{"
echo "\begin{citations}{Unrefereed Unrefereed Symposia \& Workshops}{$PUBS}" > symposia.tex
for i in `grep @ $PUBS.bib | grep $KEY | sed -e "s/$KEY//g" -e "s/,//g"` ; do
    echo "\nocite{$i}" >> symposia.tex
done
echo "\end{citations}"  >> symposia.tex

