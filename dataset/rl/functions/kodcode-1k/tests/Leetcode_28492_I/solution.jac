"""
    Returns the maximum number of unique integers in any contiguous subarray of length k.
    """
def max_unique_integers(arr: list[int], k: int) -> int {
    if (len(arr) < k) {
        return len(`set(arr));
    }
    max_unique = 0;
    current_window = `set();
    current_count = {};
    for i in range(len(arr)) {
        if (i >= k) {
            if (current_count[arr[(i - k)]] == 1) {
                current_window.remove(arr[(i - k)]);
            }
            current_count[arr[(i - k)]] -= 1;
        }
        current_window.add(arr[i]);
        current_count[arr[i]] = current_count.get(arr[i], 0) + 1;
        max_unique = max(max_unique, len(current_window));
    }
    return max_unique;
}

