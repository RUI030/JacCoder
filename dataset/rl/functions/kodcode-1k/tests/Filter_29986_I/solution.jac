"""
    Returns a new list containing only the even numbers from the input list.
    If the input is None, returns None.
    """
def filter_even_numbers(lst: list[int] | None) -> list[int] | None {
    if (lst is None) {
        return None;
    }
    return [
        num
        for num in lst
        if ((num % 2) == 0)
    ];
}

