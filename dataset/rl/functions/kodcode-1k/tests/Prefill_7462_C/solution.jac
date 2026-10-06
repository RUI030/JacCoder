"""
    Returns the intersection of two arrays.
    The intersection of two arrays is the set of elements that are common to both arrays.

    :param arr1: List[int] - The first array
    :param arr2: List[int] - The second array
    :return: List[int] - The intersection of the two arrays
    """
def intersection(arr1: list[int], arr2: list[int]) -> list[int] {
    set1 = `set(arr1);
    set2 = `set(arr2);
    intersect = set1.intersection(set2);
    return `list(intersect);
}

