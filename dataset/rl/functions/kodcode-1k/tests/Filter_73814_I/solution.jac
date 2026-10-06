"""
    Finds the maximum sum of a subarray within a given one-dimensional array of integers.
    This implementation uses Kadane's Algorithm.

    :param arr: List of integers
    :return: Maximum sum of the subarray
    """
def max_subarray_sum(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    max_current = max_global=arr[0];
    for num in arr[1:] {
        max_current = max(num, (max_current + num));
        if (max_current > max_global) {
            max_global = max_current;
        }
    }
    return max_global;
}

