import from typing { Any }
"""
    Determines the maximum number of non-overlapping activities that can be attended.
    :param n: Number of activities
    :param intervals: List of tuples, each with start and end time of an activity
    :return: Maximum number of non-overlapping activities
    """
def max_activities(n: int, intervals: list[tuple[int, int]]) -> int {
    intervals.sort(key=lambda (x: Any) { x[1]; });
    count = 0;
    last_end_time = 0;
    for (start, end) in intervals {
        if (start >= last_end_time) {
            count += 1;
            last_end_time = end;
        }
    }
    return count;
}

