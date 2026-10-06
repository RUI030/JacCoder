"""
    Sorts an array using Cycle Sort algorithm with minimum write operations.

    Args:
    arr: A list of integers to be sorted.

    Returns:
    The sorted list of integers.
    """
def cycle_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    for start in range(0, (n - 1)) {
        item = arr[start];
        pos = start;
        for i in range((start + 1), n) {
            if (arr[i] < item) {
                pos += 1;
            }
        }
        if (pos == start) {
            continue;
        }
        while (item == arr[pos]) {
            pos += 1;
        }
        if (pos != start) {
            (arr[pos], item) = (item, arr[pos]);
        }
        while (pos != start) {
            pos = start;
            for i in range((start + 1), n) {
                if (arr[i] < item) {
                    pos += 1;
                }
            }
            while (item == arr[pos]) {
                pos += 1;
            }
            if (item != arr[pos]) {
                (arr[pos], item) = (item, arr[pos]);
            }
        }
    }
    return arr;
}

