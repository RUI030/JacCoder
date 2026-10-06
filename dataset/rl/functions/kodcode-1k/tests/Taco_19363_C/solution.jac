"""
    Returns a list with duplicates removed while preserving the original order of elements.
    """
def remove_duplicates(lst: list[int]) -> list[int] {
    seen = `set();
    result = [];
    for item in lst {
        if (item not in seen) {
            seen.add(item);
            result.append(item);
        }
    }
    return result;
}

