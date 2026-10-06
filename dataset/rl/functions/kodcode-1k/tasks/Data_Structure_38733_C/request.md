# cycle_sort

Perform Cycle Sort on the array and return the sorted array.
Cycle Sort is an in-place sorting Algorithm, unstable in nature useful for situations where memory write or swap operations are costly. 
This algorithm is optimal for such cases since it minimizes the number of writes.

Args:
arr: List[int] - The list of integers to be sorted.

Returns:
List[int] - The sorted list in ascending order.

Example:
>>> cycle_sort([4, 3, 2, 1])
[1, 2, 3, 4]

>>> cycle_sort([5, 6, 1, 2, 9])
[1, 2, 5, 6, 9]

Implement `cycle_sort(arr: list[int]) -> list[int]`.
