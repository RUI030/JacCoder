# find_pattern

Uses the Rabin-Karp algorithm with a rolling hash to find the starting index
of the first occurrence of the pattern in the text. Returns -1 if the pattern is not found.

>>> find_pattern("abc", "abdefabc")
5
>>> find_pattern("xyz", "abcdefg")
-1

Implement `find_pattern(pattern: str, text: str) -> int`.
