"""
    Returns a list of unique pairs of integers from 'arr' whose sum is equal to 'k'.
    Each pair is sorted in non-decreasing order.
    The resulting list is also sorted in non-decreasing order.
    """
def findPairs(arr: list[int], k: int) -> list[tuple[int, int]] {
    seen = `set();
    pairs = `set();
    for num in arr {
        target = k - num;
        if (target in seen) {
            pairs.add(`tuple(sorted((num, target))));
        }
        seen.add(num);
    }
    return sorted(pairs);
}

