#!/usr/bin/env nix-shell
#!nix-shell -i sh shell.nix

echo "{"
leading=""
while read line; do
    sighash=$(cast sig "$line" 2> /dev/null)
    if [[ $? == 1 ]]; then
        continue # Couldn't parse, skip
    fi
    echo -e -n "${leading}\t\"${sighash}\": \"${line#function }\""
    leading=",\n"
done
echo ""
echo "}"
