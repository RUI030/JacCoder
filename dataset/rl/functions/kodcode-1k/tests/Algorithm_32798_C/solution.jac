"""
    Calculates the total journey time for completing the bus route.

    :param num_stops: The total number of bus stops.
    :param intervals: A list of time intervals in minutes between each successive pair of bus stops.
    :return: The total journey time in minutes.
    """
def total_journey_time(num_stops: int, intervals: list[int]) -> int {
    return sum(intervals);
}

