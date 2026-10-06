"""
    Returns the maximum number of contiguous groups of empty checkpoints
    after picking up k letters from n checkpoints.
    """
def max_contiguous_empty_groups(n: int, k: int) -> int {
    if (k == 0) {
        return 1;
    }
    if (k == n) {
        return n;
    }
    groups = k;
    return groups;
}

