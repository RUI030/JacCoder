# longest_run_active_servers

Determines the longest consecutive run of active servers.

Parameters:
n (int): Number of servers.
status_list (list): A list of integers denoting the status of each server (0 or 1).

Returns:
int: The length of the longest consecutive run of active servers.

Examples:
>>> longest_run_active_servers(6, [1, 1, 0, 1, 1, 1])
3
>>> longest_run_active_servers(5, [0, 0, 0, 0, 0])
0

Implement `longest_run_active_servers(n: int, status_list: list[int]) -> int`.
