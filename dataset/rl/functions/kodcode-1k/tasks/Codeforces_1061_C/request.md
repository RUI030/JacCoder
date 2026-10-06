# can_rearrange

Determines if the given array can be rearranged such that the absolute
difference between every pair of consecutive integers is 1.

Args:
- arr (List[int]): The array of integers.

Returns:
- str: "YES" if such a rearrangement is possible, otherwise "NO".

>>> can_rearrange([1, 2, 4, 5, 3])
"YES"
>>> can_rearrange([1, 3, 2, 5])
"NO"

Implement `can_rearrange(arr: list[int]) -> str`.
