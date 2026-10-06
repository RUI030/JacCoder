"""
    Returns the maximum number of logs the villager can jump over given the
    maximum jump height.

    Args:
    n -- Number of logs
    logs -- List of heights of each log
    j -- Maximum jump height of the villager

    Returns:
    Max number of jumpable logs
    """
def max_jumpable_logs(n: int, logs: list[int], j: int) -> int {
    count = 0;
    for log in logs {
        if (log <= j) {
            count += 1;
        }
    }
    return count;
}

