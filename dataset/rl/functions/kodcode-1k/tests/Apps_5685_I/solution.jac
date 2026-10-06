"""
    Checks if the given number is an Automorphic number.

    Args:
        num: An integer.

    Returns:
        bool: True if num is an Automorphic number, False otherwise.
    """
def isAutomorphic(num: int) -> bool {
    squared = str((num ** 2));
    num_str = str(num);
    return squared.endswith(num_str);
}

