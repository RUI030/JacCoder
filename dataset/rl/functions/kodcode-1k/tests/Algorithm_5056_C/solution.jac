"""
    Returns the number of unique BSTs that can be constructed with `n` unique nodes.
    This is computed using the nth Catalan number.
    """
def num_unique_bst(n: int) -> int {
    if ((n == 0) or (n == 1)) {
        return 1;
    }
    catalan = [0] * (n + 1);
    catalan[0] = 1;
    catalan[1] = 1;
    for i in range(2, (n + 1)) {
        catalan[i] = sum((catalan[j] * catalan[(i - 1 - j)]) for j in range(i));
    }
    return catalan[n];
}

