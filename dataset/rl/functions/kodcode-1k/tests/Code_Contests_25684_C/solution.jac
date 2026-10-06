"""
    Returns the length of the longest interesting subarray in `arr`.
    An interesting subarray is defined by a consistent absolute difference
    between any two consecutive elements.
    """
def longest_interesting_subarray(arr: list[int]) -> int {
    n = len(arr);
    if (n <= 1) {
        return n;
    }
    max_length = 1;
    current_length = 1;
    current_diff = arr[1] - arr[0];
    for i in range(1, (n - 1)) {
        diff = arr[(i + 1)] - arr[i];
        if (diff == current_diff) {
            current_length += 1;
        } else {
            current_diff = diff;
            current_length = 1;
        }
        max_length = max(max_length, current_length);
    }
    return (max_length + 1);
}

