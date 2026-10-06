"""
    Returns a list of unique integers in the reverse order of their first appearance.

    Args:
    nums (list): List of integers.

    Returns:
    list: List of unique integers.
    """
def unique_numbers(nums: list[int]) -> list[int] {
    seen = `set();
    unique_list = [];
    for num in reversed(nums) {
        if (num not in seen) {
            seen.add(num);
            unique_list.append(num);
        }
    }
    return unique_list;
}

