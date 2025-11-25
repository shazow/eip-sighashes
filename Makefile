EIP_DIR=EIPs/EIPS
ERC_DIR=ERCs/ERCS

all: sighashes.json

erc-eips.txt:
	grep -r -l -i "category: ERC" $(EIP_DIR) $(ERC_DIR) > $@

eip-functions.txt: $(EIP_DIR) $(ERC_DIR)
	grep -r -o -h -E "^[\s\`]*function \w*\(.*)" $(EIP_DIR) $(ERC_DIR) | grep -v ")*internal" | grep -v "XXX" | cut -d '`' -f2- | sort > $@

sighashes.json: eip-functions.txt buildindex.sh
	cat $< | ./buildindex.sh | jq --sort-keys > $@

$(EIP_DIR): update-submodules
$(ERC_DIR): update-submodules

update-submodules:
	git submodule update --init --recursive --remote
