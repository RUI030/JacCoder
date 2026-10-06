"""
    Returns the maximum possible sum of any contiguous subarray.
    """
def max_subarray_sum(n: int, fruits: list[int]) -> int {
    max_so_far = fruits[0];
    max_ending_here = fruits[0];
    for i in range(1, n) {
        max_ending_here = max(fruits[i], (max_ending_here + fruits[i]));
        max_so_far = max(max_so_far, max_ending_here);
    }
    return max_so_far;
}

