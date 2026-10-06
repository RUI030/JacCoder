# count_less_than_elements

Constructs an array b such that for each integer c in a, its position in b is the count of numbers in a that are less than c.

:param n: Number of integers
:param a: List of n distinct integers
:return: List of integers representing the counts of numbers less than each element in array a

>>> count_less_than_elements(3, [3, 1, 2])
[2, 0, 1]
>>> count_less_than_elements(3, [1, 3, 2])
[0, 2, 1]

Implement `count_less_than_elements(n: int, a: list[int]) -> list[int]`.
