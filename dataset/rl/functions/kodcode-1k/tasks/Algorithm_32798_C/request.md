# total_journey_time

Calculates the total journey time for completing the bus route.

:param num_stops: The total number of bus stops.
:param intervals: A list of time intervals in minutes between each successive pair of bus stops.
:return: The total journey time in minutes.

>>> total_journey_time(2, [5])
5

>>> total_journey_time(5, [5, 10, 15, 20])
50

Implement `total_journey_time(num_stops: int, intervals: list[int]) -> int`.
