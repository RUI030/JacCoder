"""
    Returns the number of non-empty contiguous subarrays whose sum is equal to k.
    """
def count_subarrays_with_sum(arr: list[int], k: int) -> int {
    import from collections { defaultdict }
    prefix_sum_count = defaultdict(int);
    current_sum = 0;
    count = 0;
    for num in arr {
        current_sum += num;
        if (current_sum == k) {
            count += 1;
        }
        if ((current_sum - k) in prefix_sum_count) {
            count += prefix_sum_count[(current_sum - k)];
        }
        prefix_sum_count[current_sum] += 1;
    }
    return count;
}

