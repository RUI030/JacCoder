"""
    Returns the smallest positive integer that does not appear in the array.
    """
def find_smallest_missing_positive_integer(arr: list[int]) -> int {
    n = len(arr);
    for i in range(n) {
        while ((1 <= arr[i] <= n) and (arr[(arr[i] - 1)] != arr[i])) {
            (arr[(arr[i] - 1)], arr[i]) = (arr[i], arr[(arr[i] - 1)]);
        }
    }
    for i in range(n) {
        if (arr[i] != (i + 1)) {
            return (i + 1);
        }
    }
    return (n + 1);
}

