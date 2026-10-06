"""
    Returns a new list containing the squares of the even numbers from the input list.
    """
def transform_list(input_list: list[int]) -> list[int] {
    return [
        (x ** 2)
        for x in input_list
        if ((x % 2) == 0)
    ];
}

