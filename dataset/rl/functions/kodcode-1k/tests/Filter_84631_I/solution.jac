"""
    Returns the sum of all even numbers in the array.
    """
def sum_of_even_numbers(arr: list[int]) -> int {
    return sum(
        x
        for x in arr
        if ((x % 2) == 0)
    );
}

