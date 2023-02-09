# eip-sighashes

Ethereum 4-byte signature hashes extracted from EIPs

See: [sighashes.json](https://raw.githubusercontent.com/shazow/eip-sighashes/main/sighashes.json) for the latest collection.

## Updating

```
$ nix develop  # Or install `foundry` and `jq`
[dev] $ make
...
```

## How does this work?

1. Clone the EIPs repo
2. Scrape all lines mentioning `function (...)`
3. Clean up
4. Get sighashes of functions
5. Build a JSON lookup index

Enjoy!

## License
MIT
