"""
    Returns a new list with duplicates removed from the input list.
    The order of elements is preserved and the original list is not modified.
    """
def remove_duplicates(nums: list[int]) -> list[int] {
    seen = `set();
    result = [];
    for num in nums {
        if (num not in seen) {
            seen.add(num);
            result.append(num);
        }
    }
    return result;
}

