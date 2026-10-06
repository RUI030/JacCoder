def digital_root(n: int) -> int {
    while (n >= 10) {
        n = sum(int(digit) for digit in str(n));
    }
    return n;
}

