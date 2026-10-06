"""
    Returns the number of one-bits (Hamming weight) in the binary representation of the given unsigned integer n.
    """
def count_one_bits(n: int) -> int {
    count = 0;
    while n {
        count += n & 1;
        n >>= 1;
    }
    return count;
}

