"""
    Determines the longest consecutive run of active servers.

    Parameters:
    n (int): Number of servers.
    status_list (list): A list of integers denoting the status of each server (0 or 1).

    Returns:
    int: The length of the longest consecutive run of active servers.
    """
def longest_run_active_servers(n: int, status_list: list[int]) -> int {
    max_run = 0;
    current_run = 0;
    for status in status_list {
        if (status == 1) {
            current_run += 1;
            if (current_run > max_run) {
                max_run = current_run;
            }
        } else {
            current_run = 0;
        }
    }
    return max_run;
}

