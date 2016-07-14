#!/bin/bash
echo "package secflate

var dictionary = []string {" > src/secflate/tables.go

if [ "$NODICT" = "1" ]; then
    echo '"ooYe9koo9eh5quae",' >>src/secflate/tables.go
else
    if [ "$KGRAMS" = "1" ]; then
        python kgrams.py < training.html >> src/secflate/tables.go
    else
        HEX=1 python pyflate.py training.html-gzip-9 | python kgrams2.py >> src/secflate/tables.go
    fi
fi
echo "}
var restrictedAlphabet = " >> src/secflate/tables.go
if [ "$NOALPHABET" = "1" ]; then
    echo false >> src/secflate/tables.go
else
    echo true >> src/secflate/tables.go
fi

