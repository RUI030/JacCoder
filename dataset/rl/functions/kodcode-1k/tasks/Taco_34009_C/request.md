# is_contained

Determine whether set A is contained in set B.

Args:
set_a: A set of distinct integers.
set_b: A set of distinct integers.

Returns:
bool: True if all elements of set A are in set B, otherwise False.

>>> is_contained({1, 2, 3}, {3, 2, 4, 5, 1})
True
>>> is_contained({1, 2, 3, 4}, {2, 3, 4})
False

Implement `is_contained(set_a: set[int], set_b: set[int]) -> bool`.
