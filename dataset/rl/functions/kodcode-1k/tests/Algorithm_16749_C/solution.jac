"""
    Returns the sorted list of unique integers that are present in both input lists.
    """
def intersection(arr1: list[int], arr2: list[int]) -> list[int] {
    set1 = `set(arr1);
    set2 = `set(arr2);
    intersection_set = set1.intersection(set2);
    return sorted(intersection_set);
}

