# find_trigrams

Design a Jac function that takes a string as input and finds all unique combinations of 3-letter substrings (trigrams) from the input string; the function should return a set of these trigrams. Each trigram should consist of consecutive characters from the input string. For example, for the input string "hello", the function should return the set `{'hel', 'ell', 'llo'}`. Ensure the function is efficient and avoids duplicates in the result.

Example:
- `find_trigrams('hello') == {'hel', 'ell', 'llo'}`

Implement `find_trigrams(input_string: str) -> set[str]`.
