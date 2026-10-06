"""
    Returns the minimum number of characters to remove from the string to ensure no three consecutive characters are identical.
    """
def min_removals_to_avoid_triplets(s: str) -> int {
    if (len(s) < 3) {
        return 0;
    }
    removals = 0;
    i = 0;
    while (i < (len(s) - 2)) {
        if (s[i] == s[(i + 1)] == s[(i + 2)]) {
            removals += 1;
            i += 2;
        } else {
            i += 1;
        }
    }
    return removals;
}

