"""
    Given the number of topics n and the number of sessions m,
    returns the minimum additional sessions needed to distribute the topics
    as evenly as possible across all sessions.
    """
def minimum_additional_sessions(n: int, m: int) -> int {
    min_sessions_needed = n * (((m + n) - 1) // n);
    additional_sessions = max(0, (min_sessions_needed - m));
    return additional_sessions;
}

