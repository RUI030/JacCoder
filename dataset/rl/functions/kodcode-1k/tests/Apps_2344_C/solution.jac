"""
    Takes a list of integers representing durations in minutes and
    returns the total duration in the format "X hours Y minutes".
    """
def total_duration(durations: list[int]) -> str {
    total_minutes = sum(durations);
    hours = total_minutes // 60;
    minutes = total_minutes % 60;
    return f"{hours} hours {minutes} minutes";
}

