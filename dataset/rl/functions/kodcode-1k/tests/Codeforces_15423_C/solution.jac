def min_streetlights(n: int, m: int, positions: list[int], r: int) -> int {
    positions.sort();
    streetlights = 0;
    current_position = 0;
    i = 0;
    while (current_position < m) {
        farthest_position = -1;
        while ((i < n) and (positions[i] <= (current_position + r))) {
            farthest_position = positions[i] + r;
            i += 1;
        }
        if (farthest_position == -1) {
            return -1;
        }
        streetlights += 1;
        current_position = farthest_position;
    }
    return streetlights;
}

