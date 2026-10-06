"""
    Generates a sequence of integers such that |a_k - k| is unique for each k.

    Parameters:
    - n: the length of the sequence to generate

    Returns:
    - A list of n integers satisfying the condition that |a_k - k| is unique for each k
    """
def generate_sequence(n: int) -> list[int] {
    sequence = [0] * n;
    for k in range(1, (n + 1)) {
        if ((k % 2) == 1) {
            sequence[(k - 1)] = (k + 1) // 2;
        } else {
            sequence[(k - 1)] = (n - (k // 2)) + 1;
        }
    }
    return sequence;
}

