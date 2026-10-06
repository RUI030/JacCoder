# double_positives

Returns a new list where each positive integer from the input list is doubled,
while negative integers and zero are left unchanged.

Parameters:
numbers (list of int): List of integers, each can be positive, negative, or zero.

Returns:
list of int: New list with positive integers doubled and others unchanged.

Examples:
>>> double_positives([1, -2, 3, 0, -4, 5])
[2, -2, 6, 0, -4, 10]

>>> double_positives([-1, -3, -5])
[-1, -3, -5]

Implement `double_positives(numbers: list[int]) -> list[int]`.
