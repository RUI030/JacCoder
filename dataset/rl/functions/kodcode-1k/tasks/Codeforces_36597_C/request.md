# subset_sum_exists

Determines if there exists a subset of the array `arr` with a sum equal to `target`.

Args:
n (int): Number of elements in the array.
target (int): The target sum.
arr (list of int): The array of elements.

Returns:
str: "YES" if there exists a subset that adds up to the target, otherwise "NO".

>>> subset_sum_exists(5, 9, [2, 3, 7, 8, 10])
"YES"
>>> subset_sum_exists(5, 1, [2, 3, 7, 8, 10])
"NO"

Implement `subset_sum_exists(n: int, target: int, arr: list[int]) -> str`.
