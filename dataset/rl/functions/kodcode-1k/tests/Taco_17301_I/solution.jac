"""
    Finds the smallest positive integer missing from the array.
    """
def find_smallest_missing_positive(n: int, arr: list[int]) -> int {
    positives = {
        num
        for num in arr
        if (num > 0)
    };
    smallest_missing = 1;
    while (smallest_missing in positives) {
        smallest_missing += 1;
    }
    return smallest_missing;
}

