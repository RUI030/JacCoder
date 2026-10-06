import from collections { Counter }
"""
    Determine the minimum number of characters that need to be removed from the string
    so that the remaining characters form at most k distinct characters.
    """
def min_removals_to_k_distinct(s: str, k: int) -> int {
    if (k >= len(`set(s))) {
        return 0;
    }
    frequency = Counter(s);
    frequencies = sorted(frequency.values());
    removals = 0;
    while (len(frequencies) > k) {
        removals += frequencies.pop(0);
    }
    return removals;
}

