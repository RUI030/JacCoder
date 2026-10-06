"""
    Segregates even and odd numbers in an array such that all even numbers
    come before all odd numbers and the relative order of the numbers
    within their groups is preserved.

    :param arr: List of integers to be segregated
    :return: New list with even numbers before odd numbers, maintaining relative order
    """
def segregate_even_odd(arr: list[int]) -> list[int] {
    evens = [
        num
        for num in arr
        if ((num % 2) == 0)
    ];
    odds = [
        num
        for num in arr
        if ((num % 2) != 0)
    ];
    return (evens + odds);
}

