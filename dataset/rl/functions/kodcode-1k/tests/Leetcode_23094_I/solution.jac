"""
    Determine if it's possible to partition the array into sub-groups of identical size.
    """
def can_partition_into_equal_groups(arr: list[int]) -> bool {
    import from collections { Counter }
    import from math { gcd }
    import from functools { reduce }
    if (len(arr) == 0) {
        return True;
    }
    freq = Counter(arr);
    values = `list(freq.values());
    common_gcd = reduce(gcd, values);
    return (common_gcd >= 2);
}

