"""
    Determines which bulbs are on after performing the sequence of operations.

    :param n: integer, number of bulbs
    :return: list of integers, 1 if the bulb is on, 0 if it is off
    """
def toggle_bulbs(n: int) -> list[int] {
    bulbs = [0] * n;
    for k in range(1, (n + 1)) {
        for i in range((k - 1), n, k) {
            bulbs[i] = 1 - bulbs[i];
        }
    }
    return bulbs;
}

