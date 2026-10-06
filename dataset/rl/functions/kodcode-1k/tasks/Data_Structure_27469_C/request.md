# cycle_sort

Performs an in-place Cycle Sort on the given list.

Cycle Sort is an in-place sorting algorithm known for its minimal write operations which can be particularly useful in scenarios where write operations are costly. Your task is to implement an optimized version of the cycle sort algorithm and ensure it handles common edge cases correctly.

Given a list of integers, implement the Cycle Sort algorithm to sort the list in ascending order.

>>> cycle_sort([3, 1, 5, 2, 4])
[1, 2, 3, 4, 5]

>>> cycle_sort([4, 4, 4, 4])
[4, 4, 4, 4]

Implement `cycle_sort(arr: list[int]) -> list[int]`.
