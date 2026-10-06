# product_except_self

Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
The solution must be provided without using division and should have a time complexity of O(n).

>>> product_except_self([1, 2, 3, 4])
[24, 12, 8, 6]
>>> product_except_self([-1, 1, 0, -3, 3])
[0, 0, 9, 0, 0]

Implement `product_except_self(nums: list[int]) -> list[int]`.
