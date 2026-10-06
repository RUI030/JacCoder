"""
    Determines if there are two distinct integers in the array
    whose sum equals the target sum.

    Args:
    arr (list of int): Array of integers.
    target (int): Target sum.

    Returns:
    bool: True if such a pair exists, otherwise False.
    """
def has_pair_with_sum(arr: list[int], target: int) -> bool {
    seen = `set();
    for num in arr {
        if ((target - num) in seen) {
            return True;
        }
        seen.add(num);
    }
    return False;
}

