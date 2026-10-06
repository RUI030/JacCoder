"""
    Returns the number of subarrays of size k that contain at least one even
    and one odd number.

    Parameters:
    n (int): The size of the array.
    k (int): The size of the sliding window.
    array (List[int]): The list of integers.

    Returns:
    int: The number of valid subarrays.
    """
def count_valid_subarrays(n: int, k: int, array: list[int]) -> int {
    if ((k == 0) or (n == 0)) {
        return 0;
    }
    count = 0;
    odd_count = 0;
    even_count = 0;
    for i in range(k) {
        if ((array[i] % 2) == 0) {
            even_count += 1;
        } else {
            odd_count += 1;
        }
    }
    if ((odd_count > 0) and (even_count > 0)) {
        count += 1;
    }
    for i in range(k, n) {
        if ((array[(i - k)] % 2) == 0) {
            even_count -= 1;
        } else {
            odd_count -= 1;
        }
        if ((array[i] % 2) == 0) {
            even_count += 1;
        } else {
            odd_count += 1;
        }
        if ((odd_count > 0) and (even_count > 0)) {
            count += 1;
        }
    }
    return count;
}

