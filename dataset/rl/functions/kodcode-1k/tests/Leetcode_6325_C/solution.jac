"""
    Returns the number of tasks that can be performed and the maximum number of seconds used.

    Parameters:
    queries (list of int): List of seconds to wait for each task to be available.
    t (list of int): List of seconds required to complete each task.

    Returns:
    tuple: (number of tasks that can be performed, maximum seconds used)
    """
def tasks_completed_and_max_time(queries: list[int], t: list[int]) -> tuple[int, int] {
    completed_tasks = 0;
    max_time_used = 0;
    for i in range(len(queries)) {
        if (queries[i] >= t[i]) {
            completed_tasks += 1;
            max_time_used += t[i];
        }
    }
    return (completed_tasks, max_time_used);
}

