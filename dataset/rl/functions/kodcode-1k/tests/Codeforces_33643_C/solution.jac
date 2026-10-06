"""
    Returns the kth number in the Tribenacci sequence.
    """
def tribonacci(k: int) -> int {
    if (k == 0) {
        return 0;
    }
    if ((k == 1) or (k == 2)) {
        return 1;
    }
    trib = [0, 1, 1];
    for i in range(3, (k + 1)) {
        next_value = trib[-1] + trib[-2] + trib[-3];
        trib.append(next_value);
    }
    return trib[k];
}

