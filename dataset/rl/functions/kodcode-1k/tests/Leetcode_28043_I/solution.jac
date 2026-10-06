"""
    Returns the maximum number of songs that can be included without exceeding totalTime.
    """
def max_songs(durations: list[int], totalTime: int) -> int {
    durations.sort();
    total_duration = 0;
    song_count = 0;
    for duration in durations {
        if ((total_duration + duration) <= totalTime) {
            total_duration += duration;
            song_count += 1;
        } else {
            break;
        }
    }
    return song_count;
}

