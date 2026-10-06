"""
    Returns the maximum sum of k consecutive elements in the array.
    """
def maxSum(arr: list[int], k: int) -> int {
    if (not arr or (k <= 0) or (k > len(arr))) {
        return 0;
    }
    max_sum = current_sum=sum(arr[:k]);
    for i in range(k, len(arr)) {
        current_sum += arr[i] - arr[(i - k)];
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}

