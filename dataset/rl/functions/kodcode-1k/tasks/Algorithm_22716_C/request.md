# product_except_self

Transforms a given list of integers such that every element in the list becomes the product of all the integers in the original list except the one at the current index.

The function must do so without using division and in O(n) time complexity.

>>> product_except_self([1, 2, 3, 4])
[24, 12, 8, 6]

>>> product_except_self([-1, 1, 0, -3, 3])
[0, 0, 9, 0, 0]

Implement `product_except_self(nums: list[int]) -> list[int]`.
