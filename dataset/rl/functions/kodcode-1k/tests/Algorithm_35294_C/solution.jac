import from typing { List }
"""
    Squares the even numbers in the given list.

    :param arr: Input list of integers.
    :return: List of integers where every even number is squared.
    """
def square_evens(arr: list[int]) -> list[int] {
    return [(x ** 2) if ((x % 2) == 0) else x for x in arr];
}

