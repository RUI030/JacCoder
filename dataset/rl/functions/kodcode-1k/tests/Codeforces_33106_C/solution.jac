import from bisect { bisect_left }
"""
    Returns the length of the longest increasing subsequence in the given sequence.
    """
def length_of_lis(sequence: list[int]) -> int {
    if not sequence {
        return 0;
    }
    lis = [];
    for element in sequence {
        pos = bisect_left(lis, element);
        if (pos == len(lis)) {
            lis.append(element);
        } else {
            lis[pos] = element;
        }
    }
    return len(lis);
}

