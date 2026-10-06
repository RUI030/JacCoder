# process_list

Takes a list of integers and returns a new list where each element is squared
but only if the element is an even number. Odd numbers remain unchanged.

:param nums: List of integers
:return: A new list where even numbers are squared and odd numbers remain the same

>>> process_list([1, 2, 3, 4])
[1, 4, 3, 16]
>>> process_list([2, 4, 6])
[4, 16, 36]

Implement `process_list(nums: list[int]) -> list[int]`.
