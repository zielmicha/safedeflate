import sys
import os
import collections

data = sys.stdin.read()
grams = collections.defaultdict(int)
k = int(os.environ.get('SECURITYPARAM', 10))
for i in range(len(data) - k):
    grams[data[i:i+k]] += 1

items = list(grams.items())
items.sort(key=lambda i: -i[1])
print ', '.join([ '"%s"' % (k.encode('string_escape').replace('"', '\\"').replace('\\\'', '\'')) for k, v in items[:400] ]) + ','
