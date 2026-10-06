# min_operations

Determine the minimum number of operations required to transform `start` into `target`,
where the allowed operations are Insert, Delete, and Replace a character.

Args:
start (str): The initial string.
target (str): The target string to transform to.

Returns:
int: The minimum number of operations required to transform `start` to `target`.

Examples:
>>> min_operations("kitten", "sitting")
3

>>> min_operations("flaw", "lawn")
2

Implement `min_operations(start: str, target: str) -> int`.
