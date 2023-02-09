EIP_DIR=EIPs/EIPS/

all: sighashes.json

erc-eips.txt:
	grep -r -l -i "category: ERC" $(EIP_DIR) > $@

eip-functions.txt: EIPs $(EIP_DIR)/*
	grep -r -o -h -E "^[\s\`]*function \w*\(.*)" $(EIP_DIR) | grep -v ")*internal" | cut -d '`' -f2- > $@

sighashes.json: eip-functions.txt
	cat $< | ./buildindex.sh | jq > $@

EIPs:

update-submodules:
	git submodule update --init --recursive --remote
