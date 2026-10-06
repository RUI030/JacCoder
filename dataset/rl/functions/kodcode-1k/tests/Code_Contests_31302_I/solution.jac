"""
    Modifies the sequence such that each element is the sum of the previous k elements in a cyclic manner.

    :param n: Length of the sequence (integer)
    :param k: Number of elements to sum (integer)
    :param a: Original sequence (list of integers)
    :return: Modified sequence (list of integers)
    """
def modify_sequence(n: int, k: int, a: list[int]) -> list[int] {
    b = [0] * n;
    for i in range(n) {
        b[i] = sum(a[max(((i - k) + 1), 0):(i + 1)]);
    }
    return b;
}
with entry {
    if (__name__ == "__main__") {
        (n, k) = (4, 2);
        a = [1, 2, 3, 4];
        print(modify_sequence(n, k, a));
        (n, k) = (5, 3);
        a = [1, 2, 3, 4, 5];
        print(modify_sequence(n, k, a));
        (n, k) = (3, 1);
        a = [3, 3, 3];
        print(modify_sequence(n, k, a));
    }
}

