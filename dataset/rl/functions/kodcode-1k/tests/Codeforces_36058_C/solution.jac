"""
    Returns the lexicographically smallest sequence achievable by at most one swap.
    """
def lexicographically_smallest_sequence(N: int, sequence: list[int]) -> list[int] {
    sorted_sequence = sorted(sequence);
    if (sequence == sorted_sequence) {
        return sequence;
    }
    for i in range(N) {
        if (sequence[i] != sorted_sequence[i]) {
            break;
        }
    }
    for j in range((N - 1), -1, -1) {
        if (sequence[j] == sorted_sequence[i]) {
            break;
        }
    }
    (sequence[i], sequence[j]) = (sequence[j], sequence[i]);
    return sequence;
}

