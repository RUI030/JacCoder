# shuffle_string

Given a string `s` that consists of lowercase letters and a list of indices `indices` where `indices` is a permutation of the string length, [0, 1, 2, ..., len(s)-1], shuffle the string such that the character at the `i`-th position moves to `indices[i]` in the shuffled string. Return the shuffled string.

Example:
- `shuffle_string('abc', [0, 1, 2]) == 'abc'`

Implement `shuffle_string(s: str, indices: list[int]) -> str`.
