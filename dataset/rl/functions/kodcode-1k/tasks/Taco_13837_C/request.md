# is_good_sequence

Returns "YES" if the sequence is "good", otherwise "NO".

A sequence is "good" if it can be split into two non-empty subsequences 
such that the sum of the elements in both subsequences is equal.

>>> is_good_sequence(4, [1, 2, 3, 6]) == "YES"
>>> is_good_sequence(5, [1, 5, 11, 5, 4]) == "NO"

Implement `is_good_sequence(n: int, sequence: list[int]) -> str`.
