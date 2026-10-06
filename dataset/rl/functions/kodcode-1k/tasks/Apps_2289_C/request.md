# shift_string

Shifts each character in the string `s` forward by `k` positions in the alphabet.
Wraps around if the shift goes past 'z' and returns the transformed string.

>>> shift_string("xyz", 2)
"zab"
>>> shift_string("abc", 1)
"bcd"

Implement `shift_string(s: str, k: int) -> str`.
