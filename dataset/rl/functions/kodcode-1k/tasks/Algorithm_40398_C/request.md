# product_except_self

Given an integer array nums, return an array answer such that answer[i] is 
equal to the product of all the elements of nums except nums[i].

This function must run in O(n) time complexity and achieve the result with O(1) space complexity (excluding the space for the output array).

Args:
    nums: List of integers

Returns:
    List of integers where each value at index i is the product of 
    all numbers in the input array except for the number at index i.

Examples:
>>> product_except_self([1, 2, 3, 4])
[24, 12, 8, 6]

>>> product_except_self([-1, 1, 0, -3, 3])
[0, 0, 9, 0, 0]

Implement `product_except_self(nums: list[int]) -> list[int]`.
