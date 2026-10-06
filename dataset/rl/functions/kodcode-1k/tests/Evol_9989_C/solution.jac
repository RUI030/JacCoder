"""
    Identifies all elements that appear more than once in a list of integers.
    The returned list is sorted in ascending order and contains each duplicate element only once.
    """
def find_duplicates(nums: list[int]) -> list[int] {
    duplicates = `set();
    seen = `set();
    for num in nums {
        if (num in seen) {
            duplicates.add(num);
        } else {
            seen.add(num);
        }
    }
    return sorted(duplicates);
}

