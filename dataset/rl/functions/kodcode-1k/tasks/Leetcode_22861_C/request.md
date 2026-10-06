# check_indices_with_sum

Determines if there are two distinct indices `i` and `j` in the array such that 
nums[i] + nums[j] == k and the absolute difference between `i` and `j` is not 
greater than `d`.

Args:
nums (list of int): The input list of integers.
k (int): The target sum.
d (int): The maximum allowed distance between indices.

Returns:
bool: True if such indices exist, False otherwise.

>>> check_indices_with_sum([1, 2, 3, 4], 5, 2)
True
>>> check_indices_with_sum([1, 2, 3, 4], 8, 2)
False

Implement `check_indices_with_sum(nums: list[int], k: int, d: int) -> bool`.
