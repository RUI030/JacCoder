"""
    Determines if there exists a permutation of the sequence that can be arranged
    in a strictly increasing followed by strictly decreasing order.

    Parameters:
    sequence (list of int): A list of integers representing the sequence.

    Returns:
    str: "YES" if such a permutation exists, "NO" otherwise.
    """
def is_treasure_code(sequence: list[int]) -> str {
    import from collections { Counter }
    counter = Counter(sequence);
    increasing_part = `set();
    for key in sorted(counter) {
        freq = counter[key];
        if (freq > 2) {
            return "NO";
        }
        increasing_part.add(key);
    }
    return "YES";
}

