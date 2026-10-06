# filter_and_sort

Write a function in Python that takes a list of integers and two integers, `min_val` and `max_val`. The function should filter out all the integers in the list that are not within the range `min_val` to `max_val` (inclusive), and return the sorted list of the remaining integers. The function should work efficiently with large lists and handle edge cases, such as empty lists or when no integers fall within the given range.

Example:
- `filter_and_sort([1, 2, 3, 4, 5], 2, 4) == [2, 3, 4]`

Implement `filter_and_sort(numbers: list[int], min_val: int, max_val: int) -> list[int]`.
