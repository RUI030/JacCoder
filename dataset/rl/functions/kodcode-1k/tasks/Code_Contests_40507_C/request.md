# max_jumpable_logs

Returns the maximum number of logs the villager can jump over given the
maximum jump height.

Args:
n -- Number of logs
logs -- List of heights of each log
j -- Maximum jump height of the villager

Returns:
Max number of jumpable logs

Examples:
>>> max_jumpable_logs(5, [1, 2, 3, 4, 5], 3)
3
>>> max_jumpable_logs(3, [2, 2, 2], 1)
0

Implement `max_jumpable_logs(n: int, logs: list[int], j: int) -> int`.
