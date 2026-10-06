"""
    Finds all unique pairs of distinct elements in 'nums' that sum up to 'target'.

    Parameters:
    nums (list): List of integers.
    target (int): Target sum.

    Returns:
    list: List of tuples with pairs that sum up to 'target'.
    """
def findPairs(nums: list[int], target: int) -> list[tuple[int, int]] {
    seen = `set();
    pairs = `set();
    for num in nums {
        complement = target - num;
        if (complement in seen) {
            pairs.add(`tuple(sorted((num, complement))));
        }
        seen.add(num);
    }
    return sorted(pairs);
}

