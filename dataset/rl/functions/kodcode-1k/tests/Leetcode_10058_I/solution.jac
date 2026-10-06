import from typing { Any }
"""
    Determine if a person can attend all meetings without conflicts.

    Args:
    intervals: List of intervals where each interval is a list of two integers [start, end]

    Returns:
    Boolean value indicating if a person can attend all meetings
    """
def can_attend_meetings(intervals: list[list[int]]) -> bool {
    intervals.sort(key=lambda (x: Any) { x[0]; });
    for i in range(1, len(intervals)) {
        if (intervals[i][0] < intervals[(i - 1)][1]) {
            return False;
        }
    }
    return True;
}

