"""
    Finds all unique pairs of numbers in the list that add up to the target,
    excluding the element at the ignore_index.

    Returns:
        A list of tuples, each containing a pair of numbers that add up to the target.
    """
def find_pairs(numbers: list[int], target: int, ignore_index: int) -> list[tuple[int, int]] {
    seen = `set();
    pairs = `set();
    for (i, num) in enumerate(numbers) {
        if (i == ignore_index) {
            continue;
        }
        complement = target - num;
        if (complement in seen) {
            pairs.add((min(num, complement), max(num, complement)));
        }
        seen.add(num);
    }
    return `list(pairs);
}

