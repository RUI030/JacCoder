"""
    This function returns the nth term of the sequence defined as specified.
    """
def nth_term_of_sequence(n: int) -> int {
    if (n == 1) {
        return 1;
    }
    terms = [1];
    for i in range(2, (n + 1)) {
        next_term = (2 * sum(terms)) + 1;
        terms.append(next_term);
    }
    return terms[-1];
}

