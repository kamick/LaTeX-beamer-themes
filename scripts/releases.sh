#!/bin/bash

rm -rf release
mkdir release

cd ../GSCOP
zip -9 gscop-theme.zip *.{pdf,sty}
mv gscop-theme.zip ../scripts/release
cd -

cd ../GSCOP-exemples
zip -9 gscop-theme-exemples.zip *.{tex,pdf,sty} Img/*
mv gscop-theme-exemples.zip ../scripts/release
cd -

cd ../GI
zip -9 gi-theme.zip *.{pdf,sty}
mv gi-theme.zip ../scripts/release
cd -

cd ../GI-exemples
zip -9 gi-theme-exemples.zip *.{tex,pdf,sty} Img/*
mv gi-theme-exemples.zip ../scripts/release
cd -


cp ../GI-exemples/00format-gi.pdf release/
cp ../GSCOP-exemples/00format-gscop.pdf release/
