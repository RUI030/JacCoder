# rearrange_array

Rearrange elements in nums such that all elements less than pivot
appear before all elements equal to pivot, and those appear before
all elements greater than pivot.

>>> rearrange_array([9, 12, 5, 10, 14, 3, 10], 10)
[9, 5, 3, 10, 10, 12, 14]
>>> rearrange_array([1, 2, 3, 4, 5], 3)
[1, 2, 3, 4, 5]

Implement `rearrange_array(nums: list[int], pivot: int) -> list[int]`.
