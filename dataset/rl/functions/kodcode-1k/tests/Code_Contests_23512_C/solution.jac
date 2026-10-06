def max_unique_intersections(directions: list[str]) -> int {
    direction_map = {'N': (1, 0), 'E': (0, 1), 'S': (-1, 0), 'W': (0, -1)};
    current_position = (0, 0);
    visited = {current_position};
    for direction in directions {
        move = direction_map[direction];
        current_position = (
            (current_position[0] + move[0]),
            (current_position[1] + move[1])
        );
        if (current_position in visited) {
            break;
        } else {
            visited.add(current_position);
        }
    }
    return len(visited);
}

