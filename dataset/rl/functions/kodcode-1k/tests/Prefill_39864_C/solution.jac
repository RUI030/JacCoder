"""
    Given a list of digits and a maximum repetition limit k,
    return the smallest number that can be formed without repeating any digit
    more than k times.
    """
def min_number_from_digits(digits: list[int], k: int) -> int {
    import from collections { Counter }
    count = Counter(digits);
    valid_digits = [];
    for (digit, freq) in sorted(count.items()) {
        valid_digits.extend(([digit] * min(freq, k)));
    }
    return int(''.join(map(str, valid_digits)));
}

