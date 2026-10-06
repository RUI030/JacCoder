import from typing { Any }
"""
    Returns the maximum number of non-overlapping hackathon events.

    Parameters:
    n (int): The number of hackathon events.
    events (list): List of tuples, where each tuple contains two integers (si, ei) representing
                   the start and end times of each event.

    Returns:
    int: The maximum number of non-overlapping hackathon events that can be organized.
    """
def max_non_overlapping_events(n: int, events: list[tuple[int, int]]) -> int {
    events.sort(key=lambda (x: Any) { x[1]; });
    max_events = 0;
    last_end_time = 0;
    for (start, end) in events {
        if (start >= last_end_time) {
            max_events += 1;
            last_end_time = end;
        }
    }
    return max_events;
}

