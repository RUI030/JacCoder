"""
    Returns the maximum sum of a contiguous subarray within the given array using Kadane's Algorithm.

    :param arr: List of integers
    :return: Maximum sum of a contiguous subarray
    """
def max_subarray_sum(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    max_sum = current_sum=arr[0];
    for num in arr[1:] {
        current_sum = max(num, (current_sum + num));
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}

