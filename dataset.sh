#!/bin/bash
# from Alexa top news sites
set -e

urls="http://web.archive.org/web/20160328010759/https://www.reddit.com/
http://web.archive.org/web/20140611001149/http://www.reddit.com/
http://web.archive.org/web/20140916013437/http://reddit.com
http://web.archive.org/web/20160221005142/http://www.cnn.com/
http://web.archive.org/web/20160616004045/http://www.cnn.com/
http://web.archive.org/web/20160617001555/http://www.nytimes.com/
http://web.archive.org/web/20140423032348/http://www.theguardian.com/
http://web.archive.org/web/20140107002405/http://www.theguardian.com/us
http://web.archive.org/web/20160111013958/http://news.google.com/"

training="http://web.archive.org/web/20140328014133/http://www.reddit.com/
http://web.archive.org/web/20141216001026/http://www.reddit.com/
http://web.archive.org/web/20160322001417/http://www.cnn.com/
http://web.archive.org/web/20160124010645/http://www.cnn.com/
http://web.archive.org/web/20100722010328/http://www.cnn.com/
http://web.archive.org/web/20160111005004/http://www.nytimes.com/
http://web.archive.org/web/20140423032349/http://www.theguardian.com/us
http://web.archive.org/web/20160420021158/http://news.google.com/
http://web.archive.org/web/20160520020442/http://news.google.com/"

for url in $urls; do
    wget -q "$url" -O-
done > data.html


for url in $training; do
    wget -q "$url" -O-
done > training.html
