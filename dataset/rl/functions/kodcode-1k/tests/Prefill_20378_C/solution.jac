"""
    Returns the number of 1s in the binary representation of a given positive integer n.
    """
def count_ones_in_binary(n: int) -> int {
    return bin(n).count('1');
}

