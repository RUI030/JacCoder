"""
    Determines if there exists a pair of indices (i, j) such that i ≠ j
    and arr[i] + arr[j] == k.

    :param arr: List of integers
    :param k: Target sum
    :return: "YES" if such a pair exists, otherwise "NO"
    """
def find_pair_with_sum(arr: list[int], k: int) -> str {
    seen = `set();
    for num in arr {
        if ((k - num) in seen) {
            return "YES";
        }
        seen.add(num);
    }
    return "NO";
}

