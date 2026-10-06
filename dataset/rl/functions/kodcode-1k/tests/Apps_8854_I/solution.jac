"""
    Returns the length of the longest increasing subsequence in the given list of integers.
    Uses a dynamic programming approach with binary search for efficiency.
    """
def longest_increasing_subsequence(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    import bisect;
    lis = [];
    for num in arr {
        pos = bisect.bisect_left(lis, num);
        if (pos == len(lis)) {
            lis.append(num);
        } else {
            lis[pos] = num;
        }
    }
    return len(lis);
}

