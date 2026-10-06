# find_optimal_index

Finds the index of a 0 to replace with a 1 that results in the longest
continuous sequence of 1s in the binary array.

Parameters:
    binary_array (List[int]): A list of integers containing only 0s and 1s.

Returns:
    int: The index of the 0 that should be replaced. If no such index exists, return -1.

>>> find_optimal_index([1, 1, 1, 1])
-1
>>> find_optimal_index([0, 0, 0, 0])
0

Implement `find_optimal_index(binary_array: list[int]) -> int`.
