"""
    Determines if it's possible to find two non-overlapping subarrays that both sum to k.

    Parameters:
    n (int): The length of the array.
    k (int): The target sum for subarrays.
    arr (list of int): The input array.

    Returns:
    str: "YES" if two such subarrays exist, otherwise "NO".
    """
def find_two_subarrays_with_sum_k(n: int, k: int, arr: list[int]) -> str {
    prefix_sums = {0};
    current_sum = 0;
    for i in range(n) {
        current_sum += arr[i];
        if ((current_sum - k) in prefix_sums) {
            prefix_sums_at_i = prefix_sums.copy();
            current_sum_i = current_sum;
            for j in range((i + 1), n) {
                current_sum_i += arr[j];
                if ((current_sum_i - k) in prefix_sums_at_i) {
                    return "YES";
                }
                prefix_sums_at_i.add(current_sum_i);
            }
        }
        prefix_sums.add(current_sum);
    }
    return "NO";
}

