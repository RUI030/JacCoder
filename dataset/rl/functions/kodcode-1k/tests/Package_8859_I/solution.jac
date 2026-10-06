"""
    Find the maximum sum of a contiguous subarray using Kadane’s algorithm.

    Parameters:
    arr (list of int): A list of integers.

    Returns:
    int: The maximum sum of a contiguous subarray.
    """
def max_subarray_sum(arr: list[int]) -> int {
    max_current = max_global=arr[0];
    for num in arr[1:] {
        max_current = max(num, (max_current + num));
        if (max_current > max_global) {
            max_global = max_current;
        }
    }
    return max_global;
}

