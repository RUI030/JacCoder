"""
    Returns the maximum number of additional people that can be seated
    without violating the social distancing rule.
    """
def max_additional_people(n: int, p: list[int]) -> int {
    if not p {
        return ((n + 1) // 2);
    }
    p.sort();
    seats = 0;
    seats += (p[0] - 1) // 2;
    for i in range(1, len(p)) {
        gap = p[i] - p[(i - 1)] - 1;
        if (gap > 0) {
            seats += (gap - 1) // 2;
        }
    }
    seats += (n - p[-1]) // 2;
    return seats;
}

