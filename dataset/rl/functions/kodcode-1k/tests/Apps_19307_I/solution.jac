"""
    Determine if the bracket sequence can be balanced with at most M swap operations.
    """
def can_be_balanced(N: int, M: int, bracket_string: str) -> str {
    open_brackets = bracket_string.count('(');
    close_brackets = bracket_string.count(')');
    if (open_brackets != close_brackets) {
        return "NO";
    }
    balance = 0;
    swaps_needed = 0;
    for char in bracket_string {
        if (char == '(') {
            balance += 1;
        } else {
            balance -= 1;
        }
        if (balance < 0) {
            swaps_needed += 1;
            balance += 2;
        }
    }
    return "YES" if (swaps_needed <= M) else "NO";
}

