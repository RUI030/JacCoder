"""
    Returns the maximum continuous green light duration.

    Arguments:
    n : int      -- number of intersections
    times : list -- green light durations at each intersection

    Returns:
    int -- max continuous green light duration
    """
def max_continuous_green_time(n: int, times: list[int]) -> int {
    max_duration = 0;
    current_duration = times[0];
    for i in range(1, n) {
        if (times[i] == times[(i - 1)]) {
            current_duration += times[i];
        } else {
            if (current_duration > max_duration) {
                max_duration = current_duration;
            }
            current_duration = times[i];
        }
    }
    if (current_duration > max_duration) {
        max_duration = current_duration;
    }
    return max_duration;
}
with entry {
    n = 4;
    times = [10, 20, 10, 30];
    assert (max_continuous_green_time(n, times) == 30);
}

