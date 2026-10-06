"""
    Returns True if there are two distinct elements in the list whose sum equals the target.
    Returns False otherwise.
    """
def has_pair_with_sum(lst: list[int], target: int) -> bool {
    seen = `set();
    for num in lst {
        if ((target - num) in seen) {
            return True;
        }
        seen.add(num);
    }
    return False;
}

