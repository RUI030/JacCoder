"""
    Perform cycle sort on the list `arr` and return the sorted list.
    """
def cycle_sort(arr: list[int]) -> list[int] {
    writes = 0;
    for start in range((len(arr) - 1)) {
        item = arr[start];
        pos = start;
        for i in range((start + 1), len(arr)) {
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
        (arr[pos], item) = (item, arr[pos]);
        writes += 1;
        while (pos != start) {
            pos = start;
            for i in range((start + 1), len(arr)) {
                if (arr[i] < item) {
                    pos += 1;
                }
            }
            while (item == arr[pos]) {
                pos += 1;
            }
            (arr[pos], item) = (item, arr[pos]);
            writes += 1;
        }
    }
    return arr;
}

