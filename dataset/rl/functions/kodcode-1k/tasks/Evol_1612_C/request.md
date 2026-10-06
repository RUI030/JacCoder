# filter_and_square

Given a list of integers and a threshold, returns a new list containing
the squares of all integers from the input list that are greater than
or equal to the given threshold. The order of elements in the new list
is the same as in the original list.

>>> filter_and_square([1, 3, 5, 7, 9], 5)
[25, 49, 81]
>>> filter_and_square([1, 3, 4], 5)
[]

Implement `filter_and_square(nums: list[int], threshold: int) -> list[int]`.
