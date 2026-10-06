"""
    Determine whether there exists a contiguous subarray that sums to k.

    Parameters:
    n (int): size of the array
    k (int): target sum
    arr (list of int): the array of integers

    Returns:
    str: "YES" if such subarray exists, otherwise "NO"
    """
def subarray_sum_exists(n: int, k: int, arr: list[int]) -> str {
    current_sum = 0;
    prefix_sums = {0};
    for num in arr {
        current_sum += num;
        if ((current_sum - k) in prefix_sums) {
            return "YES";
        }
        prefix_sums.add(current_sum);
    }
    return "NO";
}

