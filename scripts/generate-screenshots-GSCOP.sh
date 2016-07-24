#!/bin/bash
## fichier auxiliaire pour générer les images de l'annexe de 00format-gscop

SRC=../GSCOP-exemples
DST=Img/  # relatif à $SRC

IN=00format-gscop.tex
OUT=tmp.tex

N=0
cd $SRC

## normal aspectratio
for OPTIONS in \
    "none" \
	"plain" \
	"simple" \
	"fancy" \
	"plain,colorstyle=fancy" \
	"fancy,colorstyle=simple,progressbar=yes,framecount=plain" \
	"simple,headline=none,footline=plain,itemshape=square" \
	"none,progressbar=yes,colorstyle=fancy"
do
    N=$[ N + 1 ]
    echo -n "=== $N: $OPTIONS"
    test -f zz$N.jpg && echo "*" && continue

    cat $IN | perl -pe "s/usetheme.*/usetheme\[$OPTIONS]{GSCOP}/" > $OUT

    echo -n "." ; pdflatex -interaction nonstopmode $OUT >/dev/null
    echo -n "." ; pdflatex -interaction nonstopmode $OUT >/dev/null

    PAGE=`grep 'Divers' ${OUT%tex}aux | grep 'slideentry' | grep '{1}' | perl -pe 's/.*{([0-9]+)\/[0-9]+}.*/\$1/'`
    echo "$OPTIONS" | grep "^fancy" >/dev/null && PAGE=$[ PAGE + 1 ]
    echo -n "($PAGE)"
    pdftk ${OUT%tex}pdf cat $PAGE output zz$N.pdf

    echo -n "."
    convert zz$N.pdf -resize 500x500 zz$N.jpg

    echo "."
    rm -f ${OUT%.tex}.* zz*.pdf
    mv zz*.jpg $DST
done


## different aspectratio
for OPTIONS in \
    "none, progressbar=yes" \
	"plain, progressbar=yes" \
	"simple, progressbar=yes" \
	"fancy, progressbar=yes"
do
    for RATIO in 1610 169 149 141 54 43 32
    do
	N=$[ N + 1 ]
	echo -n "=== $N: $OPTIONS / $RATIO"
	test -f zz$N.jpg && echo "*" && continue
	
	cat $IN \
	    | perl -pe "s/usetheme.*/usetheme[$OPTIONS]{GSCOP}/" \
	    | perl -pe "s/documentclass.*/documentclass[aspectratio=$RATIO]{beamer}/" \
		   > $OUT
	
	echo -n "." ; pdflatex -interaction nonstopmode $OUT >/dev/null
	echo -n "." ; pdflatex -interaction nonstopmode $OUT >/dev/null
	
	PAGE=`grep 'Divers' ${OUT%tex}aux | grep 'slideentry' | grep '{1}' | perl -pe 's/.*{([0-9]+)\/[0-9]+}.*/\$1/'`
	echo "$OPTIONS" | grep "^fancy" >/dev/null && PAGE=$[ PAGE + 1 ]
	echo -n "($PAGE)"
	pdftk ${OUT%tex}pdf cat $PAGE output zz$N.pdf
	
	echo -n "."
	convert zz$N.pdf -resize 500x500 zz$N.jpg
	
	echo "."
	rm -f ${OUT%.tex}.* zz*.pdf
	mv zz*.jpg $DST
    done
done


cd -

