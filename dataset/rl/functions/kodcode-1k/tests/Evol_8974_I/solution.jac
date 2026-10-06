"""
    Returns a new list containing only the elements
    that are greater than the arithmetic mean of the original list.

    :param lst: List of integers
    :return: List of integers greater than the arithmetic mean
    """
def greater_than_mean(lst: list[int]) -> list[int] {
    if not lst {
        return [];
    }
    mean = sum(lst) / len(lst);
    result = [
        x
        for x in lst
        if (x > mean)
    ];
    return result;
}

