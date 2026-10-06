"""
    Finds the sum of each possible sub-array of size K and prints these sums in order.

    Parameters:
    arr (List[int]): Array of integers
    K (int): Size of the sub-arrays

    Returns:
    List[int]: Sum of each sub-array of size K
    """
def subarray_sums(arr: list[int], K: int) -> list[int] {
    N = len(arr);
    result = [];
    current_sum = sum(arr[:K]);
    result.append(current_sum);
    for i in range(1, ((N - K) + 1)) {
        current_sum += arr[((i + K) - 1)] - arr[(i - 1)];
        result.append(current_sum);
    }
    return result;
}

