EIP_DIR=EIPs/EIPS/

all:

erc-eips.txt:
	grep -r -l -i "category: ERC" $(EIP_DIR) > $@

eip-functions.txt: $(EIP_DIR)/*
	grep -r -o -h -E "^[\s\`]*function \w*\(.*)" $(EIP_DIR) | cut -d '`' -f2- > $@

update-submodules:
	git submodule update --init --recursive --remote
