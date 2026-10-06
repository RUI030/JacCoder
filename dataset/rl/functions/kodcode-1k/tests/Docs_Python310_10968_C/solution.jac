"""
    Checks if the binary representation of a given integer is a palindrome.

    Parameters:
    n (int): A non-negative integer to be checked for binary palindrome properties.

    Returns:
    bool: Returns True if the binary representation of n is a palindrome, otherwise returns False.
    """
def is_binary_palindrome(n: int) -> bool {
    binary_representation = bin(n)[2:];
    return (binary_representation == binary_representation[::-1]);
}

