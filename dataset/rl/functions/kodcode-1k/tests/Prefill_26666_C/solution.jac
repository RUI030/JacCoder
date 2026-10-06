"""
    Fills in the missing numbers from a sorted list of integers.
    Handles negative numbers and zeros as well.

    Params:
    sorted_list (list): A sorted list of integers.

    Returns:
    list: A list with missing numbers filled in.
    """
def fill_missing_numbers(sorted_list: list[int]) -> list[int] {
    if not sorted_list {
        return [];
    }
    result = [];
    for num in range(sorted_list[0], (sorted_list[-1] + 1)) {
        result.append(num);
    }
    return result;
}

