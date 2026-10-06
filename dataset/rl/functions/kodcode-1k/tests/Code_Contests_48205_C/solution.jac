import from typing { List, Tuple }
def max_people_working_simultaneously(n: int, intervals: list[tuple[int, int]]) -> int {
    events = [];
    for (start, end) in intervals {
        events.append((start, 'start'));
        events.append((end, 'end'));
    }
    events.sort();
    current_people = 0;
    max_people = 0;
    for (time, event_type) in events {
        if (event_type == 'start') {
            current_people += 1;
            max_people = max(max_people, current_people);
        } else {
            current_people -= 1;
        }
    }
    return max_people;
}

