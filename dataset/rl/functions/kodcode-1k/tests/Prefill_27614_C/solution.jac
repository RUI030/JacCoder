"""
    Returns True if the given list of numbers is a palindrome, False otherwise.

    A list is a palindrome if it reads the same forwards and backwards.

    Parameters:
    lst (List[int]): A list of integers.

    Returns:
    bool: True if the list is a palindrome, False otherwise.
    """
def is_palindrome(lst: list[int]) -> bool {
    return (lst == lst[::-1]);
}

