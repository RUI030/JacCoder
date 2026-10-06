"""
    Multiplies two positive integers using bitwise operators.
    """
def multiply(a: int, b: int) -> int {
    result = 0;
    while (b > 0) {
        if (b & 1) {
            result = result + a;
        }
        a = a << 1;
        b = b >> 1;
    }
    return result;
}

