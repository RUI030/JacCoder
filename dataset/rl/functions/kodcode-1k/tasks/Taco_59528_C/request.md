# find_unsorted_subarray

Given an unsorted array of integers, return the shortest subarray such that sorting 
it results in the entire array being sorted.

Parameters:
nums (List[int]): The input list of integers.

Returns:
Tuple[int, int]: The start and end indices of the smallest such subarray 
that, when sorted, makes the whole array sorted. If the array is already 
sorted, returns (-1, -1).

>>> find_unsorted_subarray([1, 2, 3, 4])
(-1, -1)
>>> find_unsorted_subarray([2, 6, 4, 8, 10, 9, 15])
(1, 5)

Implement `find_unsorted_subarray(nums: list[int]) -> tuple[int, int]`.
