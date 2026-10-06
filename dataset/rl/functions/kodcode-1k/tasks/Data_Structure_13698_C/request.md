# find_index

Given a sorted array of integers and a target integer, finds the index of the target integer in the array.
If the target integer is not present in the array, returns -1.

Args:
arr: A list of integers sorted in ascending order.
target: An integer representing the value to search for.

Returns:
An integer representing the index of the target in the list. Returns -1 if the target is not in the list.

>>> find_index([1, 2, 3, 4, 5, 6], 4) == 3
>>> find_index([1, 2, 3, 4, 5, 6], 0) == -1

Implement `find_index(arr: list[int], target: int) -> int`.
