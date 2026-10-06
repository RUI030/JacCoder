"""
    Returns the minimum number of swaps needed to reorder the books so that
    the ID of the book at each position i is (i+1).
    """
def minimum_swaps(arr: list[int]) -> int {
    n = len(arr);
    visited = [False] * n;
    swaps = 0;
    for i in range(n) {
        if (visited[i] or (arr[i] == (i + 1))) {
            continue;
        }
        cycle_size = 0;
        x = i;
        while not visited[x] {
            visited[x] = True;
            x = arr[x] - 1;
            cycle_size += 1;
        }
        if (cycle_size > 0) {
            swaps += cycle_size - 1;
        }
    }
    return swaps;
}

