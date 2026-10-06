import from typing { List }
"""
    Sorts a list of integers in ascending order using the Exchange Sort algorithm.
    """
def exchange_sort(lst: list[int]) -> list[int] {
    n = len(lst);
    for i in range((n - 1)) {
        for j in range((i + 1), n) {
            if (lst[i] > lst[j]) {
                (lst[i], lst[j]) = (lst[j], lst[i]);
            }
        }
    }
    return lst;
}

