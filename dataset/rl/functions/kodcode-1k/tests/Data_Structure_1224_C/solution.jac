import from collections { Counter }
"""
    Finds and returns the mode(s) of the array. If there are multiple modes,
    the function returns a list of all these values in any order.
    """
def top_1(arr: list[int]) -> list[int] {
    if not arr {
        return [];
    }
    count = Counter(arr);
    max_frequency = max(count.values());
    modes = [
        num
        for (num, freq) in count.items()
        if (freq == max_frequency)
    ];
    return modes;
}

