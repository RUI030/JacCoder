"""
    Given an array of integers representing the amount of water stored in each container,
    calculate the maximum amount of water you can collect by selecting one container and optionally skipping one container after it.

    Args:
    containers (list of int): A list of integers representing the water in each container.

    Returns:
    int: The maximum amount of water that can be collected.
    """
def max_water_collected(containers: list[int]) -> int {
    n = len(containers);
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return containers[0];
    }
    max_collect = [0] * n;
    max_collect[0] = containers[0];
    max_collect[1] = max(containers[0], containers[1]);
    for i in range(2, n) {
        max_collect[i] = max(
            max_collect[(i - 1)], (containers[i] + max_collect[(i - 2)])
        );
    }
    return max_collect[-1];
}

