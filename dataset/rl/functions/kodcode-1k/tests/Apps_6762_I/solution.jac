import from typing { Any }
"""
    Merges a collection of overlapping intervals.
    :param intervals: List of intervals where each interval is represented as [start, end].
    :return: List of merged intervals.
    """
def merge_intervals(intervals: list[list[int]]) -> list[list[int]] {
    if not intervals {
        return [];
    }
    intervals.sort(key=lambda (x: Any) { x[0]; });
    merged_intervals = [intervals[0]];
    for current in intervals[1:] {
        last_merged = merged_intervals[-1];
        if (current[0] <= last_merged[1]) {
            last_merged[1] = max(last_merged[1], current[1]);
        } else {
            merged_intervals.append(current);
        }
    }
    return merged_intervals;
}

