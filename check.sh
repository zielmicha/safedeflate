#!/bin/sh
gzip -9 < data.html > data.html-gzip-9
gzip -9 < training.html > training.html-gzip-9
./build.sh
./buildtable.sh
./main < data.html > data.html-sec
du -k data.html*
