# safedeflate
SafeDeflate - compression without leaking secrets

Abstract: CRIME and BREACH attacks on TLS/SSL leverage the fact that compression ratio is not hidden by encryption to recover content of secrets. We introduce SafeDeflate---a modification of standard Deflate algorithm which compression ratio does not leak information about secret tokens. The modification is compatible with existing Deflate and gzip decompressors. We introduce a model in which attacker can obtain ciphertexts of arbitrary compressed plaintext containing secret values. Then we prove that SafeDeflate is secure in this model.

full text: https://users.atomshare.net/~zlmch/compress.pdf
