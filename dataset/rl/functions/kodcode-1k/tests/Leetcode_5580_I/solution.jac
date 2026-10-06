"""
    Determines the minimum number of step operations required to make
    all characters in the string unique.

    Parameters:
    s (str): The input string consisting of lowercase English letters.

    Returns:
    int: The minimum number of steps required to make all characters unique.
    """
def min_steps_to_unique_chars(s: str) -> int {
    count = 0;
    seen = `set();
    for char in s {
        if (char in seen) {
            count += 1;
        } else {
            seen.add(char);
        }
    }
    return count;
}

