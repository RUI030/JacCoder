"""
    Given the number of incoming requests per time unit n and the total time units t,
    this function returns the maximum number of requests that can be processed.
    """
def max_requests_processed(n: int, t: int) -> int {
    return min(t, (n * t));
}

