"""
    Parses a string in the format "HH:MM:SS" and converts it into the total number of seconds.
    Returns 0 for empty input strings and -1 for incorrectly formatted strings.
    """
def parse_duration(duration_str: str) -> int {
    if (duration_str == "") {
        return 0;
    }
    parts = duration_str.split(":");
    if (len(parts) != 3) {
        return -1;
    }
    try {
        hours = int(parts[0]);
        minutes = int(parts[1]);
        seconds = int(parts[2]);
    } except ValueError {
        return -1;
    }
    if (
        (hours < 0)
        or (minutes < 0)
        or (minutes >= 60)
        or (seconds < 0)
        or (seconds >= 60)
    ) {
        return -1;
    }
    total_seconds = (hours * 3600) + (minutes * 60) + seconds;
    return total_seconds;
}

