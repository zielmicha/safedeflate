#!/bin/bash
gzip -9 < data.html > data.html-gzip-9
gzip -9 < training.html > training.html-gzip-9

testcase() {
    echo testcase NODICT="$NODICT" NOALPHABET="$NOALPHABET" SECURITYPARAM="$SECURITYPARAM"
    env NODICT="$NODICT" NOALPHABET="$NOALPHABET" SECURITYPARAM="$SECURITYPARAM" ./buildtable.sh
    ./build.sh
    ./main < data.html > data.html-$1
}

# export KGRAMS=1 # kgrams.py is better dictionary generator

export SECURITYPARAM=10

testcase best
NODICT=1 testcase nodict
NOALPHABET=1 testcase bin
NOALPHABET=1 SECURITYPARAM=5 testcase bin5
NODICT=1 NOALPHABET=1 testcase huff

du -k data.html*
