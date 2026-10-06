# segregate_even_odd

Segregates even and odd numbers in an array such that all even numbers
come before all odd numbers and the relative order of the numbers 
within their groups is preserved.

:param arr: List of integers to be segregated
:return: New list with even numbers before odd numbers, maintaining relative order

Constraints:
- The length of the input list will be at most 1000.
- All integers will be in the range of [-100000, 100000].

>>> segregate_even_odd([1, 2, 3, 4, 5, 6])
[2, 4, 6, 1, 3, 5]
>>> segregate_even_odd([12, 34, 45, 9, 8, 90, 3])
[12, 34, 8, 90, 45, 9, 3]

Implement `segregate_even_odd(arr: list[int]) -> list[int]`.
