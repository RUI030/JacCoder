"""
    This function calculates the number of distinct ways to climb to the top of the staircase
    taking either 1 or 2 steps at a time using O(1) space complexity.

    :param steps: int - total number of steps in the staircase.
    :return: int - number of distinct ways to reach the top.
    """
def climb_stairs_optimized(steps: int) -> int {
    if (steps <= 1) {
        return 1;
    }
    first = 1;
    second = 1;
    for _ in range(2, (steps + 1)) {
        current = first + second;
        first = second;
        second = current;
    }
    return second;
}

