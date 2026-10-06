"""
    Returns the sum of all elements in the list that are both even and multiples of 3.
    """
def sum_even_multiples_of_three(lst: list[int]) -> int {
    return sum(
        x
        for x in lst
        if (((x % 2) == 0) and ((x % 3) == 0))
    );
}

