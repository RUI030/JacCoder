# special_sort

Sort the list in non-decreasing order but using a special sorting algorithm. The special sorting algorithm works as follows:
1. Identify all odd numbers in the list.
2. Sort the odd numbers in non-decreasing order.
3. Replace the odd numbers in the original list with their sorted counterparts.
4. The even numbers remain in their original positions.

Args:
lst (list of int): A list of integers.

Returns:
list of int: The list sorted according to the special sorting rules.

Examples:
>>> special_sort([5, 3, 2, 8, 1, 4])
[1, 3, 2, 8, 5, 4]
>>> special_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
[10, 1, 8, 3, 6, 5, 4, 7, 2, 9]

Implement `special_sort(lst: list[int]) -> list[int]`.
