# Validate an IPv4 address

Implement `valid_ipv4(s: str) -> bool`. Return `True` when `s` is four decimal
numbers from 0 to 255 separated by dots. Each part must be non-empty, contain only
digits, and have no leading zero unless the part is exactly `"0"`.

Examples:
- `valid_ipv4("192.168.1.1") == True`
- `valid_ipv4("256.1.1.1") == False`
