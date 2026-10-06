"""
    Returns the minimum number of rooms required where no two participant's
    skill level in the same room differs by more than k.
    """
def min_rooms(n: int, k: int, skill_levels: list[int]) -> int {
    skill_levels.sort();
    rooms = 0;
    i = 0;
    while (i < n) {
        rooms += 1;
        current_skill = skill_levels[i];
        while ((i < n) and ((skill_levels[i] - current_skill) <= k)) {
            i += 1;
        }
    }
    return rooms;
}

