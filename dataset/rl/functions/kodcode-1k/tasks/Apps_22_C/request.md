# compress_array

Compresses the input array by removing all adjacent duplicate elements and returns the resulting array.

Args:
arr (list of int): The input array.

Returns:
list of int: The compressed array.

>>> compress_array([1, 2, 2, 3, 3, 3, 2, 2, 1]) == [1, 2, 3, 2, 1]
>>> compress_array([4, 4, 4, 4, 4]) == [4]

Implement `compress_array(arr: list[int]) -> list[int]`.
