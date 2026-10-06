import re;
"""
    Returns a list of strings that are exactly `k` characters long and composed entirely of letters.

    :param lst: List of strings to be filtered.
    :param k: Desired length of strings.
    :return: List of strings that are exactly `k` characters long and composed only of letters.
    """
def filter_strings_by_length_and_content(lst: list[str], k: int) -> list[str] {
    return [
        s
        for s in lst
        if ((len(s) == k) and re.fullmatch(r'[A-Za-z]+', s))
    ];
}

