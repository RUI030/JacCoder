import from typing { List }
"""
    Uses Kadane's Algorithm to find the maximum sum of a contiguous subarray.
    """
def max_contiguous_subsequence_sum(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    max_ending_here = max_so_far=arr[0];
    for x in arr[1:] {
        max_ending_here = max(x, (max_ending_here + x));
        max_so_far = max(max_so_far, max_ending_here);
    }
    return max_so_far;
}

