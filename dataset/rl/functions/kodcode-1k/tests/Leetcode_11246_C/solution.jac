"""
    Determines if str1 can be transformed into str2 by any number of swaps.

    Parameters:
    - str1: The first string.
    - str2: The second string.

    Returns:
    - A boolean indicating whether str1 can be transformed into str2.
    """
def can_transform(str1: str, str2: str) -> bool {
    if (len(str1) != len(str2)) {
        return False;
    }
    return (sorted(str1) == sorted(str2));
}

