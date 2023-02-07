#!/usr/bin/env nix-shell
#!nix-shell -i python -p python3Packages.pysha3
import sha3
print("0x" + sha3.keccak_256(input().encode('utf8')).hexdigest()[:8])
