"""
    Generate the modified hailstone sequence.
    n: The starting point of the hailstone sequence.
    Returns
    List[int]: The modified hailstone sequence.
    """
def modified_hailstone(n: int) -> list[int] {
    sequence = [n];
    while (n != 1) {
        if ((n % 2) == 0) {
            n = n // 2;
        } else {
            next_n = (3 * n) + 1;
            if (next_n in sequence) {
                n = n // 3;
            } else {
                n = (3 * n) + 1;
            }
        }
        sequence.append(n);
    }
    return sequence;
}

