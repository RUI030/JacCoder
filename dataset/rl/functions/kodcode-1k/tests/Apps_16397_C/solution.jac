def remaining_passengers(bus_stops: list[tuple[int, int]]) -> int {
    total_passengers = 0;
    for (onboard, alight) in bus_stops {
        total_passengers += onboard;
        total_passengers -= alight;
    }
    return total_passengers;
}

