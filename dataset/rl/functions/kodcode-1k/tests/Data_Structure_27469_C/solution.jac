import from typing { List }
"""
    Performs an in-place Cycle Sort on the given list.
    """
def cycle_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    for cycle_start in range(0, (n - 1)) {
        item = arr[cycle_start];
        pos = cycle_start;
        for i in range((cycle_start + 1), n) {
            if (arr[i] < item) {
                pos += 1;
            }
        }
        if (pos == cycle_start) {
            continue;
        }
        while (item == arr[pos]) {
            pos += 1;
        }
        (arr[pos], item) = (item, arr[pos]);
        while (pos != cycle_start) {
            pos = cycle_start;
            for i in range((cycle_start + 1), n) {
                if (arr[i] < item) {
                    pos += 1;
                }
            }
            while (item == arr[pos]) {
                pos += 1;
            }
            (arr[pos], item) = (item, arr[pos]);
        }
    }
    return arr;
}

