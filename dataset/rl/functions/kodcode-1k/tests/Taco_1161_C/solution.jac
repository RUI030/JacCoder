"""
    Determines the maximum magic power that can be collected by picking stones in an alternating color pattern.

    Parameters:
    - n (int): The number of stones.
    - stones (list of tuples): A list where each tuple contains a string representing the color and an integer
      representing the magic power of the stone.

    Returns:
    - int: The maximum magic power that can be collected.
    """
def max_magic_power(n: int, stones: list[tuple[str, int]]) -> int {
    if (n == 0) {
        return 0;
    }
    import from collections { defaultdict }
    max_power = defaultdict(int);
    for (color, power) in stones {
        current_max = (
            max(
                [
                    max_power[k]
                    for k in max_power.keys()
                    if (k != color)
                ],
                `default=0
            )
            + power
        );
        max_power[color] = max(max_power[color], current_max);
    }
    return max(max_power.values(), `default=0);
}
with entry {
    n = 5;
    stones = [("red", 5), ("blue", 10), ("red", 15), ("blue", 20), ("green", 25)];
    print(max_magic_power(n, stones));
}

