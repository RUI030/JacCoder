def max_employees_logged_in(n: int, intervals: list[tuple[int, int]]) -> int {
    events = [];
    for interval in intervals {
        (login, logout) = interval;
        events.append((login, 1));
        events.append((logout, -1));
    }
    events.sort();
    max_logged_in = 0;
    current_logged_in = 0;
    for event in events {
        current_logged_in += event[1];
        if (current_logged_in > max_logged_in) {
            max_logged_in = current_logged_in;
        }
    }
    return max_logged_in;
}

