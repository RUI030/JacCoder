"""
    Given an array of integers and an integer k, returns the highest sum of any contiguous subarray of size k.
    If no such subarray can be found, returns -1.
    """
def max_contiguous_subarray_sum(n: int, k: int, arr: list[int]) -> int {
    if (k > n) {
        return -1;
    }
    max_sum = current_sum=sum(arr[:k]);
    for i in range(k, n) {
        current_sum += arr[i] - arr[(i - k)];
        if (current_sum > max_sum) {
            max_sum = current_sum;
        }
    }
    return max_sum;
}

