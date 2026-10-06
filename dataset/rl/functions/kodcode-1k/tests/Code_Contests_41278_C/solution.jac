"""
    Returns the maximum possible value of a subarray with at most k distinct integers.
    """
def max_subarray_with_k_distinct(n: int, k: int, arr: list[int]) -> int {
    import from collections { defaultdict }
    left = 0;
    max_sum = 0;
    current_sum = 0;
    count_map = defaultdict(int);
    distinct_count = 0;
    for right in range(n) {
        if (count_map[arr[right]] == 0) {
            distinct_count += 1;
        }
        count_map[arr[right]] += 1;
        current_sum += arr[right];
        while (distinct_count > k) {
            count_map[arr[left]] -= 1;
            current_sum -= arr[left];
            if (count_map[arr[left]] == 0) {
                distinct_count -= 1;
            }
            left += 1;
        }
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}

