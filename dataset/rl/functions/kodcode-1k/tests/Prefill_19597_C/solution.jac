"""
    Converts an integer to its binary representation as a string.
    - For positive integers: returns the standard binary representation prefixed with '0b'.
    - For negative integers: returns the two's complement representation as a string.
    """
def int_to_binary(n: int) -> str {
    if (n >= 0) {
        return ('0b' + bin(n)[2:]);
    } else {
        return bin((n & 4294967295));
    }
}

