import pyflate, zlib, sys

f = open(sys.argv[1], 'rb')
f.read(2)
pyflate.gzip_main(f)
