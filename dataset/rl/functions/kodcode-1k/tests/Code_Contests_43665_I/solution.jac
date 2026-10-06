"""
    Returns the length of the longest contiguous balanced subsequence in the given sequence.

    Parameters:
    n (int): the length of the sequence
    seq (str): the sequence of brackets

    Returns:
    int: the length of the longest contiguous balanced subsequence
    """
def longest_balanced_subsequence(n: int, seq: str) -> int {
    max_len = 0;
    current_len = 0;
    balance = 0;
    for char in seq {
        if (char == '(') {
            balance += 1;
        } else {
            balance -= 1;
        }
        if (balance < 0) {
            max_len = max(max_len, current_len);
            balance = 0;
            current_len = 0;
        } else {
            current_len += 1;
            if (balance == 0) {
                max_len = max(max_len, current_len);
            }
        }
    }
    return max_len;
}

