"""
    Returns a sorted list of common elements without duplicates between list1 and list2.
    """
def findCommonElements(list1: list[int], list2: list[int]) -> list[int] {
    common_elements = `set(list1) & `set(list2);
    return sorted(common_elements);
}

