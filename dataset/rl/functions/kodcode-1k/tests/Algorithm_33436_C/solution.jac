"""
    Returns the number of distinct integers of the form a^b
    where 2 <= a <= x and 2 <= b <= y.
    """
def distinct_powers_in_range(x: int, y: int) -> int {
    unique_powers = `set();
    for a in range(2, (x + 1)) {
        for b in range(2, (y + 1)) {
            unique_powers.add((a ** b));
        }
    }
    return len(unique_powers);
}

