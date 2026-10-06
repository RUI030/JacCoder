def find_highest_congestion_stop(m: int, routes: list[list[int]]) -> int {
    stop_counts = {};
    for route in routes {
        stops = route[1:];
        for stop in stops {
            if (stop in stop_counts) {
                stop_counts[stop] += 1;
            } else {
                stop_counts[stop] = 1;
            }
        }
    }
    max_congestion = max(stop_counts.values());
    most_congested_stops = [
        stop
        for (stop, count) in stop_counts.items()
        if (count == max_congestion)
    ];
    return min(most_congested_stops);
}

