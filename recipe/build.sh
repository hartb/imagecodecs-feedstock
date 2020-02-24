#!/usr/bin/env bash

set -ex

OPENJPEG_INCDIR="$PREFIX/include/openjpeg-2.3"
JPGTURBO_INCDIR="$PREFIX/libjpeg-turbo/include"
export CFLAGS="-I$JPGTURBO_INCDIR $CFLAGS -I$OPENJPEG_INCDIR"

SKIPS=""
SKIPS="$SKIPS --skip-jpegxl" # requires brunsli; no conda-forge package
SKIPS="$SKIPS --skip-jpegxr" # await conda-forge jxrlig migration to ppc64le 
SKIPS="$SKIPS --skip-zopfli" # await conda-forge zipfli migration to ppc64le

#python setup.py build_ext $SKIPS
python setup.py build_ext $SKIPS install --single-version-externally-managed --record=record.txt

exit 0
