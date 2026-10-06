"""
    Returns the second highest unique number in the list.
    If the list contains fewer than two unique numbers, returns None.
    """
def second_highest(lst: list[int]) -> int | None {
    if (len(lst) < 2) {
        return None;
    }
    unique_numbers = `set(lst);
    if (len(unique_numbers) < 2) {
        return None;
    }
    unique_numbers.remove(max(unique_numbers));
    return max(unique_numbers);
}

