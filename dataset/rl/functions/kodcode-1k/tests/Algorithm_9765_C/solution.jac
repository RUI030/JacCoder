"""
    Finds the length of the shortest subarray, that when sorted, results in the
    entire array being sorted.
    """
def find_shortest_subarray(arr: list[int]) -> int {
    sorted_arr = sorted(arr);
    n = len(arr);
    if (arr == sorted_arr) {
        return 0;
    }
    left = 0;
    while ((left < n) and (arr[left] == sorted_arr[left])) {
        left += 1;
    }
    right = n - 1;
    while ((right >= 0) and (arr[right] == sorted_arr[right])) {
        right -= 1;
    }
    return ((right - left) + 1);
}

