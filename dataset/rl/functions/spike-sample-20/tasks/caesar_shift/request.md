# Caesar cipher shift

Implement `caesar_shift(text: str, k: int) -> str`. Shift every ASCII letter by
`k` positions in the alphabet, wrapping around and keeping its case. `k` may be
negative or larger than 26. All other characters stay unchanged.

Examples:
- `caesar_shift("abc", 1) == "bcd"`
- `caesar_shift("Zoo!", 1) == "App!"`
