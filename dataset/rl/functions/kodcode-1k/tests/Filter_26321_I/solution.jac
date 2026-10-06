"""
    Returns the list of common elements between list1 and list2 in the order they appear in list1,
    without duplicates.
    """
def common_elements(list1: list[int], list2: list[int]) -> list[int] {
    common_set = `set(list2);
    result = [];
    seen = `set();
    for item in list1 {
        if ((item in common_set) and (item not in seen)) {
            result.append(item);
            seen.add(item);
        }
    }
    return result;
}

