import from typing { Any }
"""
    Determines if a given list of task intervals can all be scheduled without overlap.

    Parameters:
        tasks (list of tuples): List of tuples, where each tuple contains two integers representing the start and end times of a task.

    Returns:
        bool: True if no tasks overlap, or False otherwise.
    """
def is_valid_schedule(tasks: list[tuple[int, int]]) -> bool {
    tasks.sort(key=lambda (x: Any) { x[0]; });
    for i in range(1, len(tasks)) {
        if (tasks[i][0] < tasks[(i - 1)][1]) {
            return False;
        }
    }
    return True;
}

