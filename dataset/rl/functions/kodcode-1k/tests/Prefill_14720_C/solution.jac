"""
    Computes the sum of two lists of numbers. If the lists are of different lengths,
    the extra elements in the longer list are ignored.
    """
def sum_lists(list1: list[int], list2: list[int]) -> list[int] {
    return [(a + b) for (a, b) in zip(list1, list2)];
}

