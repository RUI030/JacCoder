# find_highest_congestion_stop

Identify the stop with the highest congestion among a fleet of autonomous taxis.
>>> find_highest_congestion_stop(3, [[3, 1, 2, 3], [4, 2, 3, 4, 5], [2, 3, 6]]) == 3
>>> find_highest_congestion_stop(2, [[3, 10, 20, 30], [4, 10, 20, 25, 30]]) == 10

Implement `find_highest_congestion_stop(m: int, routes: list[list[int]]) -> int`.
