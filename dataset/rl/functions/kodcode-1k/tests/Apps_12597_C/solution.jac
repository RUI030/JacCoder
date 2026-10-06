"""
    Returns the number of triplets (groups of three consecutive elements) where
    all three elements are equal.
    """
def triplets(arr: list[int]) -> int {
    if (len(arr) < 3) {
        return 0;
    }
    count = 0;
    for i in range((len(arr) - 2)) {
        if (arr[i] == arr[(i + 1)] == arr[(i + 2)]) {
            count += 1;
        }
    }
    return count;
}

