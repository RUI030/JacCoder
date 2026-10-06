# product_excluding_self

Returns a new list where each integer is replaced with the product of all other
integers in the original list, excluding the integer at that position.

Args:
nums (list): List of integers.

Returns:
list: List of integers after transformation.

>>> product_excluding_self([1, 2, 3, 4])
[24, 12, 8, 6]
>>> product_excluding_self([5])
[1]

Implement `product_excluding_self(nums: list[int]) -> list[int]`.
