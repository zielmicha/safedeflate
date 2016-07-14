import sys, json, collections, string, os

whole = collections.Counter()
prefsuf = collections.Counter()

tlen = int(os.environ.get('SECURITYPARAM', 10))

ok_chars = string.ascii_lowercase + string.ascii_uppercase + string.digits

for line in sys.stdin:
    if not line.startswith('fragment '):
        continue

    token = line.split(None, 1)[1].strip().decode('hex')

    if token[0] in ok_chars:
        continue

    if token[-1] in ok_chars:
        continue

    #print('HELLOOO', repr(token))

    if len(token) == tlen:
        whole[token] += 1
    if len(token) > tlen:
        prefsuf[token[:tlen]] += 1
        prefsuf[token[-tlen:]] += 1

#print(prefsuf.most_common(10))
items = prefsuf.most_common(400) + whole.most_common(200)
items = set([ k for k, v in items ])

print ', '.join([ '"%s"' % (k.encode('string_escape').replace('"', '\\"').replace('\\\'', '\'')) for k in items ]) + ','
