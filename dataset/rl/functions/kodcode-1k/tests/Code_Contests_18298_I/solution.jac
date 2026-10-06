"""
    Determines if there are two distinct elements in the array whose absolute difference is at most k.

    Parameters:
    n (int): Number of elements in the array.
    arr (list of int): List of integers.
    k (int): The allowed absolute difference.

    Returns:
    str: "YES" if such a pair exists, "NO" otherwise.
    """
def has_pair_with_abs_difference_k(n: int, arr: list[int], k: int) -> str {
    arr = sorted(arr);
    (i, j) = (0, 1);
    while ((i < n) and (j < n)) {
        if ((i != j) and (abs((arr[i] - arr[j])) <= k)) {
            return "YES";
        } elif ((arr[j] - arr[i]) > k) {
            i += 1;
        } else {
            j += 1;
        }
    }
    return "NO";
}

