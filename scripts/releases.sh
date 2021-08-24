#!/bin/bash

rm -rf release
mkdir release


# G-SCOP
cd ../GSCOP
zip -9 gscop-theme.zip *.{pdf,sty}
mv gscop-theme.zip ../scripts/release
cd -

cd ../GSCOP-exemples
zip -9 gscop-theme-exemples.zip *.{tex,pdf,sty} Img/*
mv gscop-theme-exemples.zip ../scripts/release
cd -

# GI
cd ../GI
zip -9 gi-theme.zip *.{pdf,sty}
mv gi-theme.zip ../scripts/release
cd -

cd ../GI-exemples
zip -9 gi-theme-exemples.zip *.{tex,pdf,sty} Img/*
mv gi-theme-exemples.zip ../scripts/release
cd -

# GI 2020
cd ../GI_v2020
zip -9 gi-theme.zip *.{pdf,sty}
mv gi-theme.zip ../scripts/release/gi2020-theme.zip
cd -

cd ../GI_v2020-exemples
zip -9 gi-theme-exemples.zip *.{tex,pdf,sty} Img/*
mv gi-theme-exemples.zip ../scripts/release/gi2020-theme-exemples.zip
cd -

# GI 2019
cd ../GI_v2019
zip -9 gi-theme.zip *.{pdf,sty}
mv gi-theme.zip ../scripts/release/gi2019-theme.zip
cd -

cd ../GI_v2019-exemples
zip -9 gi-theme-exemples.zip *.{tex,pdf,sty} Img/*
mv gi-theme-exemples.zip ../scripts/release/gi2019-theme-exemples.zip
cd -



cp ../GSCOP-exemples/00format-gscop.pdf release/
cp ../GI-exemples/00format-gi.pdf release/
cp ../GI_v2019-exemples/00format-gi.pdf release/00format-gi2019.pdf
cp ../GI_v2020-exemples/00format-gi.pdf release/00format-gi2020.pdf
