"""
    Determines the minimum number of segment swaps needed to sort the array in non-decreasing order.
    """
def min_segment_swaps(arr: list[int]) -> int {
    n = len(arr);
    sorted_arr = sorted(arr);
    if (arr == sorted_arr) {
        return 0;
    }
    i = 0;
    swaps = 0;
    while (i < n) {
        if (arr[i] != sorted_arr[i]) {
            j = i;
            while ((j < n) and (arr[j] != sorted_arr[i])) {
                j += 1;
            }
            arr[i:(j + 1)] = arr[i:(j + 1)][::-1];
            swaps += 1;
        }
        i += 1;
    }
    return swaps;
}

