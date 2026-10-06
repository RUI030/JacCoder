# cycle_sort

Perform Cycle Sort on a list to minimize memory writes.

Args:
    arr (List[int]): List of integers to be sorted.

Returns:
    List[int]: Sorted list in ascending order.

Examples:
>>> cycle_sort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5])
[1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
>>> cycle_sort([1, 2, 3, 4, 5])
[1, 2, 3, 4, 5]

Implement `cycle_sort(arr: list[int]) -> list[int]`.
