"""
    Determines if the given array can be rearranged such that the absolute
    difference between every pair of consecutive integers is 1.
    """
def can_rearrange(arr: list[int]) -> str {
    arr.sort();
    for i in range(1, len(arr)) {
        if (abs((arr[i] - arr[(i - 1)])) != 1) {
            return "NO";
        }
    }
    return "YES";
}

