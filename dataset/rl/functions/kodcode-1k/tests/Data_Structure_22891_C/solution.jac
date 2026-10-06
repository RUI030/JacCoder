import from typing { List }
import bisect;
"""
    Returns the length of the longest increasing subsequence in the given list of integers.
    """
def longest_increasing_subsequence(sequence: list[int]) -> int {
    if not sequence {
        return 0;
    }
    lis = [];
    for num in sequence {
        pos = bisect.bisect_left(lis, num);
        if (pos == len(lis)) {
            lis.append(num);
        } else {
            lis[pos] = num;
        }
    }
    return len(lis);
}

