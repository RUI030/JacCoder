# product_except_self

Returns a list such that each element at index i of the output list is the
product of all the numbers in the original array except the one at i.

>>> product_except_self([1, 2, 3, 4])
[24, 12, 8, 6]
>>> product_except_self([0, 1, 2, 3])
[6, 0, 0, 0]

Implement `product_except_self(nums: list[int]) -> list[int]`.
