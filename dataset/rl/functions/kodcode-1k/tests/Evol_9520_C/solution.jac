"""
    Returns a list of unique pairs from nums that add up to the target.

    Each pair is sorted and appears only once.
    """
def find_pairs(nums: list[int], target: int) -> list[tuple[int, int]] {
    seen = `set();
    pairs = `set();
    for num in nums {
        complement = target - num;
        if (complement in seen) {
            pairs.add(`tuple(sorted((num, complement))));
        }
        seen.add(num);
    }
    return `list(pairs);
}

