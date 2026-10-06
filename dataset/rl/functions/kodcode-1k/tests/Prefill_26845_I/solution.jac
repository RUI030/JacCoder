"""
    Returns a new array where all occurrences of the number `n` are replaced with `m`.

    :param arr: List of integers.
    :param n: The integer to be replaced.
    :param m: The integer to replace with.
    :return: A new list with replacements done.
    """
def replace_occurrences(arr: list[int], n: int, m: int) -> list[int] {
    return [m if (x == n) else x for x in arr];
}

