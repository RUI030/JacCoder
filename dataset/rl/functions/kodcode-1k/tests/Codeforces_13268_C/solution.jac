def determine_treasure_locations(treasure_points: list[tuple[int, int]], query_points: list[tuple[int, int]]) -> list[str] {
    treasure_set = `set((x, y) for (x, y) in treasure_points);
    result = [];
    for (x, y) in query_points {
        if ((x, y) in treasure_set) {
            result.append("Treasure");
        } else {
            result.append("Empty");
        }
    }
    return result;
}

