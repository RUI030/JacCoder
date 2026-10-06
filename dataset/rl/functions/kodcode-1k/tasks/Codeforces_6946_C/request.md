# has_subarray_with_sum

Determines if there exists a subarray with the sum equal to target_sum.

Parameters:
    n (int): The number of elements in the array.
    array (list of int): The elements of the array.
    target_sum (int): The target sum to find in the subarray.

Returns:
    str: "YES" if there is a subarray with sum equal to target_sum, otherwise "NO".

Examples:
>>> has_subarray_with_sum(5, [1, 2, 3, 4, 5], 9)
"YES"
>>> has_subarray_with_sum(5, [1, 2, 3, 4, 5], 20)
"NO"

Implement `has_subarray_with_sum(n: int, array: list[int], target_sum: int) -> str`.
