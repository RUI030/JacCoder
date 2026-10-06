# min_distance

Returns the minimum number of operations required to transform s1 into s2.

The operations include:
1. Inserting a character.
2. Deleting a character.
3. Replacing a character.

Args:
s1 (str): The first string.
s2 (str): The second string.

Returns:
int: The minimum number of operations required to transform s1 into s2.

>>> min_distance("abc", "abc")
0
>>> min_distance("abc", "abcd")
1

Implement `min_distance(s1: str, s2: str) -> int`.
