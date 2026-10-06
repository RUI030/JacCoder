"""
    Convert an integer to its binary representation as a string
    zero-padded to a minimum length of 8 bits.

    Args:
    n (int): The integer to be converted.

    Returns:
    str: The binary representation of the integer,
         zero-padded to at least 8 bits.
    """
def int_to_padded_binary(n: int) -> str {
    return format(n, '08b');
}

