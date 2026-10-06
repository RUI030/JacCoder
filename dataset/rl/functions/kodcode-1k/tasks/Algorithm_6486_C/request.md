# merge_sorted_lists

Merge two sorted lists of integers into a single sorted list.

Args:
list1 (list[int]): The first sorted list.
list2 (list[int]): The second sorted list.

Returns:
list[int]: A merged and sorted list containing all elements from list1 and list2.

Examples:
>>> merge_sorted_lists([1, 3, 5], [2, 4, 6])
[1, 2, 3, 4, 5, 6]

>>> merge_sorted_lists([1, 2, 2], [2, 2, 3])
[1, 2, 2, 2, 2, 3]

Implement `merge_sorted_lists(list1: list[int], list2: list[int]) -> list[int]`.
