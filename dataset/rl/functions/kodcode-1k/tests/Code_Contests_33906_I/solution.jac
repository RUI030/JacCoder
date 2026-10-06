"""
    Returns the number of positions where the characters in the two strings S and T differ.
    """
def count_differences(S: str, T: str) -> int {
    differences = 0;
    for (char1, char2) in zip(S, T) {
        if (char1 != char2) {
            differences += 1;
        }
    }
    return differences;
}

