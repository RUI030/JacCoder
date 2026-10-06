import from typing { List }
"""
    Concatenate the elements of two lists into a single string, excluding common characters.

    Args:
    list1: List containing the first set of single-character strings.
    list2: List containing the second set of single-character strings.

    Returns:
    A string that is the result of concatenating the two lists after eliminating any character
    that is present in both lists.

    Examples:
    >>> concatenate_elimination(['a', 'b', 'c'], ['b', 'd', 'e'])
    'acde'

    >>> concatenate_elimination(['m', 'n'], ['n', 'o'])
    'mo'
    """
def concatenate_elimination(list1: list[str], list2: list[str]) -> str {
    common_chars = `set(list1).intersection(`set(list2));
    filtered_list1 = [
        char
        for char in list1
        if (char not in common_chars)
    ];
    filtered_list2 = [
        char
        for char in list2
        if (char not in common_chars)
    ];
    return ''.join((filtered_list1 + filtered_list2));
}

